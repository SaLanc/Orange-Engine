#include <QtGui>
#include "enginewindow.h"
#include "mapbox.h"
#include "input.h"
#include "globals.h"
#include "qrpgconsole.h"

EngineWindow::EngineWindow() : QDialog() {
  mapBox = new MapBox;
  QVBoxLayout * layout = new QVBoxLayout;
  layout->setContentsMargins(0, 0, 0, 0);
  setLayout(layout);
  layout->addWidget(mapBox);
  //qDebug() << "creating console widget";

  console = new QRPGConsole;
  mapBox->addWidget(console);
  console->hide();
  console->setGeometry(0, height() - 200, width(), 200);
  setWindowIcon(QIcon("pixmaps/orange.png"));
}

void EngineWindow::resizeEvent(QResizeEvent * event) {
  if(console) console->setGeometry(0, height() - 200, width(), 200);
}
