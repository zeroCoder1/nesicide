#ifndef PROJECTPROPERTIESDIALOG_H
#define PROJECTPROPERTIESDIALOG_H

#include <QDialog>
#include <QtXml>
#include <QFileDialog>
#include <QFile>
#include <QMessageBox>

#include "cpaletteitemdelegate.h"
#include "cnesicideproject.h"
#include "cpropertyitem.h"
#include "csourceitem.h"

namespace Ui
{
class ProjectPropertiesDialog;
}

class ProjectPropertiesDialog : public QDialog
{
   Q_OBJECT
public:
   ProjectPropertiesDialog(QWidget* parent = 0);
   virtual ~ProjectPropertiesDialog();

protected:
   void changeEvent(QEvent* e);
   void serializeLinkerConfig();
   void deserializeLinkerConfig();

private:
   Ui::ProjectPropertiesDialog* ui;
   void updateUI(int colid = -1);
   QList<QColor> currentPalette;
   bool          linkerConfigChanged;
   CPropertyListModel* tilePropertyListModel;

private slots:
   void on_propertyTableView_doubleClicked(QModelIndex index);
   void on_removeProperty_clicked();
   void on_addProperty_clicked();
   void on_chrromOutputBasePathBrowse_clicked();
   void on_prgromOutputBasePathBrowse_clicked();
   void on_outputName_textEdited(QString );
   void on_linkerConfig_textChanged();
   void on_linkerConfigFileBrowse_clicked();
   void on_projectNameLineEdit_textEdited(QString );
   void on_projectOutputBasePathBrowse_clicked();
   void on_buttonBox_accepted();
   void on_compilerIncludePathBrowse_clicked();
   void on_assemblerIncludePathBrowse_clicked();
   void on_blueHorizontalSlider_actionTriggered(int action);
   void on_greenHorizontalSlider_actionTriggered(int action);
   void on_redHorizontalSlider_actionTriggered(int action);
   void on_ImportPalettePushButton_clicked();
   void on_exportPalettePushButton_clicked();
   void on_resetPalettePushButton_clicked();
   void on_tableWidget_cellClicked(int row, int column);
};

#endif // PROJECTPROPERTIESDIALOG_H
