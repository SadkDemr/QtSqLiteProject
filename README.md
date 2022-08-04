
# Qml SqLite Project (Movies Database)

![Qt](https://github.com/SadkDemr/QtSqLiteProject/blob/main/QtSqLiteProject/Screenshot/Untitled%20Diagram.drawio.png?raw=true)

In my project, my goal is to display, sort, delete, update and insert a database containing int, string and image. And generating all of them in the Qt Creator environment.

[![linkedin](https://similarpng.com/popular-logo-youtube-icon-png/)]: https://www.youtube.com/watch?v=rjcuzN4VHIg&t=39s

## Main:
![Main](https://github.com/SadkDemr/QtSqLiteProject/blob/main/QtSqLiteProject/Screenshot/main.png?raw=true)

On this page, we have sorted and displayed the data we pulled from the database by integrating it into Qml.

```c++
//database.h
#define DATABASE_HOSTNAME   "moviesDataBase"
#define DATABASE_NAME       "movies.sqlite"

#define TABLE                   "movies_image" // table ismi degistirilmeli
#define TABLE_ID                "id"
#define TABLE_TITLE             "original_title"
#define TABLE_DATE             "release_date"
#define TABLE_TAG              "tagline"
#define TABLE_VOTE              "vote_average"
#define TABLE_IMAGE             "image"
```

## Insert Page:
![INSERT](https://github.com/SadkDemr/QtSqLiteProject/blob/main/QtSqLiteProject/Screenshot/insert.png?raw=true)

Data is added to the database on the page. The selected image appears on the screen. After adding, the database on the first page is automatically updated.

```c++
//database.cpp
bool DataBase::inserIntoTable(const QString &title, const QDate &date, const QString &tag, const QString &vote, const QString &image)
{


    QSqlQuery query;

    query.prepare(
                "INSERT INTO " TABLE
                " ("
                TABLE_TITLE ", "
                TABLE_DATE ", "
                TABLE_TAG ","
                TABLE_VOTE ","
                TABLE_IMAGE ") "
                "VALUES (:Title, :Date, :Tag, :Vote, :Image)");

//QTime fonksiyonu ile anlık gelen saat, dakika ve saniyeyi yazdırıyoruz.
//We print the instantaneous hours, minutes and seconds with QTime.
  QTime time = QTime::currentTime();
     QString text = time.toString("hh.mm.ss.z");
     if ((time.second() % 2) == 0)
         text[2] = ' ';
    qDebug()<< text;

//QFileInfo ile aldığımız dosya yolundan adını çekiyoruz
//We pull the name from the file path with QFileInfo.
    QString filePath = image;
    QFileInfo info(filePath) ;
    QString fileName = info.fileName();
    qDebug()<< filePath;

/*
Bu bölümde yaptığımız işlem, Qml tarafında FileDialog seçilen dosyanın uzantısını bu tipte gönderiyor;
"//file:///C:/Users/msdemir/Downloads/2548a.jpg" başında bulunan "//file:///" uzantı sebebiyle proje
dosyamızda bulunan movies_img klasörümüze kopyalama işlemi yapamıyoruz.Bu nedenle belirttiğimiz uzantıyı
temp.remove ile silerek dosyayı "C:/Users/msdemir/Downloads/2548a.jpg" bu konuma getiriyoruz. Daha sonra
uzantıyı değiştirip yukarıda info.fileName ile adını, QTime ile saati çekip movies_img klasörüne dosyamızı
kopyalıyoruz.

What we do in this section, FileDialog on the Qml side sends the extension of the selected file in this type;
"//file:///C:/Users/msdemir/Downloads/2548a.jpg" head of "//file:///" We cannot copy to the movies_img folder
in the project file due to the extension.Therefore, the extension we specifiedWe bring the file
"C:/Users/msdemir/Downloads/2548a.jpg" to this location by deleting it with temp.remove.Later on We change the extension
and extract the name with info.fileName above, the time with QTime and save the file to the movies_img folder we copy.

*/
    QString temp = image;//file:///C:/Users/msdemir/Downloads/2548a.jpg
    temp.remove(0,8);
    QFile file(temp);
    QString path = "C:/Users/msdemir/Desktop/QTProje/QtSqLiteProject/movies_img/"+ text + "_" + fileName  ;
    file.copy(path);
    qDebug()<< path;


    query.bindValue(":Title",      title);
    query.bindValue(":Date",      date);
    query.bindValue(":Tag",        tag);
    query.bindValue(":Vote",       vote);
    query.bindValue(":Image",     path , QSql::In | QSql::Binary);


    if(!query.exec()){
        qDebug() << "error insert into " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }

    return false;


}
```
## Update Page:

![Update](https://github.com/SadkDemr/QtSqLiteProject/blob/main/QtSqLiteProject/Screenshot/update.png?raw=true)

On this page, editing and updating the data of the selected column is performed. The selected data is automatically included in the TextField. This makes the editing process easier. Although it does not appear in the image, there are delete, edit and close options in the menu that opens after clicking on the arm.

## Setting Page:

![Update](https://github.com/SadkDemr/QtSqLiteProject/blob/main/QtSqLiteProject/Screenshot/setting.png?raw=true)

This page is the most important page. Here, QSetting structure and QLinguist structures are used. Thanks to QSetting, variables such as the background image and font type take a place from the CPU independent of the application, and even if the application is closed, it opens as we saved it. Linguist, on the other hand, provides a translation without an online translation.

```c++
//mysamplesettings.cpp
void MySampleSettings::createSettingsGroup()
{
    qDebug() << "Settings group creating...";

    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomColors");
    settings.setValue("sampleColor", "grey");
    settings.setValue("fontType", "QFont(Algerian,24,-1,5,50,0,0,0,0,0,Regular)");
    settings.setValue("fontSize",24);
    settings.endGroup();
    qDebug() << "Settings group created...";
}
```
If the settings don't exist, it creates them. This only happens the first time the program runs, it won't happen again.

### Linguist

With the program called Qt Linguist, you can easily translate the applications you make with Qt into other languages. With this program, you can take the translatable parts of a program and translate them into the language you want and save them. Later, you can easily integrate your saved translations into the program.

First, we add .ts files to the .pro file, how many languages we want to add to our project.

```c++
//.pro
TRANSLATIONS = translator/HelloWorld_ENG.ts\
               translator/HelloWorld_TR.ts\
                               translator/HelloWorld_GER.ts\
```
Then we do the file operations as follows
```c++
C:\Qt\5.15.2\msvc2019_64\bin\lupdate.exe QtSqLiteProject.pro

C:\Qt\5.15.2\msvc2019_64\bin\linguist.exe

C:\Qt\5.15.2\msvc2019_64\bin\lrelease.exe QtSqLiteProject.pro

```

![Linguist](https://github.com/SadkDemr/QtSqLiteProject/blob/main/QtSqLiteProject/Screenshot/linguist.png?raw=true)

From here, we change the languages of the titles we set. By clicking on the folder cursor in the upper left, we must select the files with the .ts extension and manually change the title and text languages in them and save them.
It updates the .qm files in our k project with the ~\bin\lrelease.exe command.

Then we move on to the integration phase of our project.

```c++
//MyLang.h
#include <QObject>
#include <QLocale>

class MyLang : public QObject
{
    Q_OBJECT
public:
    MyLang() {}

    enum E_Languages
    {
        ENG = QLocale::English,
        TR =  QLocale::Turkish,
        GER = QLocale::German
    };

    Q_ENUM(E_Languages)
};
```
```c++
//main.cpp
 MyTranslator mTrans(&app);
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("MyTrans",(QObject*)&mTrans);
    qmlRegisterType<MyLang>("MyLang", 1, 0, "MyLang");
```

```c++
//Qml example
text: qsTr("Background Color") + MyTrans.emptyString
```

And finished.


## 🛠 Skills
Qt, Qml, C++ ... 


## Feedback

If you have any feedback, please reach out to us at msadikdemir54321@gmail.com


## 🔗 Links

[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/muhammed-sadık-demir-4138821b7/)



