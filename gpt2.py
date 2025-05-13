import numpy as np
import random
import biro

# Define constants
NUM_ACTIONS = 5
NUM_STATES = 32  # 2^5 possible states for a binary list of length 5
EPISODES = 1000
LEARNING_RATE = 0.1
DISCOUNT_FACTOR = 0.99
EPSILON = 0.1

# Initialize Q-table
Q_table = np.zeros((NUM_STATES, NUM_ACTIONS))

# Define BIRO class
class BIRO:
    def __init__(self):
        self.state, self.reward = biro.state()

    def get_state(self):
        state, _ = biro.state()
        # Convert binary list to a unique integer
        return int(''.join(map(str, state)), 2)

    def act(self, action):
        biro.act(action)  # Execute the action
        state, reward = biro.state()  # Retrieve the updated state and reward
        # Convert binary list to a unique integer
        return int(''.join(map(str, state)), 2), reward

# Training the RL agent
def train_biro_agent():
    biro_system = BIRO()
    
    for episode in range(EPISODES):
        state = biro_system.get_state()

        for _ in range(100):  # Limit the steps per episode
            # Epsilon-greedy action selection
            if random.random() < EPSILON:
                action = random.randint(0, NUM_ACTIONS - 1)
            else:
                action = np.argmax(Q_table[state])

            # Execute action and observe result
            new_state, reward = biro_system.act(action)

            # Debugging: Print states and rewards
            print(f"State: {state}, Action: {action}, New State: {new_state}, Reward: {reward}")

            # Update Q-table using the Q-learning formula
            Q_table[state, action] = Q_table[state, action] + LEARNING_RATE * (
                reward + DISCOUNT_FACTOR * np.max(Q_table[new_state]) - Q_table[state, action]
            )

            state = new_state

    return Q_table

# Train the agent
Q_table = train_biro_agent()

# Save the Q-table to a file
np.savetxt("Q_table.txt", Q_table, fmt="%.6f")
print("Training complete. Q-table saved to 'Q_table.txt'.")