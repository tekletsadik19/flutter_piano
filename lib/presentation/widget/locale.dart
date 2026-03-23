import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

extension LangUtils on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;
}
