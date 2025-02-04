#!/bin/bash

# Colors
GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

# Animation on Start
clear
echo -e "${GREEN}Loading AF HACK Project..."
sleep 1
for i in {1..5}; do
    echo -ne "${YELLOW}█"
    sleep 0.5
done
echo -e "${GREEN} [LOADED] ${NC}"
sleep 1
clear

# Banner
echo -e "${RED}#################################################${NC}"
echo -e "${GREEN}          ❤️AF HACK❤️ ${NC}"
echo -e "${YELLOW}-------------------------------------------------${NC}"
echo -e "${GREEN}I love you My Jan ❤️${NC}"
echo -e "${GREEN}Respect Karro Or Karwao${NC}"
echo -e "${RED}#################################################${NC}"
echo ""

# Menu
echo -e "${BLUE}[1] Download TikTok Video (No Watermark)${NC}"
echo -e "${BLUE}[2] Download YouTube Video (MP4)${NC}"
echo -e "${BLUE}[3] Download YouTube Video (MP3)${NC}"
echo -e "${BLUE}[4] Show Device Information${NC}"
echo -e "${BLUE}[5] WhatsApp Unban Request${NC}"
echo -e "${BLUE}[6] Play Favorite Naat${NC}"
echo -e "${BLUE}[7] Open My TikTok ID${NC}"
echo -e "${BLUE}[8] Open My WhatsApp Channel${NC}"
echo -e "${BLUE}[9] Solve Math Question from Image${NC}"
echo -e "${BLUE}[0] Exit${NC}"

read -p "Select an option: " option

case $option in
    1) 
        read -p "Enter TikTok Video URL: " url
        output_path="/sdcard/Download/TikTokVideo.mp4"
        echo -e "${GREEN}Downloading TikTok Video...${NC}"
        yt-dlp --no-check-certificate --geo-bypass -o "$output_path" "$url" | 
        pv -lep -s 100 > /dev/null
        echo -e "${GREEN}Downloaded TikTok video successfully in Download folder!${NC}"
        ;;
        
    2) 
        read -p "Enter YouTube Video URL: " url
        output_path="/sdcard/Download/YouTubeVideo.mp4"
        echo -e "${GREEN}Downloading YouTube Video...${NC}"
        yt-dlp -f best -o "$output_path" "$url" | 
        pv -lep -s 100 > /dev/null
        echo -e "${GREEN}Downloaded YouTube MP4 successfully in Download folder!${NC}"
        ;;
        
    3) 
        read -p "Enter YouTube Video URL: " url
        output_path="/sdcard/Download/YouTubeAudio.mp3"
        echo -e "${GREEN}Downloading YouTube MP3...${NC}"
        yt-dlp -f bestaudio -o "$output_path" "$url" | 
        pv -lep -s 100 > /dev/null
        echo -e "${GREEN}Downloaded YouTube MP3 successfully in Download folder!${NC}"
        ;;
        
    4) 
        echo -e "${YELLOW}Device Information:${NC}"
        echo -e "${GREEN}Manufacturer: $(getprop ro.product.manufacturer)${NC}"
        echo -e "${GREEN}Model: $(getprop ro.product.model)${NC}"
        echo -e "${GREEN}Android Version: $(getprop ro.build.version.release)${NC}"
        echo -e "${GREEN}Hardware: $(getprop ro.hardware)${NC}"
        echo -e "${GREEN}Kernel Version: $(uname -r)${NC}"
        echo -e "${GREEN}Battery Status: $(termux-battery-status)${NC}"
        echo -e "${GREEN}SIM Details: $(termux-telephony-deviceinfo)${NC}"
        ;;
        
    5) 
        read -p "Enter Banned WhatsApp Number: " number
        echo -e "${GREEN}Request sent to unban: $number${NC}"
        ;;
        
    6) 
        termux-open "https://youtu.be/xvtmMA1zb-k?si=MlR5B_kUYrVxopdZ"
        ;;
        
    7)
        termux-open "https://www.tiktok.com/@alihamza327442?_t=ZS-8tbF8zMAwoD&_r=1"
        ;;
        
    8)
        termux-open "https://whatsapp.com/channel/0029VaU5UfBBVJl2sqYwbJ1t"
        ;;
        
    9)
        echo -e "${YELLOW}Please upload an image with the math question.${NC}"
        read -p "Enter image file path: " img_path
        if [ -f "$img_path" ]; then
            python math_solver.py "$img_path"
        else
            echo -e "${RED}File not found!${NC}"
        fi
        ;;
        
    0) 
        echo -e "${RED}Exiting...${NC}"
        exit 1
        ;;
        
    *) 
        echo -e "${RED}Invalid Option!${NC}"
        ;;
esac
