User.create!([
  {username: "sophisticus", password_digest: "$2a$10$SNd9578Rks2UtZ/HpfOcReXOsmpDs.wjAiHNCnhDSgLyWdvkKMrtO", session_token: "iq31lrbofm_3CViECnb2Cw"},
  {username: "temmie", password_digest: "$2a$10$Ehs62shTv6fVxqmrFA3NCuCHOpZN6B9qhyuuNZ7QaoJEWyIQcPCXO", session_token: "2MDVJIcsuhPj4IrmZglmFQ"},
  {username: "connor", password_digest: "$2a$10$K/oZyn4lMICC2jASDZL6Qexo0.UJUcACgtWllMKflwJB3iepVnUa.", session_token: "SV4n3EXg86THZVWr29hWBQ"},
  {username: "darien", password_digest: "$2a$10$Kw50ewCKcMtV28/FHvPOcuxwlKIHiCHvHauX81h3dhrUhPSak9HE.", session_token: "Pdj0X2gDe8Yg2nDB1sxX3Q"},
  {username: "barbara", password_digest: "$2a$10$SsbZIOuP5L8EuDcx13pUqOcZ3CqwfcftngeF3fhaP02pjCodfBw7e", session_token: "wUMbAlwVJwTq6SB1rSEz-Q"},
  {username: "samuel_l_jackson", password_digest: "$2a$10$1IW46WNpjtouLuReVjQ2TuDzmhFrPYGeT.MGPdEvbIQMncg3COUsS", session_token: "4V4aD8_JhiY1uzsAbvi0Yw"}
])

Sub.create!([
  {sub_name: "/r/Crappy Designs", description: "Incredibly terrible designs from around the world.", moderator_id: 1},
  {sub_name: "/r/Mildly Interesting\u2028", description: "Bored? Come here and waste an hour or 5.", moderator_id: 1},
  {sub_name: "/r/Pandas", description: "PANDA PANDA PANDA PANDA ", moderator_id: 1},
  {sub_name: "/r/Spiders", description: "Spidddeerrrrrsss ahhhhh", moderator_id: 1},
  {sub_name: "/r/Mildly Infuriating", description: "For posts that'll instantly give you a bad day.", moderator_id: 1},
  {sub_name: "/r/WTF", description: "HOW. DID. THIS. HAPPEN.", moderator_id: 1},
  {sub_name: "/r/askreddit\u2028", description: "People asking other people questions.", moderator_id: 1},
  {sub_name: "/r/Petty Revenge", description: "People living out their darkest fantasies", moderator_id: 1},
  {sub_name: "/r/Tales From Retail", description: "Everyday nightmares, shared by people behind the cashiers. ", moderator_id: 1},
  {sub_name: "/r/2cool4skool", description: "For all the cool kids", moderator_id: 1}
])

Post.create!([
  {title: "Yes, this design trend is in fact one of the worst things to ever come out of Western culture", url: "https://i.redditmedia.com/70AmNCRuXC4fkbkxBbq_Cruxas72C324OZaFAX9R5yI.jpg?w=1024&s=c250370fa371e422e26930399c2c2a33", content: "Handsoap actually looks aesthetic just by the shape of the letters. Bodylotion, I keep seeing the word \"bloody\" in there, and of course \"poo\".", user_id: 1},
  {title: "KING PANDA", url: "http://previews.123rf.com/images/funwayillustration/funwayillustration1410/funwayillustration141000002/33009695-King-Panda-Stock-Vector.jpg", content: "AMAZING. INCREDIBLE!", user_id: 1},
  {title: "Poorly designed hand dryer", url: "http://i.imgur.com/0HR4ZHY.jpg", content: "It sure looks like a trash can to me.", user_id: 1},
  {title: "I cancelled my transaction twice in a row by accident. I finally found out why.", url: "http://imgur.com/NKZZGWP", content: "F this S!!!", user_id: 1}
])
PostSub.create!([
  {post_id: 3, sub_id: 1},
  {post_id: 3, sub_id: 5},
  {post_id: 4, sub_id: 3},
  {post_id: 4, sub_id: 4},
  {post_id: 5, sub_id: 1},
  {post_id: 5, sub_id: 2},
  {post_id: 5, sub_id: 10},
  {post_id: 7, sub_id: 1},
  {post_id: 7, sub_id: 5}
])

Comment.create!([
  {post_id: 3, user_id: 2, content: "It's not even consistently crappy, which makes it extra crappy.", parent_comment_id: nil},
  {post_id: 3, user_id: 1, content: "If only they used monospace typography this could have worked. I think the HANDSOAP works okay and looks nice.\r\nBO DY WA SH\r\nis already running into some problems because the W is too wide a letter.\r\nAnd for all packages with a name of an odd length it just looks terrible.", parent_comment_id: nil},
  {post_id: 3, user_id: 1, content: "What if they just had an extra space between words?\r\nB O\r\nD Y\r\nL O T\r\nI O N\r\n", parent_comment_id: 2},
  {post_id: 3, user_id: 3, content: "You mean the HNSA ADOP", parent_comment_id: 3},
  {post_id: 3, user_id: 3, content: "I C A N M\r\nO I S T U\r\nR I S E Y\r\nO U R S K\r\nI N S O I\r\nT F E E L\r\nS N I C E A\r\nN D S O F\r\nT", parent_comment_id: nil},
  {post_id: 3, user_id: 3, content: "It's like reading heavily nested tumblr replies.", parent_comment_id: 3},
  {post_id: 3, user_id: 3, content: "The descriptions in the bottles are so uncomfortable. \"I can make your skin feel great if you use me to wash your body\" what", parent_comment_id: nil},
  {post_id: 3, user_id: 1, content: "GET OFFA MAH SUBREDDIT!!!!", parent_comment_id: 6},
  {post_id: 3, user_id: 1, content: "lol rite wtf?", parent_comment_id: 7},
  {post_id: 5, user_id: 3, content: "rofl wtf ", parent_comment_id: nil},
  {post_id: 3, user_id: 3, content: "LOL NO", parent_comment_id: 8},
  {post_id: 3, user_id: 3, content: "I like talking to myself", parent_comment_id: 5},
  {post_id: 3, user_id: 5, content: "Creepy af", parent_comment_id: 7},
  {post_id: 7, user_id: 3, content: "Sucks to suck.", parent_comment_id: nil}
])



Vote.create!([
  {value: 1, votable_id: 3, votable_type: "Post", user_id: 3},
  {value: 1, votable_id: 3, votable_type: "Post", user_id: 1},
  {value: 1, votable_id: 3, votable_type: "Post", user_id: 4},
  {value: 1, votable_id: 8, votable_type: "Comment", user_id: 1},
  {value: 1, votable_id: 1, votable_type: "Comment", user_id: 1},
  {value: 1, votable_id: 5, votable_type: "Comment", user_id: 1},
  {value: 1, votable_id: 12, votable_type: "Comment", user_id: 1},
  {value: 1, votable_id: 1, votable_type: "Comment", user_id: 5},
  {value: 1, votable_id: 2, votable_type: "Comment", user_id: 5},
  {value: 1, votable_id: 7, votable_type: "Comment", user_id: 5},
  {value: 1, votable_id: 7, votable_type: "Post", user_id: 3},
  {value: 1, votable_id: 7, votable_type: "Comment", user_id: 6},
  {value: 1, votable_id: 13, votable_type: "Comment", user_id: 1}
])
