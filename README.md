# Rx Ball
RXBall is a game similar to popular [DXball](https://en.wikipedia.org/wiki/DX-Ball) and [Breakout](https://en.wikipedia.org/wiki/Breakout_(video_game)) written in Ruby programming language originally as a project for a programming paradigms course. 

![alt text](https://github.com/dimaria95/rxBall/blob/master/screenshots/menu.png)

## Getting Started

These instructions will get you a copy of the game up and running on your local machine. This version is mainly tested on MacOS Sierra.

### Prerequisites

What things you need to install the software and how to install them

Install Ruby:

* For MacOS:  
```
$ brew install ruby
```
* For Linux:  
```
$ sudo apt-get install ruby-full
```

Install Gosu library:

* For MacOS : [Gosu installation guide](https://github.com/gosu/gosu/wiki/getting-started-on-os-x)
* For Linux : [Gosu installation guide](https://github.com/gosu/gosu/wiki/getting-started-on-linux)



### Installation


Download the repository and simply run main.rb 

```
ruby main.rb
```


## Playing the game

### Controls

* Select:  **space** 
* Exit the game/ Go back:  **Escape** 
* Pause the game: **P** 
* Pause the music: **M** 
* Movement: **Left/Right arrow** 

![alt text](https://github.com/dimaria95/rxBall/blob/master/screenshots/game.png)

### Make your own level

Level can be made in two ways, one is with automated script:

* Go to levels file 
```
cd levels
```
* Run python script 
```
python lvlGenerator.py
```

and set up a level number, number of regular and power up bricks 

Second way is to make a .txt file in form of other levels :

* max 10 elements in line
* n - normal brick
* '-' - empty space
* p - purple brick ( reverse power-up) 
* y - yellow brick ( slow ball power-up)
* g - green brick (wider paddle power-up)
* r - red brick ( faster paddle power-up)

## Built With

* [Gosu](https://github.com/gosu/gosu) - 2D game development library

## Authors

* **Nikola Dimic** -  [dimaria95](https://github.com/dimaria95/)

* **Dragana Dimitrijevic** - [dragana95](https://github.com/dragana95)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
