# fibaconn

A project for Firebase projects testing
By Devoskropic through 207 Labz

## Getting Started -Notes- [^1].

On past projects ( wbsports and authapp) I've been learning on how to use Authentication plugin (firebase_auth), now is the turn to keep using it and expand to others.

Quick start guide: [non-official starting guide](https://medium.com/@rehmaankhan287/how-to-configure-your-flutter-app-with-firebase-using-firebase-cli-eca42248ae92)

Before implementing firebase plugins, I'll make the app a bit bigger, in this case I'm going to implement the [google codelab](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#0) related to the first flutter application, but instead of making it for desktop, I'll do it for cellphones and of course not following exactly the tutorial, but adding some more stuff. 

## Change Log - Version History [^2].

  - main.dart current version [2.2.1]

### Ver 2 

  - mainv2.2.1.dart
  
    - new main
    - main_provider [nf]
    - home_page [nf]
    - word_generator [nf]
    - added history_list_view 
    - big_card [nf]
    - fav_words [nf]

  - main_v2.2.0.dart

    - Added MultiProvider config to main

  - main_v2.1.0.dart 

    - MyHomePage now is at public directory as HomePage.dart
    - MyAppState now will be MainProvider @providers.
    - WordGeneratorPage now is WordGenerator @widgets.
    - FavsPage now is FavWords @widgets.
    - NavyRail now is located @widgets.

### Ver 1

  - main_v1.3.0.dart

    - Destination favsPage added.
    - MyHomePage is now statefulW.
    - ThemeData extracted.
    - NavyRail now can access to SetState of the stateful widget.

  - main_v1.2.0.dart

    - NavigationRail added into a SafeArea and extracted on same file as a statelessW.
    - GeneratorPage extracted on same file.
    - BigCard widget extracted to external file.
    - MyAppState|ChangeNotifier used to switch between rail destinations.

  - main_v1.0.1.dart

    - stateless widget.
    - next word and favorite buttons added into a Column: first shows the card, then a row containing both buttons Favs and Next.
    - no navRail or bottomNavBar.

### 13 Feb 2024
- I've made a lot of corrections and defined how is the project going to be structured, decided to create diferent main and its links to rest of files that could let me
generate the build of any version of it, since then now I'm going to track at least the changes of each file in this file, and maybe inside the respective file lead by a comment.
So at this point, every folder corresponding to a specific version will be related to old main file, and until now the curent version is 2.2.1 so, anything older at this point would be related to files corresponding on folders v2.2.0.


### 03 Feb 2024
- Around 10:28 hrs
  - Use of MediaQuery.of(context).size.width >= 640, to show icon labels on navRail: 
  - Wrapped the scaffold on a LayoutBuilder, add constraints to its args to use constraints.maxWidth < mobScreen val on px to show or not (null) the bottomNavBar

### 02 Feb 2024 
- I'm gonna modifying/adding stateful widgets for the correct function of navigationRail, and also configure the app to switch between bottomNavBar and navigationRail according to devide screen width, also I'm going to add by the end of the day a drawer menu.

- Around  20:53 hrs.
  - Ended ponit 7 of codelabs, constraints related to show/hide the labeled text on the navRail are set, later I'll add constraints to the bottomNavBar.

### 01 Feb 2024
- Created main_clone.dart file to add navigation rail (not as it comes in the codelab but, for mobile view), navigation rail stateful widget is not implemented yet.

### 31 Jan 2024
- No new changes, just uploading code in order to ensure it's portability, (next days I'll be working in another place and using other pc).
- Decided to start adding screens folliwing the codelab from google.

### 30 Jan 2024
I felt sick, so don't do anything 

### 29 Jan 2024 
- Untracked hour
  - Started google codelabs flutter codelab first, ended up 'till point 6 before going to sleep at midnight.

### 26 Jan 2024
- Around 02:12 hrs
  - added cloud_firestore pkg
  
### 25 Jan 2024
- Around 11:00 hrs
  - upgraded some packages, flutter and dart sdk, lints

### 24 Jan 2024
- Around 2:20 hrs
  - first install on device

### 23 Jan 2024
- Around 23:50 hrs
  - app icon modified

- Around 19:00 hrs
  - fibaconn project added
  - firebase_core added to pubspec

- Around 14:40 hrs
  - flutterfire_cli activated
  - 2 icons added

- Around 11:00 hrs
  - Project created
  - Created github repository

[^1]: Go to Getting Started -Notes- top.
[^2]: Go to Change Log top.