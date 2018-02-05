function run_quotes() {
		var quoteSource=[
		{
			quote: "Start by doing what's necessary; then do what's possible; and suddenly you are doing the impossible.",
			name:"Francis of Assisi"
	    },
	    {
	    	quote:"Believe you can and you're halfway there.",
	    	name:"Theodore Roosevelt"
	    },
	    {
	    	quote:"It does not matter how slowly you go as long as you do not stop.",
	    	name:"Confucius"
	    },
	    {
	    	quote:"Our greatest weakness lies in giving up. The most certain way to succeed is always to try just one more time.",
	    	name:"Thomas A. Edison"
	    },
	    {
	    	quote:"The will to win, the desire to succeed, the urge to reach your full potential... these are the keys that will unlock the door to personal excellence.",
	    	name:"Confucius"
	    },
	    {
	    	quote:"Don't watch the clock; do what it does. Keep going.",
	    	name:"Sam Levenson"
	    },
	    {
	    	quote:"A creative man is motivated by the desire to achieve, not by the desire to beat others.",
	    	name:"Ayn Rand"
	    },
	    {
	    	quote:"A creative man is motivated by the desire to achieve, not by the desire to beat others.",
	    	name:"Ayn Rand"
	    },
	    {
	    	quote:"Expect problems and eat them for breakfast.",
	    	name:"Alfred A. Montapert"
	    },
	    {
	    	quote:"Start where you are. Use what you have. Do what you can.",
	    	name:"Arthur Ashe"
	    },
	    {
	    	quote:"Ever tried. Ever failed. No matter. Try Again. Fail again. Fail better.",
	    	name:"Samuel Beckett"
	    },
	    {
	    	quote:"Be yourself; everyone else is already taken.",
	    	name:"Oscar Wilde"
	    },
	    {
	    	quote:"Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.",
	    	name:"Albert Einstein"
	    },
	    {
	    	quote:"Always remember that you are absolutely unique. Just like everyone else.",
	    	name:"Margaret Mead"
	    },
	    {
	    	quote:"Do not take life too seriously. You will never get out of it alive.",
	    	name:"Elbert Hubbard"
	    },
	    {
	    	quote:"People who think they know everything are a great annoyance to those of us who do.",
	    	name:"Isaac Asimov"
	    },
	    {
	    	quote:"Procrastination is the art of keeping up with yesterday.",
	    	name:"Don Marquis"
	    },
	    {
	    	quote:"Get your facts first, then you can distort them as you please.",
	    	name:"Mark Twain"
	    },
	    {
	    	quote:"A day without sunshine is like, you know, night.",
	    	name:"Steve Martin"
	    },
	    {
	    	quote:"My grandmother started walking five miles a day when she was sixty. She's ninety-seven now, and we don't know where the hell she is.",
	    	name:"Ellen DeGeneres"
	    },
	    {
	    	quote:"Don't sweat the petty things and don't pet the sweaty things.",
	    	name:"George Carlin"
	    },
	    {
	    	quote:"Always do whatever's next.",
	    	name:"George Carlin"
	    },
	    {
	    	quote:"Atheism is a non-prophet organization.",
	    	name:"George Carlin"
	    },
	    {
	    	quote:"Hapiness is not something ready made. It comes from your own actions.",
	    	name:"Dalai Lama"
	    },
{
quote:"Success is most often achieved by those who don't know that failure is inevitable.",
name:"Coco Chanel"
},
{
quote:"Things work out best for those who make the best of how things work out.",
name:"John Wooden"
},
{
quote:"Courage is grace under pressure.",
name:"Ernest Hemingway"
},
{
quote:"If you are not willing to risk the usual, you will have to settle for the ordinary.",
name:"Jim Rohn"
},
{
quote:"Learn from yesterday, live for today, hope for tomorrow. The important thing is not to stop questioning.",
name:"Albert Einstein"
},
{
quote:"Take up one idea. Make that one idea your life -- think of it, dream of it, live on that idea. Let the brain, muscles, nerves, every part of your body be full of that idea, and just leave every other idea alone. This is the way to success.",
name:"Swami Vivekananda"
},
{
quote:"Sometimes you can't see yourself clearly until you see yourself through the eyes of others.",
name:"Ellen DeGeneres"
},
{
quote:"All our dreams can come true if we have the courage to pursue them.",
name:"Walt Disney"
},
{
quote:"It does not matter how slowly you go, so long as you do not stop.",
name:"Confucius"
},
{
quote:"Success is walking from failure to failure with no loss of enthusiasm.",
name:"Winston Churchill"
},
{
quote:"Someone is sitting in the shade today because someone planted a tree a long time ago.",
name:"Warren Buffett"
},
{
quote:"Whenever you see a successful person, you only see the public glories, never the private sacrifices to reach them.",
name:"Vaibhav Shah"
},
{
quote:"Don't cry because it's over, smile because it happened.",
name:"Dr. Seuss"
},
{
quote:"Success? I don't know what that word means. I'm happy. But success, that goes back to what in somebody's eyes success means. For me, success is inner peace. That's a good day for me.",
name:"Denzel Washington"
},
{
quote:"You only live once, but if you do it right, once is enough.",
name:"Mae West"
},
{
quote:"Opportunities don't happen. You create them.",
name:"Chris Grosser"
},
{
quote:"Once you choose hope, anything's possible.",
name:"Christopher Reeve"
},
{
quote:"Try not to become a person of success, but rather try to become a person of value.",
name:"Albert Einstein"
},
{
quote:"There is no easy walk to freedom anywhere, and many of us will have to pass through the valley of the shadow of death again and again before we reach the mountaintop of our desires.",
name:"Nelson Mandela"
},
{
quote:"It is not the strongest of the species that survive, nor the most intelligent, but the one most responsive to change.",
name:"Charles Darwin"
},
{
quote:"The best and most beautiful things in the world cannot be seen or even touched -- they must be felt with the heart.",
name:"Helen Keller"
},
{
quote:"Great minds discuss ideas; average minds discuss events; small minds discuss people.",
name:"Eleanor Roosevelt"
},
{
quote:"Live as if you were to die tomorrow. Learn as if you were to live forever.",
name:"Mahatma Gandhi"
},
{
quote:"The best revenge is massive success.",
name:"Frank Sinatra"
},
{
quote:"The difference between winning and losing is most often not quitting.",
name:"Walt Disney"
},
{
quote:"I have not failed. I've just found 10,000 ways that won't work.",
name:"Thomas Edison"
},
{
quote:"When you cease to dream you cease to live.",
name:"Malcolm Forbes"
},
{
quote:"A successful man is one who can lay a firm foundation with the bricks others have thrown at him.",
name:"David Brinkley"
},
{
quote:"May you live every day of your life.",
name:"Jonathan Swift"
},
{
quote:"No one can make you feel inferior without your consent.",
name:"Eleanor Roosevelt"
},
{
quote:"Failure is another steppingstone to greatness.",
name:"Oprah Winfrey"
},
{
quote:"The whole secret of a successful life is to find out what is one's destiny to do, and then do it.",
name:"Henry Ford"
},
{
quote:"If you're not stubborn, you'll give up on experiments too soon. And if you're not flexible, you'll pound your head against the wall and you won't see a different solution to a problem you're trying to solve.",
name:"Jeff Bezos"
},
{
quote:"If you're going through hell, keep going.",
name:"Winston Churchill"
},
{
quote:"In order to be irreplaceable one must always be different.",
name:"Coco Chanel"
},
{
quote:"What seems to us as bitter trials are often blessings in disguise.",
name:"Oscar Wilde"
},
{
quote:"You miss 100 percent of the shots you don't take.",
name:"Wayne Gretzky"
},
{
quote:"The distance between insanity and genius is measured only by success.",
name:"Bruce Feirstein"
},
{
quote:"The way I see it, if you want the rainbow, you gotta put up with the rain.",
name:"Dolly Parton"
},
{
quote:"To me, business isn't about wearing suits or pleasing stockholders. It's about being true to yourself, your ideas and focusing on the essentials.",
name:"Richard Branson"
},
{
quote:"The longer I live, the more beautiful life becomes.",
name:"Frank Lloyd Wright"
},
{
quote:"Happiness is a butterfly, which when pursued, is always beyond your grasp, but which, if you will sit down quietly, may alight upon you.",
name:"Nathaniel Hawthorne"
},
{
quote:"You must expect great things of yourself before you can do them.",
name:"Michael Jordan"
},
{
quote:"If you can't explain it simply, you don't understand it well enough.",
name:"Albert Einstein"
},
{
quote:"You can't please everyone, and you can't make everyone like you.",
name:"Katie Couric"
},
{
quote:"There are two types of people who will tell you that you cannot make a difference in this world: those who are afraid to try and those who are afraid you will succeed.",
name:"Ray Goforth"
},
{
quote:"I believe every human has a finite number of heartbeats. I don't intend to waste any of mine.",
name:"Neil Armstrong"
},
{
quote:"Start where you are. Use what you have. Do what you can.",
name:"Arthur Ashe"
},
{
quote:"Don't limit yourself. Many people limit themselves to what they think they can do. You can go as far as your mind lets you. What you believe, remember, you can achieve.",
name:"Mary Kay Ash"
},
{
quote:"People ask, 'What's the best role you've ever played?' The next one.",
name:"Kevin Kline"
},
{
quote:"The two most important days in your life are the day you are born and the day you find out why.",
name:"Mark Twain"
},
{
quote:"I find that the harder I work, the more luck I seem to have.",
name:"Thomas Jefferson"
},
{
quote:"It often requires more courage to dare to do right than to fear to do wrong.",
name:"Abraham Lincoln"
},
{
quote:"Success is the sum of small efforts, repeated day-in and day-out.",
name:"Robert Collier"
},
{
quote:"As you grow older, you will discover that you have two hands, one for helping yourself, the other for helping others.",
name:"Audrey Hepburn"
},
{
quote:"If you want to achieve excellence, you can get there today. As of this second, quit doing less-than-excellent work.",
name:"Thomas J. Watson"
},
{
quote:"If your actions inspire others to dream more, learn more, do more, and become more, you are a leader.",
name:"John Quincy Adams"
},
{
quote:"All progress takes place outside the comfort zone.",
name:"Michael John Bobak"
},
{
quote:"The more you praise and celebrate your life, the more there is in life to celebrate.",
name:"Oprah Winfrey"
},
{
quote:"You may only succeed if you desire succeeding; you may only fail if you do not mind failing.",
name:"Philippos"
},
{
quote:"A dream doesn't become reality through magic; it takes sweat, determination, and hard work.",
name:"Colin Powell"
},
{
quote:"Only put off until tomorrow what you are willing to die having left undone.",
name:"Pablo Picasso"
},
{
quote:"The biggest risk is not taking any risk... In a world that's changing really quickly, the only strategy that is guaranteed to fail is not taking risks.",
name:"Mark Zuckerberg"
},
{
quote:"We become what we think about most of the time, and that's the strangest secret.",
name:"Earl Nightingale"
},
{
quote:"Do one thing every day that scares you.",
name:"Eleanor Roosevelt"
},
{
quote:"The only place where success comes before work is in the dictionary.",
name:"Vidal Sassoon"
},
{
quote:"Don't be afraid to give up the good to go for the great.",
name:"John D. Rockefeller"
},
{
quote:"Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle. As with all matters of the heart, you'll know when you find it.",
name:"Steve Jobs"
},
{
quote:"Don't worry about failure; you only have to be right once.",
name:"Drew Houston"
},
{
quote:"Though no one can go back and make a brand-new start, anyone can start from now and make a brand-new ending.",
name:"Carl Bard"
},
{
quote:"Nothing great was ever achieved without enthusiasm.",
name:"Ralph Waldo Emerson"
},
{
quote:"Twenty years from now you will be more disappointed by the things that you didn't do than by the ones you did do. So throw off the bowlines. Sail away from the safe harbor. Catch the trade winds in your sails. Explore. Dream. Discover.",
name:"Mark Twain"
},
{
quote:"Keep your face to the sunshine and you can never see the shadow.",
name:"Helen Keller"
},
{
quote:"The first step toward success is taken when you refuse to be a captive of the environment in which you first find yourself.",
name:"Mark Caine"
},
{
quote:"One of the greatest diseases is to be nobody to anybody.",
name:"Mother Teresa"
},
{
quote:"Identity is a prison you can never escape, but the way to redeem your past is not to run from it, but to try to understand it, and use it as a foundation to grow.",
name:"Jay-Z"
},
{
quote:"The successful warrior is the average man, with laser-like focus.",
name:"Bruce Lee"
},
{
quote:"Rarely have I seen a situation where doing less than the other guy is a good strategy.",
name:"Jimmy Spithill"
},
{
quote:"If you always do what interests you, at least one person is pleased.",
name:"Katharine Hepburn"
},
{
quote:"Keep on going, and the chances are that you will stumble on something, perhaps when you are least expecting it. I never heard of anyone ever stumbling on something sitting down.",
name:"Charles F. Kettering"
},
{
quote:"I avoid looking forward or backward, and try to keep looking upward.",
name:"Charlotte Bronte"
},
{
quote:"You can't connect the dots looking forward; you can only connect them looking backward. So you have to trust that the dots will somehow connect in your future. You have to trust in something -- your gut, destiny, life, karma, whatever. This approach has never let me down, and it has made all the difference in my life.",
name:"Steve Jobs"
},
{
quote:"Life is short, and it is here to be lived.",
name:"Kate Winslet"
},
{
quote:"Everything you can imagine is real.",
name:"Pablo Picasso"
},
{
quote:"Change will not come if we wait for some other person or some other time. We are the ones we've been waiting for. We are the change that we seek.",
name:"Barack Obama"
},
{
quote:"If you want to make a permanent change, stop focusing on the size of your problems and start focusing on the size of you!",
name:"T. Harv Eker"
},
{
quote:"Successful people do what unsuccessful people are not willing to do. Don't wish it were easier; wish you were better.",
name:"Jim Rohn"
},
{
quote:"It is never too late to be what you might have been.",
name:"George Eliot"
},
{
quote:"If you love what you do and are willing to do what it takes, it's within your reach. And it'll be worth every minute you spend alone at night, thinking and thinking about what it is you want to design or build.",
name:"Steve Wozniak"
},
{
quote:"In my experience, there is only one motivation, and that is desire. No reasons or principle contain it or stand against it.",
name:"Jane Smiley"
},
{
quote:"In the midst of movement and chaos, keep stillness inside of you.",
name:"Deepak Chopra"
},
{
quote:"Success does not consist in never making mistakes but in never making the same one a second time.",
name:"George Bernard Shaw"
},
{
quote:"I don't want to get to the end of my life and find that I lived just the length of it. I want to have lived the width of it as well.",
name:"Diane Ackerman"
}
	];
		

//		$('#quoteButton').click(function(evt){
			//define the containers of the info we target
			var quote = $('#quoteContainer p').text();
			var quoteGenius = $('#quoteGenius').text();
			//prevent browser's default action
//			evt.preventDefault();
			//getting a new random number to attach to a quote and setting a limit
			var sourceLength = quoteSource.length;
			var randomNumber= Math.floor(Math.random()*sourceLength);
			//set a new quote
			for(i=0;i<=sourceLength;i+=1){
			var newQuoteText = quoteSource[randomNumber].quote;
			var newQuoteGenius = quoteSource[randomNumber].name;
			//console.log(newQuoteText,newQuoteGenius);
      var timeAnimation = 500;
      var quoteContainer = $('#quoteContainer');
      //fade out animation with callback
      quoteContainer.fadeOut(timeAnimation, function(){
        quoteContainer.html('');
				quoteContainer.append('<p>'+newQuoteText+'</p>'+'<p id="quoteGenius">'+'-								'+newQuoteGenius+'</p>');
        
        //fadein animation.
        quoteContainer.fadeIn(timeAnimation);
      });  
			
			break;
		};//end for loop
	
//	});//end quoteButton function
		
 };//end document ready

