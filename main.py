import gymnasium as gym
from gymnasium import spaces
import numpy as np
import pyautogui
from time import sleep
import biro  # Importing your custom reward script

class GameEnvironment(gym.Env):
    def __init__(self, max_steps=100):
        super(GameEnvironment, self).__init__()
        # Define action space: w, tab, 1, left, right
        self.action_space = spaces.Discrete(5)  # 0 = w, 1 = tab, 2 = 1, 3 = left, 4 = right
        
        # Define observation space (experience, steps remaining)
        self.observation_space = spaces.Box(low=0, high=100, shape=(2,), dtype=np.float32)
        
        # Initialize the state
        self.state = np.array([0, max_steps])  # experience, remaining steps
        self.max_steps = max_steps
        self.steps_remaining = max_steps

    def step(self, action):
        # Map the action to a specific key press
        key_mapping = {
            0: 'w',
            1: 'tab',
            2: '1',
            3: 'left',
            4: 'right'
        }
        
        # Press the key
        if action in key_mapping:
            pyautogui.keyDown(key_mapping[action])
            sleep(0.2)
            pyautogui.keyUp(key_mapping[action])
        
        # Wait briefly to allow the game to process the input (if needed)
        sleep(3)

        # Call the reward function from biro.py
        current_reward = biro.reward()
        
        # Update the total reward (use the reward returned by biro)
        self.state[0] += current_reward  # Update total experience
        self.state[1] -= 1  # Decrease the remaining steps
        
        # Define the done condition (episode ends if timer runs out)
        done = self.state[1] <= 0
        
        # Return state, reward, done condition
        return self.state, current_reward, done, {}

    def reset(self):
        # Reset the state to the initial values
        self.state = np.array([0, self.max_steps])  # Reset experience and steps
        return self.state