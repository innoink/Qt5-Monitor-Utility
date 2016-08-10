import QtQuick 2.0
import QtQuick.Layouts 1.0
import "componentCreation.js" as ComponentCreateScript



Rectangle {

    id: chartRect
    height: 70
    border.color: "black"
    color: "white"
    property var canvas: null
    property int activeLineSeries: 0

    Text{
        id: title
        objectName: "text"
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        text: "LineSeries: "
    }

    Component.onCompleted: {

        canvas.addNewRect.connect( function(item){
            console.log("in ChartInfo")
            console.log("recvItem =" + item )

            chartRect.activeLineSeries += 1
            ComponentCreateScript.createLineSerisInfos( chartRect.activeLineSeries )
            chartInfo.height += 30

        })
    }

}



