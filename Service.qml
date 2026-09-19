import QtQuick

// Headless service entry point. It renders nothing; it exists because of how
// omarchy-shell scopes capabilities:
//
//   - A third-party *bar widget* receives a PluginBarApi facade as `bar`,
//     which carries no `barWidgetRegistry`. Without a registry the tray
//     cannot resolve the component for a captured widget, so every hosted
//     widget rendered at zero size.
//   - A plugin *service* does get `barWidgetRegistry` injected (a live
//     snapshot of the widget catalog, refreshed on every registry change).
//
// Tray.qml looks this service up through `bar.shell.serviceFor(...)` and
// reads the registry from here.
QtObject {
  id: service

  // Injected by omarchy-shell.
  property var shell: null
  property var barWidgetRegistry: null
  property var pluginRegistry: null
}
