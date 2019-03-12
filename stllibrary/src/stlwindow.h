#ifndef STLWINDOW_H
#define STLWINDOW_H

#include <QMainWindow>
#include <QActionGroup>
#include <QFileSystemWatcher>
#include <QCollator>
#include "stllibrary_global.h"

class Canvas;

class STLLIBRARYSHARED_EXPORT STLWindow : public QMainWindow
{
    Q_OBJECT
public:
    explicit STLWindow(QWidget* parent=0);
    bool load_stl(const QString& filename, bool is_reload=false);

public slots:
    void on_open();
    void on_about();
    void on_bad_stl();
    void on_empty_mesh();
    void on_missing_file();
    void on_confusing_stl();

    void enable_open();
    void disable_open();

private slots:
    void on_projection(QAction* proj);
    void on_drawMode(QAction* mode);
    void on_loaded(const QString& filename);

private:
    QAction* const open_action;
    QAction* const about_action;
    QAction* const quit_action;
    QAction* const perspective_action;
    QAction* const orthogonal_action;
    QAction* const shaded_action;
    QAction* const wireframe_action;
    QString current_file;
    Canvas* canvas;
};

#endif // STLWINDOW_H
