####HW 2####
set.seed(123)  # for reproducibility

n <- 50  # number of participants
num_items <- 24

# Generate data matrix with values 1-5, approximately normal but rounded
data_matrix <- matrix(
  round(pmin(pmax(rnorm(n * num_items, mean = 3.5, sd = 1), 1), 5)),
  nrow = n, ncol = num_items
)

# Convert to data frame and assign column names
df <- as.data.frame(data_matrix)
colnames(df) <- paste0("q_", 1:num_items)

# Add participant ID column
df$ID <- 1:n

# Reorder columns to have ID first
df <- df[, c("ID", paste0("q_", 1:num_items))]

# View first few rows
head(df)

# If you want to export to CSV:
#write.csv(df, "HW 2.csv", row.names = FALSE)

####HW 3####
# Set seed for reproducibility
set.seed(42)

# Generate 55 valid social media usage values (0–720 minutes)
social_media_valid <- round(rnorm(55, mean = 180, sd = 60))
social_media_valid <- pmin(pmax(social_media_valid, 0), 720)  # clamp to 0–720

# Generate 55 valid self-esteem scores (10–40 scale)
self_esteem_valid <- round(rnorm(55, mean = 25, sd = 5))
self_esteem_valid <- pmin(pmax(self_esteem_valid, 10), 40)  # clamp to 10–40

# Add 5 invalid/extreme entries
social_media_invalid <- c(800, -50, 7000, 650, 900)
self_esteem_invalid <- c(5, 45, 9, 100, 0)

# Combine valid and invalid data
social_media <- c(social_media_valid, social_media_invalid)
self_esteem <- c(self_esteem_valid, self_esteem_invalid)

# Create participant IDs
participant_id <- sprintf("P%03d", 1:60)

# Build data frame
lab_data <- data.frame(
  Participant_ID = participant_id,
  Social_Media_Min = social_media,
  Self_Esteem_Score = self_esteem
)

# Save to CSV
#write.csv(lab_data, "HW 3.csv", row.names = FALSE)

####HW 4####
set.seed(42)

# Sample size
n_per_group <- 45
total_n <- n_per_group * 2

# Generate participant IDs
Participant_ID <- sprintf("%03d", 1:total_n)

# Group assignment
Group <- c(rep(1, n_per_group), rep(2, n_per_group))  # 1 = Feedback, 2 = No Feedback

# Simulate values
Metamemory_Accuracy <- c(
  rnorm(n_per_group, mean = 0.6, sd = 0.15),  # Feedback group
  rnorm(n_per_group, mean = 0.3, sd = 0.15)   # No Feedback group
)

Confidence_Mean <- c(
  rnorm(n_per_group, mean = 85, sd = 5),  # Feedback group
  rnorm(n_per_group, mean = 75, sd = 6)   # No Feedback group
)

Recall_Performance <- c(
  rnorm(n_per_group, mean = 80, sd = 7),  # Feedback group
  rnorm(n_per_group, mean = 70, sd = 8)   # No Feedback group
)

# Clip Confidence and Recall between 0 and 100
Confidence_Mean <- pmin(pmax(Confidence_Mean, 0), 100)
Recall_Performance <- pmin(pmax(Recall_Performance, 0), 100)

# Add 2 outliers in Metamemory_Accuracy
outlier_indices <- sample(1:total_n, 2)
Metamemory_Accuracy[outlier_indices[1]] <- 2.5   # extreme high outlier
Metamemory_Accuracy[outlier_indices[2]] <- -2.0  # extreme low outlier

# Create data frame
df <- data.frame(
  Participant_ID,
  Group,
  Metamemory_Accuracy = round(Metamemory_Accuracy, 3),
  Confidence_Mean = round(Confidence_Mean, 1),
  Recall_Performance = round(Recall_Performance, 1)
)

# Write to CSV
#write.csv(df, "HW 4.csv", row.names = FALSE)

