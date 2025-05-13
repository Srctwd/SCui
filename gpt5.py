import os
import sys
import random
import keyboard
import numpy as np
import biro

# Simplified BIRO Game Environment
class GameEnvironment:
    def __init__(self):
        self.action_space = 6  # Corresponding to actions [0, 1, 2, 3, 4]

    def step(self, action):
        # Execute the action using BIRO
        biro.act(action)
        state, reward = biro.state()
        # Observe the current state and reward from BIRO
        state_int = int(''.join(map(str, state)), 2)  # Convert binary state to integer
        return state_int, reward

    def reset(self):
        # Assume the initial state is always 0
        return 0

# Q-learning parameters
alpha = 0.3  # Learning rate
gamma = 0.99  # Discount factor
epsilon = 0.2  # Exploration rate
epsilon_min = 0.01
epsilon_decay = 0.99
episodes = 50  # Number of training episodes

# Initialize Q-table
num_states = 32  # 2^5 possible states for binary state [0, 1, 0, 1, 1]
num_actions = 6
q_table = np.zeros((num_states, num_actions))

# Load the Q-table if it exists
if os.path.exists("q_table.npy"):
    q_table = np.load("q_table.npy")
    print("Loaded existing Q-table.")

# Training loop
env = GameEnvironment()
for episode in range(episodes):
    if keyboard.is_pressed('q'):
        sys.exit()
    state = env.reset()
    total_reward = 0

    for step in range(70):  # Limit steps per episode
        if keyboard.is_pressed('q'):
            sys.exit()
        # Epsilon-greedy action selection
        if random.uniform(0, 1) < epsilon:
            action = random.randint(0, num_actions - 1)  # Explore
            print(action)
        else:
            action = np.argmax(q_table[state])  # Exploit

        # Take action and observe the new state and reward[]
        next_state, reward = env.step(action)
        total_reward += reward

        # Update Q-value using the Q-learning formula
        best_next_action = np.argmax(q_table[next_state])
        td_target = reward + gamma * q_table[next_state, best_next_action]
        q_table[state, action] += alpha * (td_target - q_table[state, action])

        # Update the current state
        state = next_state

        if reward == 1:  # End the episode if reward is obtained
            break

    # Decay epsilon to reduce exploration over time
    epsilon = max(epsilon_min, epsilon * epsilon_decay)

#    # Save the Q-table every 20 episodes
#    if episode % 2 == 0:
#        np.save("q_table.npy", q_table)
#        print(f"Episode {episode}, Total Reward: {total_reward}, Epsilon: {epsilon}")
#
#print("Training complete. Final Q-table:\n", q_table)
#np.save("q_table.npy", q_table)  # Save final Q-table
