import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../data/lessons/curriculum_paths.dart';
import '../../domain/entities/curriculum_path.dart';

class CurriculumPathsScreen extends StatefulWidget {
  const CurriculumPathsScreen({super.key});

  @override
  State<CurriculumPathsScreen> createState() => _CurriculumPathsScreenState();
}

class _CurriculumPathsScreenState extends State<CurriculumPathsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _completedPaths = []; // TODO: Load from user progress

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Paths'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Beginner'),
            Tab(text: 'Intermediate'),
            Tab(text: 'Advanced'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _PathsList(paths: getAllPaths(), completedPaths: _completedPaths),
          _PathsList(
            paths: getPathsByType(PathType.beginner),
            completedPaths: _completedPaths,
          ),
          _PathsList(
            paths: getPathsByType(PathType.intermediate),
            completedPaths: _completedPaths,
          ),
          _PathsList(
            paths: getPathsByType(PathType.advanced) +
                getPathsByType(PathType.specialist),
            completedPaths: _completedPaths,
          ),
        ],
      ),
    );
  }
}

class _PathsList extends StatelessWidget {
  const _PathsList({
    required this.paths,
    required this.completedPaths,
  });

  final List<CurriculumPath> paths;
  final List<String> completedPaths;

  @override
  Widget build(BuildContext context) {
    if (paths.isEmpty) {
      return Center(
        child: Text(
          'No paths available',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: List.generate(
          paths.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _PathCard(
              path: paths[index],
              isCompleted: completedPaths.contains(paths[index].id),
              onTap: () => _showPathDetails(context, paths[index]),
            ),
          ),
        ),
      ),
    );
  }

  void _showPathDetails(BuildContext context, CurriculumPath path) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _PathDetailsSheet(path: path),
      isScrollControlled: true,
    );
  }
}

class _PathCard extends StatelessWidget {
  const _PathCard({
    required this.path,
    required this.isCompleted,
    required this.onTap,
  });

  final CurriculumPath path;
  final bool isCompleted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(12),
          border: isCompleted
              ? Border.all(color: Colors.green, width: 2)
              : Border.all(color: theme.colorScheme.outline.withAlpha(30)),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        path.title,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        path.description,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (isCompleted)
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green.withAlpha(20),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedCheckmarkCircle01,
                      color: Colors.green,
                      size: 20,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedBook01,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${path.lessonCount} lessons',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedClock01,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '~${path.estimatedHoursDuration}h',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PathDetailsSheet extends StatelessWidget {
  const _PathDetailsSheet({required this.path});

  final CurriculumPath path;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) => SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        path.title,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer
                              .withAlpha(80),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          path.type.name.toUpperCase(),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Description
            Text(
              'About This Path',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              path.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.6,
              ),
            ),
            const SizedBox(height: 20),

            // Target Audience
            Text(
              'Who Should Take This?',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              path.targetAudience,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),

            // Learning Outcomes
            Text(
              'What You\'ll Learn',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Column(
              children: path.outcomes
                  .map(
                    (outcome) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4, right: 8),
                            child: HugeIcon(
                              icon: HugeIcons
                                  .strokeRoundedCheckmarkCircle01,
                              size: 16,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              outcome,
                              style: theme.textTheme.bodySmall?.copyWith(
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),

            // Stats
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _StatItem(
                        label: 'Lessons',
                        value: path.lessonCount.toString(),
                        theme: theme,
                      ),
                      _StatItem(
                        label: 'Duration',
                        value: '~${path.estimatedHoursDuration}h',
                        theme: theme,
                      ),
                      _StatItem(
                        label: 'Difficulty',
                        value: path.type.name[0].toUpperCase() +
                            path.type.name.substring(1),
                        theme: theme,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Start button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                ),
                child: Text(
                  'Start Path',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
    required this.theme,
  });

  final String label;
  final String value;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
