#include <syslog.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>


int main(int argc, char** argv) {
  if (argc < 3) {
    syslog(LOG_ERR, "Usage: %s file str", argv[0]);
    return 1;
  }

  char const* file = argv[1];
  char const* str = argv[2];

  syslog(LOG_DEBUG, "Writing %s to %s", str, file);

  int const fd = open(file, O_CREAT | O_WRONLY, 0644);
  if (fd == -1) {
    syslog(LOG_ERR, "Couldn't open file: %s", strerror(errno));
    return 1;
  }

  int const bytes = dprintf(fd, "%s\n", str);
  if (bytes < 0) {
    syslog(LOG_ERR, "Couldn't write to file");
    return 1;
  }

  return 0;
}
