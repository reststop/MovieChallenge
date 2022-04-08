# MovieChallenge

## Task

Using Objective C, fetch data from a web service and display the returned data
in a ist.  When one item is selected, display the full details of a selected
film on a separate detail screen.


## Requirements

- Data Feed: Use the APIs at: https://swapi.dev/api/films/
- Store the data in persistent storage
- Display a message to the user if data or persistent storage is unavailable
- Fetch the data Asynchronously
- Display the returned data in a UITableView

When the user taps on a Cell, display a new screen that displays all the details
of the selected film.

At minimum this should include:

- Title
- Director
- Release Date
- Opening Crawl text

These are minimums.  (Impress us!)


## Design decisions

### Persistent Storage

I chose to use NSURLCache which has both an on-disk and in-memory capability.
Everything copied to the disk cache persists across program launches.

### Asynchronous data fetching

The methods for data fetching are segregated in the Network module which
also manages the on-disk directory used by NSURLCache.  The app-wide cache
is setup in the AppDelegate.

### Extra credit

I used some Star Wars themed background images and spent an hour or two
tweaking code I found via stackoverflow to present the crawl text in the
flavor of the Star Wars scroll.


