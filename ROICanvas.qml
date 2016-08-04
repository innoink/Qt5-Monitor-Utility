import QtQuick 2.0
import qmlroi 1.0

Rectangle {

    visible: true
    z: 1.0
    anchors.fill: parent
    color: "transparent"

    Canvas{
        id: canvas
        anchors.fill: parent

        property real x0
        property real x1
        property real y0
        property real y1
        property int rectCount: 0

        onPaint: {
            console.log("canvas is on paint");

            //draw rectangle to canvas
            var ctx = getContext('2d')
            ctx.strokeStyle = "red"
            ctx.strokeRect(x0, y0, x1-x0, y1-y0 )

            //add new rectangle to list

            arealist.listAllArea();


              /*TO DO: implementation of temporary rectangle*/
//            if( mouseArea.pressed ){
//                ctx.clearRect( x0-)
//            }

        }

        MouseArea{

            id: mouseArea
            anchors.fill: parent

            onPressed: {

                console.log("trigger pressed event");
                console.log("press pos: x = " + mouse.x + " y = " + mouse.y )
                canvas.x0 = mouse.x
                canvas.y0 = mouse.y
                //canvas.requestPaint()

            }


            onPositionChanged: {
                //console.log("trigger position changed event");
            }

            onReleased: {

                console.log("trigger release event");
                console.log("release pos: x = " + mouse.x + " y = " + mouse.y )
                canvas.x1 = mouse.x
                canvas.y1 = mouse.y

                canvas.rectCount = canvas.rectCount+1
                console.log("rectCount = " + canvas.rectCount )
                canvas.requestPaint()

            }

        }


    }

    SelectionAreaList{
        id: arealist
        //areaList:[
//            SelectionArea{ index: "0"
//                           x: "1"
//                           y: "1"
//                           width: "1"
//                           height: "1"
//            }
        //]
    }

}
