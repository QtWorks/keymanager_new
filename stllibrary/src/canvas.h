#ifndef CANVAS_H
#define CANVAS_H

#include <QWidget>
#include <QPropertyAnimation>
#include <QtOpenGL/QGLWidget>
#include <QtOpenGL/QGLFunctions>
#include <QtOpenGL/QGLShaderProgram>
#include <QMatrix4x4>
#include "stllibrary_global.h"

class GLMesh;
class Mesh;
class Backdrop;

class STLLIBRARYSHARED_EXPORT Canvas : public QGLWidget, protected QGLFunctions
{
    Q_OBJECT

public:
    Canvas(const QGLFormat& format, QWidget* parent=0);

    void initializeGL();
    void paintEvent(QPaintEvent* event);
    ~Canvas();

    void view_orthographic();
    void view_perspective();

public slots:
    void set_status(const QString& s);
    void clear_status();
    void load_mesh(Mesh* m, bool is_reload);


protected:
    void mousePressEvent(QMouseEvent* event);
    void mouseReleaseEvent(QMouseEvent* event);
    void mouseMoveEvent(QMouseEvent* event);
    void wheelEvent(QWheelEvent* event);
    void resizeGL(int width, int height);
    void set_perspective(float p);
    float get_perspective() const;
    void view_anim(float v);


private:
    void draw_mesh();

    QMatrix4x4 transform_matrix() const;
    QMatrix4x4 view_matrix() const;

    QGLShaderProgram mesh_shader;
    QGLShaderProgram quad_shader;

    GLMesh* mesh;
    Backdrop* backdrop;

    QVector3D center;
    float scale;
    float zoom;
    float tilt;
    float yaw;

    float perspective;
    Q_PROPERTY(float perspective READ get_perspective WRITE set_perspective)
    QPropertyAnimation anim;

    QPoint mouse_pos;
    QString status;
};

#endif // CANVAS_H
