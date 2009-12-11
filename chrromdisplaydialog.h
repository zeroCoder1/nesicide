#ifndef CHRROMDISPLAYDIALOG_H
#define CHRROMDISPLAYDIALOG_H

#include <QDialog>
#include "cchrrompreviewrenderer.h"

namespace Ui {
    class CHRROMDisplayDialog;
}

class CHRROMDisplayDialog : public QDialog {
    Q_OBJECT
public:
    CHRROMDisplayDialog(QWidget *parent = 0);
    ~CHRROMDisplayDialog();
    CCHRROMPreviewRenderer *renderer;

protected:
    void changeEvent(QEvent *e);

private:
    Ui::CHRROMDisplayDialog *ui;
};

#endif // CHRROMDISPLAYDIALOG_H