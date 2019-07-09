module CommentsHelper
  def display_likes(comment)
    votes = comment.votes_for.up.by_type(User)
    return list_likers(votes) if votes.size <= 1
    count_likers(votes)
  end

  private

  def list_likers(votes)
    usernames = []
    unless votes.blank?
      votes.voters.each do |voter|
      usernames.push(link_to voter.username,
      profile_path(voter.username),
      class: 'username')
    end
    usernames.to_sentence.html_safe + like_plural(votes)
    end
  end 

  def count_likers(votes)
    vote_count = vote.size
    vote_count.to_s + ' likes'
  end 

  def like_plural(votes)
    return ' like this' if votes.count > 1
    ' likes this'
  end
end
