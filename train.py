import numpy as np
import random
import time
from main import GameEnvironment

env = GameEnvironment(max_steps=100)
max_steps=100

# Hyperparameters
alpha = 0.1  # Learning rate
gamma = 0.99  # Discount factor
epsilon = 1.0  # Exploration rate
epsilon_min = 0.01
epsilon_decay = 0.995
episodes = 1000  # Number of training episodes

# Initialize Q-table
state_size = 3  # Assuming 3 dimensions: experience, health, and steps
action_size = env.action_space.n
q_table = np.zeros((1000, 1000, 1000, action_size))  # Replace 1000s with appropriate state discretization

# Training loop
for episode in range(episodes):
    state = env.reset()
    total_reward = 0
    done = False
    
    for step in range(max_steps):
        # Epsilon-greedy action selection
        if random.uniform(0, 1) < epsilon:
            action = env.action_space.sample()  # Explore
        else:
            action = np.argmax(q_table[state[0], state[1], state[2]])  # Exploit
        
        # Take action in the environment
        next_state, reward, done, _ = env.step(action)
        total_reward += reward
        
        # Update Q-value
        best_next_action = np.argmax(q_table[next_state[0], next_state[1], next_state[2]])
        td_target = reward + gamma * q_table[next_state[0], next_state[1], next_state[2], best_next_action]
        q_table[state[0], state[1], state[2], action] += alpha * (td_target - q_table[state[0], state[1], state[2], action])
        
        # Update state
        state = next_state
        
        if done:
            break
    
    # Decay epsilon
    epsilon = max(epsilon_min, epsilon * epsilon_decay)
    
    print(f"Episode {episode + 1}/{episodes}, Total Reward: {total_reward}, Epsilon: {epsilon:.2f}")