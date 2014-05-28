/*
 * Copyright (c) 2014 Meltytech, LLC
 * Author: Dan Dennedy <dan@dennedy.org>
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

#ifndef MLTXMLGPUCHECKER_H
#define MLTXMLGPUCHECKER_H

#include <QXmlStreamReader>

class QUIDevice;

class MltXmlGpuChecker
{
public:
    MltXmlGpuChecker();
    bool check(QIODevice *device);
    QString errorString() const;
    bool needsGPU() const { return m_needsGPU; }
    bool hasEffects() const { return m_hasEffects; }

private:
    void readMlt();
    void readProperty();

    QXmlStreamReader m_xml;
    bool m_needsGPU;
    bool m_hasEffects;
};

#endif // MLTXMLGPUCHECKER_H
