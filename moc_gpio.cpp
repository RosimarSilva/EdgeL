/****************************************************************************
** Meta object code from reading C++ file 'gpio.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.9.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "gpio.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gpio.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.9.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GPIO_t {
    QByteArrayData data[24];
    char stringdata0[327];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GPIO_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GPIO_t qt_meta_stringdata_GPIO = {
    {
QT_MOC_LITERAL(0, 0, 4), // "GPIO"
QT_MOC_LITERAL(1, 5, 18), // "changeLuminousMais"
QT_MOC_LITERAL(2, 24, 0), // ""
QT_MOC_LITERAL(3, 25, 19), // "changeLuminousMenos"
QT_MOC_LITERAL(4, 45, 18), // "changeWhiteBalance"
QT_MOC_LITERAL(5, 64, 13), // "changeEnhance"
QT_MOC_LITERAL(6, 78, 13), // "changeTelaLed"
QT_MOC_LITERAL(7, 92, 19), // "changeTelaPrincipal"
QT_MOC_LITERAL(8, 112, 11), // "changeGanho"
QT_MOC_LITERAL(9, 124, 4), // "foto"
QT_MOC_LITERAL(10, 129, 14), // "showPercentLed"
QT_MOC_LITERAL(11, 144, 8), // "powerOff"
QT_MOC_LITERAL(12, 153, 10), // "gpioExport"
QT_MOC_LITERAL(13, 164, 19), // "setDirectionGpioIke"
QT_MOC_LITERAL(14, 184, 24), // "setDirectionGpioLedBotao"
QT_MOC_LITERAL(15, 209, 22), // "setDirectionGpioBotao1"
QT_MOC_LITERAL(16, 232, 22), // "setDirectionGpioBotao2"
QT_MOC_LITERAL(17, 255, 22), // "setDirectionGpioBotao3"
QT_MOC_LITERAL(18, 278, 10), // "PutvalPin4"
QT_MOC_LITERAL(19, 289, 3), // "out"
QT_MOC_LITERAL(20, 293, 7), // "setTela"
QT_MOC_LITERAL(21, 301, 6), // "screen"
QT_MOC_LITERAL(22, 308, 13), // "setPercentLed"
QT_MOC_LITERAL(23, 322, 4) // "lado"

    },
    "GPIO\0changeLuminousMais\0\0changeLuminousMenos\0"
    "changeWhiteBalance\0changeEnhance\0"
    "changeTelaLed\0changeTelaPrincipal\0"
    "changeGanho\0foto\0showPercentLed\0"
    "powerOff\0gpioExport\0setDirectionGpioIke\0"
    "setDirectionGpioLedBotao\0"
    "setDirectionGpioBotao1\0setDirectionGpioBotao2\0"
    "setDirectionGpioBotao3\0PutvalPin4\0out\0"
    "setTela\0screen\0setPercentLed\0lado"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GPIO[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      19,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
      10,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,  109,    2, 0x06 /* Public */,
       3,    0,  110,    2, 0x06 /* Public */,
       4,    0,  111,    2, 0x06 /* Public */,
       5,    0,  112,    2, 0x06 /* Public */,
       6,    0,  113,    2, 0x06 /* Public */,
       7,    0,  114,    2, 0x06 /* Public */,
       8,    0,  115,    2, 0x06 /* Public */,
       9,    0,  116,    2, 0x06 /* Public */,
      10,    0,  117,    2, 0x06 /* Public */,
      11,    0,  118,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
      12,    0,  119,    2, 0x02 /* Public */,
      13,    0,  120,    2, 0x02 /* Public */,
      14,    0,  121,    2, 0x02 /* Public */,
      15,    0,  122,    2, 0x02 /* Public */,
      16,    0,  123,    2, 0x02 /* Public */,
      17,    0,  124,    2, 0x02 /* Public */,
      18,    1,  125,    2, 0x02 /* Public */,
      20,    1,  128,    2, 0x02 /* Public */,
      22,    1,  131,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,   19,
    QMetaType::Void, QMetaType::Int,   21,
    QMetaType::Void, QMetaType::Int,   23,

       0        // eod
};

void GPIO::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        GPIO *_t = static_cast<GPIO *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->changeLuminousMais(); break;
        case 1: _t->changeLuminousMenos(); break;
        case 2: _t->changeWhiteBalance(); break;
        case 3: _t->changeEnhance(); break;
        case 4: _t->changeTelaLed(); break;
        case 5: _t->changeTelaPrincipal(); break;
        case 6: _t->changeGanho(); break;
        case 7: _t->foto(); break;
        case 8: _t->showPercentLed(); break;
        case 9: _t->powerOff(); break;
        case 10: _t->gpioExport(); break;
        case 11: _t->setDirectionGpioIke(); break;
        case 12: _t->setDirectionGpioLedBotao(); break;
        case 13: _t->setDirectionGpioBotao1(); break;
        case 14: _t->setDirectionGpioBotao2(); break;
        case 15: _t->setDirectionGpioBotao3(); break;
        case 16: _t->PutvalPin4((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 17: _t->setTela((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 18: _t->setPercentLed((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            typedef void (GPIO::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GPIO::changeLuminousMais)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (GPIO::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GPIO::changeLuminousMenos)) {
                *result = 1;
                return;
            }
        }
        {
            typedef void (GPIO::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GPIO::changeWhiteBalance)) {
                *result = 2;
                return;
            }
        }
        {
            typedef void (GPIO::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GPIO::changeEnhance)) {
                *result = 3;
                return;
            }
        }
        {
            typedef void (GPIO::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GPIO::changeTelaLed)) {
                *result = 4;
                return;
            }
        }
        {
            typedef void (GPIO::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GPIO::changeTelaPrincipal)) {
                *result = 5;
                return;
            }
        }
        {
            typedef void (GPIO::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GPIO::changeGanho)) {
                *result = 6;
                return;
            }
        }
        {
            typedef void (GPIO::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GPIO::foto)) {
                *result = 7;
                return;
            }
        }
        {
            typedef void (GPIO::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GPIO::showPercentLed)) {
                *result = 8;
                return;
            }
        }
        {
            typedef void (GPIO::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GPIO::powerOff)) {
                *result = 9;
                return;
            }
        }
    }
}

const QMetaObject GPIO::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_GPIO.data,
      qt_meta_data_GPIO,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *GPIO::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GPIO::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GPIO.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int GPIO::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 19)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 19;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 19)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 19;
    }
    return _id;
}

// SIGNAL 0
void GPIO::changeLuminousMais()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void GPIO::changeLuminousMenos()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void GPIO::changeWhiteBalance()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void GPIO::changeEnhance()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void GPIO::changeTelaLed()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void GPIO::changeTelaPrincipal()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void GPIO::changeGanho()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void GPIO::foto()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void GPIO::showPercentLed()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void GPIO::powerOff()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
