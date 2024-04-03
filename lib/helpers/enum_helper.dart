class EnumHelpers {
  static String humanize<T>(T value) {
    return value.toString().split('.').last.toUpperCase();
  }
}

enum NavDrawerItem {
  projects,
  workspace,
}

enum Type {
  iframe,
  logPage,
  workflow,
}

enum Level {
  tenant,
  workspace,
  project,
}
