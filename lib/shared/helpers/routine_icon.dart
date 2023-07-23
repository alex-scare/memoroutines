import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

enum RoutineIcon {
  // animals
  cat(LineIcons.cat),
  dog(LineIcons.dog),
  paw(LineIcons.paw),
  // Autumn
  hiking(LineIcons.hiking),
  // Beverage
  glassCheers(LineIcons.glassCheers),
  cocktail(LineIcons.cocktail),
  coffee(LineIcons.coffee),
  // Brands
  freeCodeCamp(LineIcons.freeCodeCamp),
  git(LineIcons.git),
  github(LineIcons.github),
  gitlab(LineIcons.gitlab),
  instagram(LineIcons.instagram),
  microsoft(LineIcons.microsoft),
  java(LineIcons.java),
  python(LineIcons.python),
  react(LineIcons.react),
  swift(LineIcons.swift),
  telegram(LineIcons.telegram),
  windows(LineIcons.windows),
  // Buildings
  campground(LineIcons.campground),
  route(LineIcons.route),
  mountain(LineIcons.mountain),
  fire(LineIcons.fire),
  compass(LineIcons.compass),
  seedling(LineIcons.seedling),
  handHoldingHeart(LineIcons.handHoldingHeart),
  chess(LineIcons.chess),
  gamepad(LineIcons.gamepad),
  terminal(LineIcons.terminal),
  code(LineIcons.code),
  laptop(LineIcons.laptop),
  paintRoller(LineIcons.paintRoller),
  paintBrush(LineIcons.paintBrush),
  ethereum(LineIcons.ethereum),
  btc(LineIcons.btc),
  moneyBill(LineIcons.moneyBill),
  palette(LineIcons.palette),
  glasses(LineIcons.glasses),
  atom(LineIcons.atom),
  laptopCode(LineIcons.laptopCode),
  theaterMasks(LineIcons.theaterMasks),
  microscope(LineIcons.microscope),
  music(LineIcons.music),
  water(LineIcons.water),
  wallet(LineIcons.wallet),
  coins(LineIcons.coins),
  bicycle(LineIcons.bicycle),
  skiing(LineIcons.skiing),
  running(LineIcons.running),
  swimmer(LineIcons.swimmer),
  spa(LineIcons.spa),
  pizzaSlice(LineIcons.pizzaSlice),
  cheese(LineIcons.cheese),
  twitch(LineIcons.twitch),
  steam(LineIcons.steam),
  diceD6(LineIcons.diceD6),
  dumbbell(LineIcons.dumbbell),
  camera(LineIcons.camera),
  bomb(LineIcons.bomb),
  car(LineIcons.car),
  globe(LineIcons.globe),
  book(LineIcons.book),
  couch(LineIcons.couch),
  spotify(LineIcons.spotify),
  drum(LineIcons.drum),
  beer(LineIcons.beer),
  futbol(LineIcons.futbol),
  graduationCap(LineIcons.graduationCap),
  gem(LineIcons.gem),
  guitar(LineIcons.guitar),
  shoppingCart(LineIcons.shoppingCart),
  university(LineIcons.university),
  golfBall(LineIcons.golfBall),
  skating(LineIcons.skating),
  scroll(LineIcons.scroll),
  dungeon(LineIcons.dungeon),
  dragon(LineIcons.dragon),
  bed(LineIcons.bed),
  meteor(LineIcons.meteor),
  snowboarding(LineIcons.snowboarding),
  ;

  const RoutineIcon(this.icon);

  final IconData icon;

  List<IconData> get iconList => values.map((entity) => entity.icon).toList();
}