/*
 * Copyright (c) 2013-2019 Meltytech, LLC
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.2
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

ToolBar {
    property alias scrub: scrubButton.checked
    property color checkedColor: Qt.rgba(activePalette.highlight.r, activePalette.highlight.g, activePalette.highlight.b, 0.4)
    property alias scaleSlider: scaleSlider

    SystemPalette { id: activePalette }

    width: 200
    height: settings.smallIcons? 28 : snapButton.height + 4
    anchors.margins: 0

    RowLayout {
        ToolButton {
            id: hiddenButton
            visible: false
        }
        ToolButton {
            action: menuAction
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
        }
        Button { // separator
            enabled: false
            implicitWidth: 1
            implicitHeight: 18
        }
        ToolButton {
            action: cutAction
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
        }
        ToolButton {
            action: copyAction
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
        }
        ToolButton {
            action: insertAction
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
        }
        Button { // separator
            enabled: false
            implicitWidth: 1
            implicitHeight: 18
        }
        ToolButton {
            action: appendAction
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
        }
        ToolButton {
            action: deleteAction
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
        }
        ToolButton {
            action: liftAction
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
        }
        ToolButton {
            action: overwriteAction
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
        }
        ToolButton {
            action: splitAction
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
        }
        Button { // separator
            enabled: false
            implicitWidth: 1
            implicitHeight: 18
        }
        ToolButton {
            id: snapButton
            checkable: true
            checked: settings.timelineSnap
            iconName: 'snap'
            iconSource: 'qrc:///icons/oxygen/32x32/actions/snap.png'
            tooltip: qsTr('Toggle snapping')
            onClicked: settings.timelineSnap = checked
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
        }
        ToolButton {
            id: scrubButton
            checkable: true
            iconName: 'scrub_drag'
            iconSource: 'qrc:///icons/oxygen/32x32/actions/scrub_drag.png'
            tooltip: qsTr('Scrub while dragging')
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
        }
        ToolButton {
            id: rippleButton
            checkable: true
            checked: settings.timelineRipple
            iconName: 'target'
            iconSource: 'qrc:///icons/oxygen/32x32/actions/target.png'
            tooltip: qsTr('Ripple trim and drop')
            text: qsTr('Ripple')
            onClicked: settings.timelineRipple = checked
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
        }
        ToolButton {
            id: rippleAllButton
            checkable: true
            checked: settings.timelineRippleAllTracks
            iconName: 'ripple-all'
            iconSource: 'qrc:///icons/oxygen/32x32/actions/ripple-all.png'
            tooltip: qsTr('Ripple edits across all tracks')
            text: qsTr('Ripple All')
            onClicked: settings.timelineRippleAllTracks = checked
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
        }
        Button { // separator
            enabled: false
            implicitWidth: 1
            implicitHeight: 18
        }
        ToolButton {
            action: zoomOutAction
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
        }
        ZoomSlider {
            id: scaleSlider
        }
        ToolButton {
            action: zoomInAction
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
        }

        ColorOverlay {
            id: snapColorEffect
            visible: settings.timelineSnap
            anchors.fill: snapButton
            source: snapButton
            color: checkedColor
            cached: true
        }
        ColorOverlay {
            id: scrubColorEffect
            visible: scrubButton.checked
            anchors.fill: scrubButton
            source: scrubButton
            color: checkedColor
            cached: true
        }
        ColorOverlay {
            id: rippleColorEffect
            visible: settings.timelineRipple
            anchors.fill: rippleButton
            source: rippleButton
            color: checkedColor
            cached: true
        }
        ColorOverlay {
            id: rippleAllColorEffect
            visible: settings.timelineRippleAllTracks
            anchors.fill: rippleAllButton
            source: rippleAllButton
            color: checkedColor
            cached: true
        }
    }

    Action {
        id: menuAction
        tooltip: qsTr('Display a menu of additional actions')
        iconName: 'format-justify-fill'
        iconSource: 'qrc:///icons/oxygen/32x32/actions/format-justify-fill.png'
        onTriggered: menu.popup()
    }

    Action {
        id: cutAction
        tooltip: qsTr('Cut - Copy the current clip to the Source\nplayer and ripple delete it')
        iconName: 'edit-cut'
        iconSource: 'qrc:///icons/oxygen/32x32/actions/edit-cut.png'
        enabled: timeline.selection.length
        onTriggered: timeline.removeSelection(true)
    }

    Action {
        id: copyAction
        tooltip: qsTr('Copy - Copy the current clip to the Source player (C)')
        iconName: 'edit-copy'
        iconSource: 'qrc:///icons/oxygen/32x32/actions/edit-copy.png'
        enabled: timeline.selection.length
        onTriggered: timeline.copyClip(timeline.selection[0].y, timeline.selection[0].x)
    }

    Action {
        id: insertAction
        tooltip: qsTr('Paste - Insert clip into the current track\nshifting following clips to the right (V)')
        iconName: 'edit-paste'
        iconSource: 'qrc:///icons/oxygen/32x32/actions/edit-paste.png'
        onTriggered: timeline.insert(currentTrack)
    }

    Action {
        id: appendAction
        tooltip: qsTr('Append to the current track (A)')
        iconName: 'list-add'
        iconSource: 'qrc:///icons/oxygen/32x32/actions/list-add.png'
        onTriggered: timeline.append(currentTrack)
    }

    Action {
        id: deleteAction
        tooltip: qsTr('Ripple Delete - Remove current clip\nshifting following clips to the left (X)')
        iconName: 'list-remove'
        iconSource: 'qrc:///icons/oxygen/32x32/actions/list-remove.png'
        onTriggered: timeline.removeSelection()
   }

    Action {
        id: liftAction
        tooltip: qsTr('Lift - Remove current clip without\naffecting position of other clips (Z)')
        iconName: 'lift'
        iconSource: 'qrc:///icons/oxygen/32x32/actions/lift.png'
        onTriggered: timeline.liftSelection()
    }

    Action {
        id: overwriteAction
        tooltip: qsTr('Overwrite clip onto the current track (B)')
        iconName: 'overwrite'
        iconSource: 'qrc:///icons/oxygen/32x32/actions/overwrite.png'
        onTriggered: timeline.overwrite(currentTrack)
    }

    Action {
        id: splitAction
        tooltip: qsTr('Split At Playhead (S)')
        iconName: 'slice'
        iconSource: 'qrc:///icons/oxygen/32x32/actions/slice.png'
        onTriggered: timeline.splitClip(currentTrack)
    }

    Action {
        id: zoomOutAction
        tooltip: qsTr("Zoom timeline out (-)")
        iconName: 'zoom-out'
        iconSource: 'qrc:///icons/oxygen/32x32/actions/zoom-out.png'
        onTriggered: root.zoomOut()
    }

    Action {
        id: zoomInAction
        tooltip: qsTr("Zoom timeline in (+)")
        iconName: 'zoom-in'
        iconSource: 'qrc:///icons/oxygen/32x32/actions/zoom-in.png'
        onTriggered: root.zoomIn()
    }
}
