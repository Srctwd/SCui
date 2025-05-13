import os
import glob
import pyautogui
from PIL import Image
from time import sleep

last_action = None


def state():
    combat = 0
    target = 0
    casting = 0     
    not_facing = 0
    out_of_range = 0
    reward = 0
    pyautogui.click()
    pyautogui.press('[')
    sleep(0.126)
    folder_path = "C:\\Program Files (x86)\\World of Warcraft\\_classic_era_\\Screenshots"
    image = glob.glob(os.path.join(folder_path, "*"))
    if not image:
        return [0,0,0,0,0], 0
    image = max(image, key=os.path.getmtime)
    with Image.open(image).convert("1") as img:
        width, height = img.size
        chat = img.crop((38, height - 70, width/14, height-59))
        if chat.getpixel((5, 5)) == 255:
            combat = 1
        if chat.getpixel((18, 5)) == 255:
            target = 1 
        if chat.getpixel((31, 5)) == 255:
            casting = 1             
        if chat.getpixel((44, 5)) == 255:
            not_facing = 1             
        if chat.getpixel((57, 5)) == 255:
            out_of_range = 1
        if chat.getpixel((70, 5)) == 255:
            reward += 1
        if chat.getpixel((83, 5)) == 255:
            reward += 1          
        chat.save("chat.png")
        os.remove(image)
        pyautogui.press("0")
        return (combat, target, casting, not_facing, out_of_range), reward
        #resized_img = img.resize((192, 108))
        #resized_img.save("res.png")

    

def act(action):
    global last_action
    key_mapping = {0: '1', 1: 'w', 2: 'tab', 3: 'left', 4: 'right', 5: ""}
    pyautogui.keyDown(key_mapping[action])
    if last_action != None:
        pyautogui.keyUp(key_mapping[last_action])
    last_action = action
    return



print(state())

