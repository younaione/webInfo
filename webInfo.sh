#bin/bash

dir=$(pwd)


usage()
{
echo "Usage: webInfo [options] [-f file] [-d domain] [-h help]"
exit 1
}

help()
{
echo "\n"
echo "[v:0.0.1]"
echo "get all possible data from webpage, http and https, links for social media,"
echo "some information about the technologie, parameters ....etc"
echo "Usage: webInfo [options] [-f file] [-d domain] [-h help]"
echo "\n"
echo "\n"



echo "       -f             get all data from file"
echo "       -d             get all data from domain name"
echo "       -h             print help message"




exit 1
}

domain()
{

curl -s -o /dev/null $1
if [ $? -eq 0 ]; then


 if [ -f $dir/index.html ]; then
 echo "The file name index.html is in this directory."
 echo "Rename or remove the file and try again."
 exit 1
 fi


 curl $1 -o index.html
 sleep 8
 get_all index.html

else 

echo "Check your internet connection or domain name."
exit 1
fi

#if [ -f $dir/index.html ]; then
#rm index.html
#fi

}


file()
{

if [ $(stat -f -c %T $1) = "ext2/ext3" ] >>/dev/null 2>&1
 then
 get_all $1

else
echo "file format not supported"
exit 1
fi

}



get_all()
{


# Part 1:  Http And Attps Found 
echo "Http And Https"
echo "--------------"
sleep 1 

cat $1 | sed 's/{/\n/g'|sed 's/}/\n/g'|sed 's/,/\n/g'|sed 's/;/\n/g'|sed 's/!/\n/g'|sed 's/</\n/g'|sed 's/>/\n/g'|sed 's/(/\n/g'|sed 's/)/\n/g'|sed 's/"/\n/g'| sed "s/'/\n/g" |sed 's/ /\n/g'|sed 's/\[/\n/g'| sed 's/\]/\n/g'|sed "s/'/\n/g"| sed 's/+/\n/g'| sed 's/$/\n/g'|sed 's/?/\n/g'|grep http|grep -iv ".w3.\|Mastodon\|Bluesky\|Threads\|Tumblr\|Twitch\|Discord\|Quora\|LinkedIn\|Reddit\|Pinterest\|QQ\|Sina\|Weibo\|Twitter\|Kuaishou\|Snapchat\|Telegram\|WeChat\|TikTok\|Instagram\|YouTube\|WhatsApp\|Facebook\|portal\|login\|admin\|user\|token\|administrator\|config\|password\|pass"| sort|uniq -i

echo "                ---------------------------------------------------------------------------------------------               "
echo "\n "
echo "\n "



# Part 2: urls with parameters

echo "Parameters"
echo "----------"

sleep 1
cat $1 | sed 's/{/\n/g'|sed 's/}/\n/g'|sed 's/,/\n/g'|sed 's/;/\n/g'|sed 's/!/\n/g'|sed 's/</\n/g'|sed 's/>/\n/g'|sed 's/(/\n/g'|sed 's/)/\n/g'|sed 's/"/\n/g'| sed "s/'/\n/g" |sed 's/ /\n/g'|sed 's/\[/\n/g'| sed 's/\]/\n/g'|sed "s/'/\n/g"| sed 's/$/\n/g'|grep http|grep -Ei '\?.*='| grep -vi "jpg/|png\|asset"|sort|uniq -i

echo "                ---------------------------------------------------------------------------------------------               "
echo "\n "
echo "\n "


# Part 3: check for important links
echo "Important Links"
echo "---------------"
sleep 1
cat $1 | sed 's/{/\n/g'|sed 's/}/\n/g'|sed 's/,/\n/g'|sed 's/;/\n/g'|sed 's/!/\n/g'|sed 's/</\n/g'|sed 's/>/\n/g'|sed 's/(/\n/g'|sed 's/)/\n/g'|sed 's/"/\n/g'| sed "s/'/\n/g" |sed 's/ /\n/g'|sed 's/\[/\n/g'| sed 's/\]/\n/g'|sed "s/'/\n/g"| sed 's/+/\n/g'| sed 's/$/\n/g'|sed 's/?/\n/g'|grep http|grep -iv ".w3.\|Mastodon\|Bluesky\|Threads\|Tumblr\|Twitch\|Discord\|Quora\|LinkedIn\|Reddit\|Pinterest\|QQ\|Sina\|Weibo\|Twitter\|Kuaishou\|Snapchat\|Telegram\|WeChat\|TikTok\|Instagram\|YouTube\|WhatsApp\|Facebook" | grep -i "download\|upload\|portal\|login\|admin\|user\|token\|administrator\|config\|password\|pass"|sort|uniq -i

echo "                ---------------------------------------------------------------------------------------------               "
echo "\n "
echo "\n "


# part 4: links for social media
echo "Links for social Media"
echo "----------------------"
sleep 1
cat $1 | sed 's/{/\n/g'|sed 's/}/\n/g'|sed 's/,/\n/g'|sed 's/;/\n/g'|sed 's/!/\n/g'|sed 's/</\n/g'|sed 's/>/\n/g'|sed 's/\[/\n/g'|sed 's/]/\n/g'|sed 's/(/\n/g'|  sed 's/)/\n/g'| sed 's/"/\n/g' |grep "http" |grep -i "Mastodon\|Bluesky\|Threads\|Tumblr\|Twitch\|Discord\|Quora\|LinkedIn\|Reddit\|Pinterest\|QQ\|Sina\|Weibo\|Twitter\|Kuaishou\|Snapchat\|Telegram\|WeChat\|TikTok\|Instagram\|YouTube\|WhatsApp\|Facebook"| grep -v "png\|jpg\|image"|sort|uniq -i


echo "                ---------------------------------------------------------------------------------------------               "
echo "\n "
echo "\n "



# part 5:  about the  tecknologie
echo "About The Tecknologie"
echo "---------------------"
sleep 1 
cat $1 | sed 's/{/\n/g'|sed 's/}/\n/g'|sed 's/,/\n/g'|sed 's/;/\n/g'|sed 's/!/\n/g'|sed 's/</\n/g'|sed 's/>/\n/g'|sed 's/(/\n/g'|sed 's/)/\n/g'|sed 's/"/\n/g'| sed "s/'/\n/g" |sed 's/ /\n/g'| sed 's/-/\n/g'| sed 's/\./\n/g'| sed 's/:/\n/'|sed 's/=/\n/g'|sed 's/\[/\n/g'| sed 's/\]/\n/g'|sed 's/\//\n/g'|sed 's/?/\n/g'| sed 's/_/\n/g'| sed 's/+/\n/g'|grep -i "Ucraft\|Webflow\|Ghost\|Shopify\|Wix\|Squarespace\|Joomla\|wordpress\|Javascript\|Ember\|Web3\|GraphQL\|Headless\|Remix\|Monorepo\|Flutter\|astro\|React\|Gatsby\|Svelte\|SvelteKit\|Vite\|Angular\|html\|css\|Bootstrap\|Tailwind\|Bulma\|NextJS\|PWA\|wagmi\|Truffle\|Scala\|Kotlin\|Perl\|Java\|PHP\|Ruby\|Python\|mongodb\|sql\|mariadb\|js\|jquery\|json\|laravel"|sort|uniq -i
echo "\n"




exit 1
}


if [ $# -eq 0 ] && [ $# -gt 2 ]; then
   usage
fi

if  [ $1 != "-f" ] && [ $1 != "-d" ] && [ $1 != "-h" ]; then
   usage
fi


while getopts :f:d:h opt; do
 case $opt in 
  f) arg_f=${OPTARG}
     file ${arg_f}
     ;;
  d) arg_d=${OPTARG}
     domain ${arg_d}
     ;;
  h) arg_h=${OPTARG}
     help 
     ;;
  *) usage
 esac
done



