import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../presentation/view/piano.dart';
import '../../domain/entities/lesson.dart';

class LessonDetailScreen extends StatefulWidget {
  const LessonDetailScreen({super.key, required this.lesson});
  final Lesson lesson;

  @override
  State<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  int _step = 0;
  final _audioPlayer = AudioPlayer();
  bool _audioPlaying = false;
  Duration _audioDuration = Duration.zero;
  Duration _audioPosition = Duration.zero;
  YoutubePlayerController? _ytController;

  List<_Step> get _steps {
    final c = widget.lesson.content;
    return [
      if (c?.conceptText != null || c?.diagramUrl != null)
        _Step.concept,
      if (c?.audioUrl != null)
        _Step.listen,
      if (c?.youtubeVideoId != null)
        _Step.watch,
      _Step.practice,
    ];
  }

  @override
  void initState() {
    super.initState();
    final videoId = widget.lesson.content?.youtubeVideoId;
    if (videoId != null) {
      _ytController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
      );
    }
    _audioPlayer.onDurationChanged.listen((d) {
      if (mounted) setState(() => _audioDuration = d);
    });
    _audioPlayer.onPositionChanged.listen((p) {
      if (mounted) setState(() => _audioPosition = p);
    });
    _audioPlayer.onPlayerComplete.listen((_) {
      if (mounted) setState(() => _audioPlaying = false);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _ytController?.dispose();
    super.dispose();
  }

  Future<void> _toggleAudio() async {
    final url = widget.lesson.content?.audioUrl;
    if (url == null) return;
    if (_audioPlaying) {
      await _audioPlayer.pause();
    } else {
      if (_audioPosition == Duration.zero) {
        await _audioPlayer.play(UrlSource(url));
      } else {
        await _audioPlayer.resume();
      }
    }
    setState(() => _audioPlaying = !_audioPlaying);
  }

  void _next() {
    if (_step < _steps.length - 1) {
      setState(() => _step++);
    }
  }

  void _prev() {
    if (_step > 0) setState(() => _step--);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final steps = _steps;
    final current = steps.isNotEmpty ? steps[_step] : _Step.practice;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.lesson.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.lesson.level.name[0].toUpperCase() +
                  widget.lesson.level.name.substring(1),
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: _StepIndicator(current: _step, total: steps.length),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: KeyedSubtree(
                key: ValueKey(_step),
                child: switch (current) {
                  _Step.concept => _ConceptStep(lesson: widget.lesson),
                  _Step.listen  => _ListenStep(
                      lesson: widget.lesson,
                      isPlaying: _audioPlaying,
                      duration: _audioDuration,
                      position: _audioPosition,
                      onToggle: _toggleAudio,
                      onSeek: (v) => _audioPlayer.seek(
                        Duration(
                          milliseconds:
                              (v * _audioDuration.inMilliseconds).toInt(),
                        ),
                      ),
                    ),
                  _Step.watch   => _WatchStep(controller: _ytController!),
                  _Step.practice => _PracticeStep(lesson: widget.lesson),
                },
              ),
            ),
          ),
          _BottomNav(
            step: _step,
            total: steps.length,
            currentStep: current,
            lesson: widget.lesson,
            onPrev: _step > 0 ? _prev : null,
            onNext: _step < steps.length - 1 ? _next : null,
          ),
        ],
      ),
    );
  }
}

// ── Steps enum ────────────────────────────────────────────────────────────────

enum _Step { concept, listen, watch, practice }

// ── Step indicator ────────────────────────────────────────────────────────────

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({required this.current, required this.total});
  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(total, (i) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: i == current ? 16 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: i == current ? color : color.withAlpha(60),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}

// ── Concept step ──────────────────────────────────────────────────────────────

class _ConceptStep extends StatelessWidget {
  const _ConceptStep({required this.lesson});
  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final c = lesson.content;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (c?.diagramUrl != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: _DiagramImage(url: c!.diagramUrl!),
              ),
            ),
            const SizedBox(height: 20),
          ],
          Text(
            'Concept',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            lesson.title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          if (c?.conceptText != null)
            Text(
              c!.conceptText!,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.7),
            ),
          const SizedBox(height: 20),
          _MetaRow(lesson: lesson),
        ],
      ),
    );
  }
}

class _DiagramImage extends StatelessWidget {
  const _DiagramImage({required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    if (url.endsWith('.svg')) {
      return SvgPicture.network(
        url,
        height: 180,
        fit: BoxFit.contain,
        placeholderBuilder: (_) => const SizedBox(
          height: 180,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: url,
      height: 180,
      fit: BoxFit.contain,
      placeholder: (_, __) => const SizedBox(
        height: 180,
        child: Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (_, __, ___) => const SizedBox(
        height: 180,
        child: Center(child: Icon(Icons.broken_image_outlined)),
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.lesson});
  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: [
        _Chip(
          icon: HugeIcons.strokeRoundedClock01,
          label: '${lesson.durationMinutes} min',
          theme: theme,
        ),
        _Chip(
          icon: HugeIcons.strokeRoundedDiploma,
          label: lesson.level.name[0].toUpperCase() +
              lesson.level.name.substring(1),
          theme: theme,
        ),
        if (lesson.path != LessonPath.both)
          _Chip(
            icon: HugeIcons.strokeRoundedMusicNote01,
            label: lesson.path == LessonPath.soloist ? 'Soloist' : 'Chords',
            theme: theme,
          ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.icon, required this.label, required this.theme});
  final List<List<dynamic>> icon;
  final String label;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HugeIcon(icon: icon, size: 13, color: theme.colorScheme.primary),
          const SizedBox(width: 5),
          Text(label, style: theme.textTheme.labelSmall),
        ],
      ),
    );
  }
}

// ── Listen step ───────────────────────────────────────────────────────────────

class _ListenStep extends StatelessWidget {
  const _ListenStep({
    required this.lesson,
    required this.isPlaying,
    required this.duration,
    required this.position,
    required this.onToggle,
    required this.onSeek,
  });

  final Lesson lesson;
  final bool isPlaying;
  final Duration duration;
  final Duration position;
  final VoidCallback onToggle;
  final ValueChanged<double> onSeek;

  String _fmt(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = duration.inMilliseconds > 0
        ? position.inMilliseconds / duration.inMilliseconds
        : 0.0;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'LISTEN',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Hear it first',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Listen to the demo before you play. Build the sound in your head.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: onToggle,
                    icon: HugeIcon(
                      icon: isPlaying
                          ? HugeIcons.strokeRoundedPause
                          : HugeIcons.strokeRoundedPlay,
                      color: theme.colorScheme.onPrimary,
                      size: 32,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  lesson.title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 4,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 6,
                    ),
                  ),
                  child: Slider(
                    value: progress.clamp(0.0, 1.0),
                    onChanged: onSeek,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_fmt(position),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          )),
                      Text(_fmt(duration),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

// ── Watch step ────────────────────────────────────────────────────────────────

class _WatchStep extends StatelessWidget {
  const _WatchStep({required this.controller});
  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WATCH',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.primary,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Video lesson',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Watch a teacher demonstrate the concept before you practice.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: theme.colorScheme.primary,
        ),
      ],
    );
  }
}

// ── Practice step ─────────────────────────────────────────────────────────────

class _PracticeStep extends StatelessWidget {
  const _PracticeStep({required this.lesson});
  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PRACTICE',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Time to play',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Open the piano and practice what you just learned.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          _TipCard(theme: theme),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const Piano()),
              ),
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedMusicNote01,
                color: theme.colorScheme.onPrimary,
                size: 20,
              ),
              label: const Text('Open Piano'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  const _TipCard({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withAlpha(80),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: theme.colorScheme.primary.withAlpha(40),
        ),
      ),
      child: Column(
        children: [
          _TipRow(
            icon: HugeIcons.strokeRoundedThumbsUp,
            text: 'Start slow — speed comes with repetition',
            theme: theme,
          ),
          const SizedBox(height: 10),
          _TipRow(
            icon: HugeIcons.strokeRoundedListView,
            text: 'Practice each hand separately first',
            theme: theme,
          ),
          const SizedBox(height: 10),
          _TipRow(
            icon: HugeIcons.strokeRoundedRepeat,
            text: 'Repeat difficult sections in isolation',
            theme: theme,
          ),
        ],
      ),
    );
  }
}

class _TipRow extends StatelessWidget {
  const _TipRow({
    required this.icon,
    required this.text,
    required this.theme,
  });
  final List<List<dynamic>> icon;
  final String text;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HugeIcon(icon: icon, size: 16, color: theme.colorScheme.primary),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodySmall?.copyWith(height: 1.4),
          ),
        ),
      ],
    );
  }
}

// ── Bottom nav ────────────────────────────────────────────────────────────────

class _BottomNav extends StatelessWidget {
  const _BottomNav({
    required this.step,
    required this.total,
    required this.currentStep,
    required this.lesson,
    required this.onPrev,
    required this.onNext,
  });

  final int step;
  final int total;
  final _Step currentStep;
  final Lesson lesson;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLast = step == total - 1;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.outlineVariant.withAlpha(80),
          ),
        ),
      ),
      child: Row(
        children: [
          if (onPrev != null)
            OutlinedButton.icon(
              onPressed: onPrev,
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedArrowLeft01,
                size: 16,
                color: theme.colorScheme.onSurface,
              ),
              label: const Text('Back'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            )
          else
            const SizedBox.shrink(),
          const Spacer(),
          if (!isLast)
            FilledButton.icon(
              onPressed: onNext,
              label: const Text('Next'),
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedArrowRight01,
                size: 16,
                color: theme.colorScheme.onPrimary,
              ),
              iconAlignment: IconAlignment.end,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
        ],
      ),
    );
  }
}
