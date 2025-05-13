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
        pass

    def get_state(self):
        state, reward = biro.state()
        # Convert binary list to a unique integer
        return int(''.join(map(str, state)), 2), reward

    def act(self, action):
        biro.act(action)  # Execute the action

# Training the RL agent
def train_biro_agent():
    biro_system = BIRO()
    action_counts = [0] * NUM_ACTIONS  # Track action usage

    for episode in range(EPISODES):
        state, _ = biro_system.get_state()

        for step in range(100):  # Limit the steps per episode
            # Epsilon-greedy action selection
            if random.random() < EPSILON:
                action = random.randint(0, NUM_ACTIONS - 1)
                print(f"Random action selected: {action} (Exploration)")
            else:
                action = np.argmax(Q_table[state])
                print(f"Best action selected: {action} (Exploitation)")

            action_counts[action] += 1  # Track action usage

            # Execute action
            biro_system.act(action)

            # Observe new state and reward
            new_state, reward = biro_system.get_state()

            # Debugging: Print states and rewards
            print(f"Episode: {episode}, Step: {step}, State: {state}, Action: {action}, New State: {new_state}, Reward: {reward} (1 = Reward, 0 = No Reward)")

            # Update Q-table using the Q-learning formula
            Q_table[state, action] = Q_table[state, action] + LEARNING_RATE * (
                reward + DISCOUNT_FACTOR * np.max(Q_table[new_state]) - Q_table[state, action]
            )

            state = new_state

    print("Action distribution during training:", action_counts)
    return Q_table

# Train the agent
Q_table = train_biro_agent()

# Save the Q-table to a file
np.savetxt("Q_table.txt", Q_table, fmt="%.6f")
print("Training complete. Q-table saved to 'Q_table.txt'.")
