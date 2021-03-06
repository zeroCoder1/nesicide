#include "musiceditorform.h"
#include "ui_musiceditorform.h"

#include "Source/FamiTracker.h"
#include "Source/cqtmfc_famitracker.h"

#include "cqtmfc.h"

MusicEditorForm* MusicEditorForm::_instance = NULL;

MusicEditorForm* MusicEditorForm::instance()
{
   if ( !_instance )
   {
      _instance = new MusicEditorForm(QString(),QByteArray());
   }

   return _instance;
}

MusicEditorForm::MusicEditorForm(QString fileName,QByteArray musicData,IProjectTreeViewItem* link,QWidget* parent) :
   CDesignerEditorBase(link,parent),
   ui(new Ui::MusicEditorForm)
{
   ui->setupUi(this);
   
   // Initialize FamiTracker...
   ideifyFamiTracker();
   qtMfcInit(this);
   AfxGetApp()->InitInstance();   
   
   setCentralWidget(AfxGetMainWnd()->toQWidget());
   
   QObject::connect(AfxGetApp()->m_pMainWnd,SIGNAL(addToolBarWidget(QToolBar*)),this,SIGNAL(addToolBarWidget(QToolBar*)));
   QObject::connect(AfxGetApp()->m_pMainWnd,SIGNAL(removeToolBarWidget(QToolBar*)),this,SIGNAL(removeToolBarWidget(QToolBar*)));
   QObject::connect(AfxGetApp()->m_pMainWnd,SIGNAL(editor_modificationChanged(bool)),this,SLOT(editor_modificationChanged(bool)));
}

MusicEditorForm::~MusicEditorForm()
{
   // Close FamiTracker.
   AfxGetMainWnd()->OnClose();   
   AfxGetApp()->ExitInstance();

   delete ui;
}

void MusicEditorForm::editor_modificationChanged(bool m)
{
   setModified(m);
   
   emit editor_modified(m);
}

void MusicEditorForm::onSave()
{
   CDesignerEditorBase::onSave();

   CFamiTrackerDoc* pDoc = (CFamiTrackerDoc*)AfxGetMainWnd()->GetActiveDocument();

   pDoc->OnSaveDocument((TCHAR*)m_fileName.toAscii().constData()); 
   
   setModified(false);
}

void MusicEditorForm::onClose()
{   
   openFile("");
}

QMessageBox::StandardButton MusicEditorForm::onCloseQuery()
{
   QMessageBox::StandardButton doSave;
   
   doSave = CDesignerEditorBase::onCloseQuery();
   if ( doSave == QMessageBox::No )
   {
      // Need to nix the MFC modified flag.
      CFamiTrackerDoc* pDoc = (CFamiTrackerDoc*)AfxGetMainWnd()->GetActiveDocument();
   
      pDoc->SetModifiedFlag(FALSE);
   }
   
   return doSave;
}
