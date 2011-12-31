import Qt 4.7
import "CharacterBox.js" as CharacterBoxScript

Box {
  id: characterBox
  property Item character
  property alias treeMenu: menuContainer.treeMenu
  property Item portrait

  //height: childrenRect.height
  //width: childrenRect.width

  state: "Show"
  height: 140
  width: 220

  onCharacterChanged: {
    portrait = c1.c2.characterPortrait
  }

  function showMenu() {
    CharacterBoxScript.startUp();
    treeMenu.show();
    console.log("showmenu for " + character.name);
  }

  Box {
    id: menuContainer
    width: 200
    height: 200
    objectName: "menuContainer"
    anchors.left: parent.right
    anchors.top: parent.top
    property Item treeMenu
  }

  MouseArea {
    anchors.fill: parent;
    onClicked: {
      console.log(characterBox.character.name + " clicked");
      battleScreen.doTargetSelect(characterBox.character);
    }
  }

  Column {
    id: c1
    objectName: "c1"
    x: 25
    y: 25
    height: parent.height - 50
    width: parent.width - 50
    /*
    height: childrenRect.height
    width: childrenRect.width
    */

    Item {
      id: c2
      objectName: "c2"
      height: 36
      width: 200
      Image {
        objectName: "characterPortrait"
        id: characterPortrait
        source: {
          if(character && character.portrait)
            character.portrait;
          else
            '';
        }
      }

      BindItem {
        x: 48
        id: characterName
        fmt.color: '#ff2'
        fmt.font.bold: true
        bind: if(character) character.name
      }
    }

    StatItem {
      id: hpDisplay
      title: "HP"
      bind: if(character) character.hp + " / " + character.current_maxHp;
    }

    StatItem {
      id: mpDisplay
      title: "MP"
      bind: if(character) character.mp + " / " + character.current_maxMp;
    }
  }


}