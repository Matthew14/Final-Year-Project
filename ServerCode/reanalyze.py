import sys
from pg_db import Postgres


def get_all_tracks_for_user(username, db):
    return []


def exit_on_error(err):
    print err
    sys.exit(1)


if  __name__ == "__main__":
    if len(sys.argv) < 2:
        exit_on_error('User not specified')

    username = sys.argv[1]
    db = Postgres()

    if not db.user_exists(username):
        exit_on_error("user {} does not exist".format(username))

    db.update_analysis_state(username, True)

    import time
    time.sleep(10)

    db.update_analysis_state(username, False)
