// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import Hammer from "hammerjs";
import { Popup } from "mapbox-gl";

const application = Application.start();
const context = require.context("controllers", true, /_controller\.js$/);
application.load(definitionsFromContext(context));

function initCards(allCards, tinderContainer) {
  var newCards = document.querySelectorAll(".tinder--card:not(.removed)");
  if (newCards.length == 0) {
    Turbo.visit("/dogs");
    return;
  }
  newCards.forEach(function (card, index) {
    card.style.zIndex = allCards.length - index;
    card.style.transform =
      "scale(" + (20 - index) / 20 + ") translateY(-" + 30 * index + "px)";
    card.style.opacity = (10 - index) / 10;
  });

  tinderContainer.classList.add("loaded");
}


function createSwipe(liked, swiped_dog_id) {
  fetch("/swipes/", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ liked: liked, swiped_dog_id: swiped_dog_id }),
  })
    .then((response) => response.json())
    .then((data) => {
      if (data.matched) {
        Turbo.visit(data.path);
      }
    });
}
function createButtonListener(love) {
  return function (event) {
    var tinderContainer = document.querySelector(".tinder");
  var allCards = document.querySelectorAll(".tinder--card");
    var cards = document.querySelectorAll(".tinder--card:not(.removed)");
    var moveOutWidth = document.body.clientWidth * 1.5;

    if (!cards.length) return false;

    var card = cards[0];

    const liked = love
    const swiped_dog_id = card.dataset.swipedDog;
    createSwipe(liked, swiped_dog_id);
    card.classList.add("removed");

    if (love) {

      card.style.transform =
        "translate(" + moveOutWidth + "px, -100px) rotate(-30deg)";
    } else {
      card.style.transform =
        "translate(-" + moveOutWidth + "px, -100px) rotate(30deg)";
    }

    initCards(allCards, tinderContainer);

    event.preventDefault();
  };
}

function initStack() {
  var tinderContainer = document.querySelector(".tinder");
  var allCards = document.querySelectorAll(".tinder--card");
  var nope = document.getElementById("nope");
  var love = document.getElementById("love");
  if (!love) return;

  initCards(allCards, tinderContainer);

  allCards.forEach(function (el) {
    var hammertime = new Hammer(el);

    hammertime.on("pan", function (event) {
      el.classList.add("moving");
    });

    hammertime.on("pan", function (event) {
      if (event.deltaX === 0) return;
      if (event.center.x === 0 && event.center.y === 0) return;

      tinderContainer.classList.toggle("tinder_love", event.deltaX > 0);
      tinderContainer.classList.toggle("tinder_nope", event.deltaX < 0);

      const target = event.target.closest(".tinder--card");

      var xMulti = event.deltaX * 0.03;
      var yMulti = event.deltaY / 80;
      var rotate = xMulti * yMulti;

      target.style.transform =
        "translate(" +
        event.deltaX +
        "px, " +
        event.deltaY +
        "px) rotate(" +
        rotate +
        "deg)";
    });

    hammertime.on("panend", function (event) {
      const target = event.target.closest(".tinder--card");
      el.classList.remove("moving");
      tinderContainer.classList.remove("tinder_love");
      tinderContainer.classList.remove("tinder_nope");

      var moveOutWidth = document.body.clientWidth;
      var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;

      target.classList.toggle("removed", !keep);
      if (keep) {
        target.style.transform = "";
      } else {
        var endX = Math.max(
          Math.abs(event.velocityX) * moveOutWidth,
          moveOutWidth
        );
        var toX = event.deltaX > 0 ? endX : -endX;
        var endY = Math.abs(event.velocityY) * moveOutWidth;
        var toY = event.deltaY > 0 ? endY : -endY;
        var xMulti = event.deltaX * 0.03;
        var yMulti = event.deltaY / 80;
        var rotate = xMulti * yMulti;
        const liked = event.deltaX > 0;
        const swiped_dog_id = target.dataset.swipedDog;
        createSwipe(liked, swiped_dog_id);

        target.style.transform =
          "translate(" +
          toX +
          "px, " +
          (toY + event.deltaY) +
          "px) rotate(" +
          rotate +
          "deg)";
        initCards(allCards, tinderContainer);
      }
    });
  });

  var nopeListener = createButtonListener(false);
  var loveListener = createButtonListener(true);

  nope.addEventListener("click", nopeListener);
  love.addEventListener("click", loveListener);
}

document.addEventListener("turbo:load", initStack);
