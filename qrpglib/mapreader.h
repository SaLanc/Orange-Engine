#ifndef MAPREADER_H
#define MAPREADER_H

#include <QtCore>

class Map;
class Entity;

class MapReader : public QXmlStreamReader
{
public:
  Map * read(QIODevice * device);
  Map * read(QString filename);

private:
  void readMap();
  void readLayer();
  void readLayerData(QList<int> & layerData);
  void readEntities(QList < Entity * > & entities);
  Entity * readEntity();
  void readEntityScripts(Entity * e);
  void readScripts();

  void readUnknownElement();
  void tokenDebug();

  Map * map;
};

#endif // MAPREADER_H
