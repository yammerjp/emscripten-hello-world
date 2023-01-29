#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

#define BUFFER_SIZE 2048

void die(char *path) {
  perror(path);
  exit(1);
}

void output_fd(int fd, char *path) {
  char buf[BUFFER_SIZE];
  int charlen;

  for (;;) {
    charlen = read(fd, buf, sizeof buf);
    if (charlen < 0)
      die(path);
    if (charlen == 0)
      break;

    if (write(STDOUT_FILENO, buf, charlen) < 0)
      die(path);
  }
}

void output_file(char *path) {
  int fd;

  fd = open (path, O_RDONLY);
  if (fd < 0) {
    die(path);
  }

  output_fd(fd, path);

  if (close(fd) < 0)
    die(path);
}

int main(int argc, char* argv[]) {
  if (argc < 2) {
    output_fd(STDIN_FILENO, "/dev/stdin");
    return 0;
  }

  for (int file_num = 1; file_num < argc; file_num++) {
    output_file(argv[file_num]);
  }
}
