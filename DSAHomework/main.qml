import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtCharts 2.2


ApplicationWindow {
    visible: true
    width: 700
    height: 500
    title: qsTr("AAPL Stock TimeSeries")


    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {

        }

        Page2 {

        }
        Page3 {

        }

    }


    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("Open Stock")
        }
        TabButton {
            text: qsTr("Close Stock")
        }
        TabButton {
            text: qsTr("Volume Stock")
        }
    }
}
