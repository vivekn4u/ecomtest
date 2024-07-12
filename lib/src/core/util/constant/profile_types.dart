/// profile type defines the type of the user
enum ProfileType {
  ///guest users with direct access to contents
  guest,

  ///users with login and subscription
  prime,

  ///user with login and without subscription
  notPrime,
}
