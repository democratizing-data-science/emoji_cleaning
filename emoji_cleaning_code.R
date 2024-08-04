# Procedure to replace emojies with text for topic modeling and sentiment and emotion network analysis
# Install and/or load required packages
packages = c("textclean", "lexicon")
## Now load or install&load all
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)
# Read toy data from Github
a <- readRDS(gzcon(url("https://github.com/democratizing-data-science/emoji_cleaning/raw/main/Nike_Commercial.rds")))
# Replace
a$Comment2 <- replace_emoji(a$Comment, emoji_dt = lexicon::hash_emojis)
# Compare
head(a[,c("Comment", "Comment2")])
