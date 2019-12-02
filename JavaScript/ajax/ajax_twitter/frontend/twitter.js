const FollowToggle = require("./follow_toggle.js");
const UsersSearch = require("./users_search.js");
const TweetCompose = require("./tweet_compose.js");

$(document).ready(function() {
  const $buttons = $('.follow-toggle');
	const $usersSearches = $('nav.users-search');
	const $tweetForms = $('.tweet-compose');

  $buttons.each(function (idx, el) {
    const $button = $(el);
    new FollowToggle($button);
  });

	$usersSearches.each(function (idx, el) {
		const $usersSearch = $(el);
		new UsersSearch($usersSearch);
	});

	$tweetForms.each(function (idx, el) {
		const $form = $(el);
		new TweetCompose($form);
	});
});
