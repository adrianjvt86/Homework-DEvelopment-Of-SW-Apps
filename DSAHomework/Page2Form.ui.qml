import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtCharts 2.2

Item {
    id: item1
    property alias chartView: chartView
    Connections {
        target: netManager
        onValueUpdated2: {
            series2.append(x, y)
            if (x > xAxis.max) {
                xAxis.max = x
            }
            if (y > yAxis.max) {
                yAxis.max = y
            }
        }
    }

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
            Text {
                id: text1
                color: "#e91e1e"
                text: qsTr("AAPL Close Values")
                font.italic: true
                font.pointSize: 20
            }
        }
    }
    Item {
        id: item2
        x: 0
        y: 58
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        ChartView {
            id: chartView
            title: "AAPL Close"
            anchors.fill: parent

            ValueAxis {
                id: yAxis
                titleText: "Close"
                titleVisible: true
                gridVisible: true
                tickCount: 11
                min: 0
                max: 2
            }
            DateTimeAxis {
                id: xAxis
                tickCount: 20
                visible: true
                labelsAngle: 90
                gridVisible: true
                format: "yyyy-MM-dd"
                min: "2017-07-17"
                max: "2017-12-01"
            }
            LineSeries {
                id: series2
                name: "AAPL Close"
                visible: true
                axisX: xAxis
                axisY: yAxis
            }
        }
    }
}
