// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require_tree .
var row1 = []
var row2 = []
var row3 = []
var deck =[]
var click_counter = 1
function imageSelector() {
  document.querySelector('.magic-box').style.height = '600px';
  document.querySelector('#second-row-div').style.marginLeft = '25px';
  document.querySelector('#box-1').style.marginRight = '7px';
  document.querySelector('#question').innerHTML = "Choose One of the 21 cards below and remember throughout this game. Which row has your card? ";
  var card1 = document.querySelector('#card-22');
  card1.style.display = 'none';
  var button = document.querySelector('#button1');
  button.style.display = 'block';
  var button = document.querySelector('#button2');
  button.style.display = 'block';
  var button = document.querySelector('#button3');
  button.style.display = 'block';
  click_counter = 1
  var id = 1;
  var array_of_cards = ['2C.jpg',
                        '2D.jpg',
                        '2H.jpg',
                        '2S.jpg',
                        '3C.jpg',
                        '3D.jpg',
                        '3H.jpg',
                        '3S.jpg',
                        '4C.jpg',
                        '4D.jpg',
                        '4H.jpg',
                        '4S.jpg',
                        '5C.jpg',
                        '5D.jpg',
                        '5H.jpg',
                        '5S.jpg',
                        '6C.jpg',
                        '6D.jpg',
                        '6H.jpg',
                        '6S.jpg',
                        '7C.jpg',
                        '7D.jpg',
                        '7H.jpg',
                        '7S.jpg',
                        '8C.jpg',
                        '8D.jpg',
                        '8H.jpg',
                        '8S.jpg',
                        '9C.jpg',
                        '9D.jpg',
                        '9H.jpg',
                        '9S.jpg',
                        '10C.jpg',
                        '10D.jpg',
                        '10H.jpg',
                        '10S.jpg',
                        'AC.jpg',
                        'AD.jpg',
                        'AH.jpg',
                        'AS.jpg',
                        'JC.jpg',
                        'JD.jpg',
                        'JH.jpg',
                        'JS.jpg',
                        'KC.jpg',
                        'KD.jpg',
                        'KH.jpg',
                        'KS.jpg',
                        'QC.jpg',
                        'QD.jpg',
                        'QH.jpg',
                        'QS.jpg']
  const shuffled = array_of_cards.sort(() => 0.5 - Math.random());
  let selected = shuffled.slice(0, 21);

    for (var i in selected) {
      var card = document.querySelector('#card-' + id);
      card.style.display = 'block';
      card.src = "/images/JPEG/" + selected[i];
      id += 1
   }
    row1 = selected.slice(0, 7)
    row2 = selected.slice(7, 14)
    row3 = selected.slice(14, 21)

 }

 function rowSelector3() {
   deck =[]
   deck.push(row1)
   deck.push(row3)
   deck.push(row2)
   merged = [].concat.apply([], deck);
   emptyRows();
   organize();
   deck =[]
   pushRowsIntoDeck();
   merged =[]
   merged = [].concat.apply([], deck);
   id = 1
   for (var i in merged) {
     var card = document.querySelector('#card-' + id);
     card.style.display = 'block';
     card.src = "/images/JPEG/" + merged[i];
     id += 1
  }
  row1 = deck[0]
  row2 = deck[1]
  row3 = deck[2]
  click_counter += 1
  updateAccordingly();
}

 function rowSelector2() {
   deck =[]
   deck.push(row1)
   deck.push(row2)
   deck.push(row3)
   merged = [].concat.apply([], deck);
   emptyRows();
   organize();
   deck =[]
   pushRowsIntoDeck();
   merged =[]
   merged = [].concat.apply([], deck);
   id = 1
   for (var i in merged) {
     var card = document.querySelector('#card-' + id);
     card.style.display = 'block';
     card.src = "/images/JPEG/" + merged[i];
     id += 1
  }
  row1 = deck[0]
  row2 = deck[1]
  row3 = deck[2]
  click_counter += 1
  updateAccordingly();
}
 function rowSelector1() {
   deck =[]
   deck.push(row3)
   deck.push(row1)
   deck.push(row2)
   merged = [].concat.apply([], deck);
   emptyRows();
   organize();
   deck =[]
   pushRowsIntoDeck();
   merged =[]
   merged = [].concat.apply([], deck);
   id = 1
   for (var i in merged) {
     var card = document.querySelector('#card-' + id);
     card.style.display = 'block';
     card.src = "/images/JPEG/" + merged[i];
     id += 1
  }
  row1 = deck[0]
  row2 = deck[1]
  row3 = deck[2]
  click_counter += 1
  updateAccordingly();
}

function organize() {
  row3.push(merged[0])
  row2.push(merged[1])
  row1.push(merged[2])

  row3.push(merged[3])
  row2.push(merged[4])
  row1.push(merged[5])

  row3.push(merged[6])
  row2.push(merged[7])
  row1.push(merged[8])

  row3.push(merged[9])
  row2.push(merged[10])
  row1.push(merged[11])

  row3.push(merged[12])
  row2.push(merged[13])
  row1.push(merged[14])

  row3.push(merged[15])
  row2.push(merged[16])
  row1.push(merged[17])

  row3.push(merged[18])
  row2.push(merged[19])
  row1.push(merged[20])
}

function emptyRows() {
  row1 = []
  row2 = []
  row3 = []
}


function tellAnswer(position) {
  hideButtonAndImages();
  document.querySelector('.magic-box').style.height = '500px';
  var card1 = document.querySelector('#card-22');
  card1.style.display = 'block';
  card1.style.height = '300px';
  card1.style.width = '200px';
  card1.style.alignSelf = 'center';
  card1.style.border= '3px solid';
  card1.style.borderRadius= '15px';
  card1.src = "/images/JPEG/" + position;
  document.querySelector('#question').innerHTML = "Magic Time!!!!This is your card";
  click_counter = 1
}




function hideButtonAndImages() {
  var card1 = document.querySelector('#card-1');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-2');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-3');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-4');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-5');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-6');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-7');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-8');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-9');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-10');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-11');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-12');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-13');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-14');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-15');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-16');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-17');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-18');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-19');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-20');
  card1.style.display = 'none';
  var card1 = document.querySelector('#card-21');
  card1.style.display = 'none';
  var button = document.querySelector('#button1');
  button.style.display = 'none';
  var button = document.querySelector('#button2');
  button.style.display = 'none';
  var button = document.querySelector('#button3');
  button.style.display = 'none';
}

function updateAccordingly() {
  if (click_counter == 4) {
    tellAnswer(row2[3]);
  }else if (click_counter == 2) {
    document.querySelector('#question').innerHTML = "Now, Which row has your card?";
  }else if ( click_counter == 3) {
    document.querySelector('#question').innerHTML = "Once more, Which row has your card?";
  }
}

function pushRowsIntoDeck() {
  deck.push(row1)
  deck.push(row2)
  deck.push(row3)
}
