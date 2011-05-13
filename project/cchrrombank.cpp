#include "cchrrombank.h"

CCHRROMBank::CCHRROMBank(IProjectTreeViewItem* parent)
{
   // Add node to tree
   InitTreeItem(parent);

   // Allocate attributes
}

CCHRROMBank::~ CCHRROMBank()
{
}

bool CCHRROMBank::serialize(QDomDocument& doc, QDomNode& node)
{
   // Create the root element for the CHR-ROM object
   QDomElement chrromElement = addElement( doc, node, "chrrom" );
   QDomCDATASection dataSect = doc.createCDATASection(QByteArray::fromRawData((const char*)m_bankData, MEM_8KB).toBase64());
   chrromElement.appendChild(dataSect);
   return true;
}

bool CCHRROMBank::deserialize(QDomDocument& doc, QDomNode& node, QString& errors)
{
   // Read in the DOM element
   QDomElement chrromElement = doc.documentElement();

   return true;
}

QString CCHRROMBank::caption() const
{
   return "CHR Bank " + QString::number(m_bankIndex, 10);
}

void CCHRROMBank::contextMenuEvent(QContextMenuEvent*, QTreeView*)
{

}

void CCHRROMBank::openItemEvent(QTabWidget* tabWidget)
{
   if (m_editor)
   {
      if (m_editor->isVisible())
      {
         tabWidget->setCurrentWidget(m_editor);
      }
      else
      {
         tabWidget->addTab(m_editor, this->caption());
         tabWidget->setCurrentWidget(m_editor);
      }
   }
   else
   {
      m_editor = new CHRROMDisplayDialog(false, (qint8*)m_bankData,this);
      tabWidget->addTab(m_editor, this->caption());
      tabWidget->setCurrentWidget(m_editor);
   }
}

void CCHRROMBank::onSaveDocument()
{

}
