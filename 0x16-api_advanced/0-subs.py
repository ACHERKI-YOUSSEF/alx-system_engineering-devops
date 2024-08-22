#!/usr/bin/python3
"""
    Uses Reddit API to print the number of subscribers of a subreddit
"""
import requests


def number_of_subscribers(subreddit):
    # Set up the URL and headers with a custom User-Agent
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {'User-Agent': 'custom-agent'}
    
    try:
        # Make the GET request to the Reddit API
        response = requests.get(url, headers=headers, allow_redirects=False)
        
        # Check if the request was successful
        if response.status_code == 200:
            data = response.json()
            # Return the number of subscribers
            return data['data']['subscribers']
        else:
            # If status code is not 200, return 0 (invalid subreddit)
            return 0
    except requests.exceptions.RequestException:
        # In case of a network error, return 0
        return 0
