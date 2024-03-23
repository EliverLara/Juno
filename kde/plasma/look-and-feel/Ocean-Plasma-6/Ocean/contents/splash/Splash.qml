import QtQuick 2.5


Rectangle {
    id: root
   // source: "images/Nordic.png"
   color:"#0E1318"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Image {
            id: logo
            //match SDDM/lockscreen avatar positioning
            property real size: units.gridUnit * 12

            anchors.centerIn: parent

            source: "images/logo.png"

            sourceSize.width: 140
            sourceSize.height: 140        
        }

        Image {
            id: circle
            //match SDDM/lockscreen avatar positioning
            property real size: units.gridUnit * 12

            anchors.centerIn: parent

            source: "images/circle.png"

            sourceSize.width: 170
            sourceSize.height: 170

            ParallelAnimation {
                running: true

                ScaleAnimator {
                    target: circle
                    from: 0
                    to: 1
                    duration: 700
                }

                SequentialAnimation {
                    loops: Animation.Infinite

                    ScaleAnimator {
                        target: circle
                        from: 0.97
                        to: 1
                        duration: 1000
                    }
                    ScaleAnimator {
                        target: circle
                        from: 1
                        to: 0.97
                        duration: 1000
                    }
                }
            }
        
        }

        Rectangle {
            radius: 4
            color: "#2F3339"
            opacity: 0.9
            y: parent.height - (parent.height - logo.y) / 3 - height/2
            anchors.horizontalCenter: parent.horizontalCenter
            height: 6
            width: height*32
            Rectangle {
                radius: 3
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
                width: (parent.width / 6) * (stage - 1)
                color: "#00A9A5"
                Behavior on width { 
                    PropertyAnimation {
                        duration: 250
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }

    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
