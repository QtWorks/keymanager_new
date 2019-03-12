#include <QMenuBar>
#include <QMessageBox>
#include <QFileDialog>
#include "stlwindow.h"
#include "canvas.h"
#include "loader.h"

STLWindow::STLWindow(QWidget *parent) :
    QMainWindow(parent),
    open_action(new QAction("Open", this)),
    about_action(new QAction("About", this)),
    quit_action(new QAction("Quit", this)),
    perspective_action(new QAction("Perspective", this)),
    orthogonal_action(new QAction("Orthographic", this)),
    shaded_action(new QAction("Shaded", this)),
    wireframe_action(new QAction("Wireframe", this))
{
    setWindowTitle("fstl");
    setAcceptDrops(true);

    QSurfaceFormat format;
    format.setDepthBufferSize(24);
    format.setStencilBufferSize(8);
    format.setVersion(2, 1);
    format.setProfile(QSurfaceFormat::CoreProfile);

    QSurfaceFormat::setDefaultFormat(format);

    canvas = new Canvas(format, this);
    setCentralWidget(canvas);

    open_action->setShortcut(QKeySequence::Open);
    QObject::connect(open_action, &QAction::triggered,
                     this, &STLWindow::on_open);

    quit_action->setShortcut(QKeySequence::Quit);
    QObject::connect(quit_action, &QAction::triggered,
                     this, &STLWindow::close);

    QObject::connect(about_action, &QAction::triggered,
                     this, &STLWindow::on_about);
    auto file_menu = menuBar()->addMenu("File");
    file_menu->addAction(open_action);
    file_menu->addSeparator();
    file_menu->addAction(quit_action);

    auto view_menu = menuBar()->addMenu("View");
    auto projection_menu = view_menu->addMenu("Projection");
    projection_menu->addAction(perspective_action);
    projection_menu->addAction(orthogonal_action);
    auto projections = new QActionGroup(projection_menu);
    for (auto p : {perspective_action, orthogonal_action})
    {
        projections->addAction(p);
        p->setCheckable(true);
    }
    perspective_action->setChecked(true);
    projections->setExclusive(true);
    QObject::connect(projections, &QActionGroup::triggered,
                     this, &STLWindow::on_projection);

    auto draw_menu = view_menu->addMenu("Draw Mode");
    draw_menu->addAction(shaded_action);
    draw_menu->addAction(wireframe_action);
    auto drawModes = new QActionGroup(draw_menu);
    for (auto p : {shaded_action, wireframe_action})
    {
        drawModes->addAction(p);
        p->setCheckable(true);
    }
    shaded_action->setChecked(true);
    drawModes->setExclusive(true);
    QObject::connect(drawModes, &QActionGroup::triggered,
                     this, &STLWindow::on_drawMode);

    auto help_menu = menuBar()->addMenu("Help");
    help_menu->addAction(about_action);

    resize(600, 400);
}

void STLWindow::on_open()
{
    QString filename = QFileDialog::getOpenFileName(
                this, "Load .stl file", QString(), "*.stl");
    if (!filename.isNull())
    {
        load_stl(filename);
    }
}

void STLWindow::on_about()
{
    QMessageBox::about(this, "",
        "<p align=\"center\"><b>fstl</b></p>"
        "<p>A fast viewer for <code>.stl</code> files.<br>"
        "<a href=\"https://github.com/mkeeter/fstl\""
        "   style=\"color: #93a1a1;\">https://github.com/mkeeter/fstl</a></p>"
        "<p>© 2014-2017 Matthew Keeter<br>"
        "<a href=\"mailto:matt.j.keeter@gmail.com\""
        "   style=\"color: #93a1a1;\">matt.j.keeter@gmail.com</a></p>");
}

void STLWindow::on_bad_stl()
{
    QMessageBox::critical(this, "Error",
                          "<b>Error:</b><br>"
                          "This <code>.stl</code> file is invalid or corrupted.<br>"
                          "Please export it from the original source, verify, and retry.");
}

void STLWindow::on_empty_mesh()
{
    QMessageBox::critical(this, "Error",
                          "<b>Error:</b><br>"
                          "This file is syntactically correct<br>but contains no triangles.");
}

void STLWindow::on_confusing_stl()
{
    QMessageBox::warning(this, "Warning",
                         "<b>Warning:</b><br>"
                         "This <code>.stl</code> file begins with <code>solid </code>but appears to be a binary file.<br>"
                         "<code>fstl</code> loaded it, but other programs may be confused by this file.");
}

void STLWindow::on_missing_file()
{
    QMessageBox::critical(this, "Error",
                          "<b>Error:</b><br>"
                          "The target file is missing.<br>");
}

void STLWindow::enable_open()
{
    open_action->setEnabled(true);
}

void STLWindow::disable_open()
{
    open_action->setEnabled(false);
}

void STLWindow::on_projection(QAction* proj)
{
    if (proj == perspective_action)
    {
        canvas->view_perspective();
    }
    else
    {
        canvas->view_orthographic();
    }
}

void STLWindow::on_drawMode(QAction* mode)
{
    if (mode == shaded_action)
    {
        canvas->draw_shaded();
    }
    else
    {
        canvas->draw_wireframe();
    }
}

void STLWindow::on_loaded(const QString& filename)
{
    current_file = filename;
}

bool STLWindow::load_stl(const QString& filename, bool is_reload)
{
    if (!open_action->isEnabled())  return false;

    canvas->set_status("Loading " + filename);

    Loader* loader = new Loader(this, filename, is_reload);
    connect(loader, &Loader::started,
              this, &STLWindow::disable_open);

    connect(loader, &Loader::got_mesh,
            canvas, &Canvas::load_mesh);
    connect(loader, &Loader::error_bad_stl,
              this, &STLWindow::on_bad_stl);
    connect(loader, &Loader::error_empty_mesh,
              this, &STLWindow::on_empty_mesh);
    connect(loader, &Loader::warning_confusing_stl,
              this, &STLWindow::on_confusing_stl);
    connect(loader, &Loader::error_missing_file,
              this, &STLWindow::on_missing_file);

    connect(loader, &Loader::finished,
            loader, &Loader::deleteLater);
    connect(loader, &Loader::finished,
              this, &STLWindow::enable_open);
    connect(loader, &Loader::finished,
            canvas, &Canvas::clear_status);

    if (filename[0] != ':')
    {
        connect(loader, &Loader::loaded_file,
                  this, &STLWindow::setWindowTitle);
        connect(loader, &Loader::loaded_file,
                  this, &STLWindow::on_loaded);
    }

    loader->start();
    return true;
}
