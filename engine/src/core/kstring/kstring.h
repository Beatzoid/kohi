#pragma once

#include "defines.h"

// Returns the length of the given string.
KAPI u64 string_length(const char *str);

KAPI char *string_duplicate(const char *str);

// Case-senstive string comparison. Returns true if they are the same, false otherwise
KAPI b8 strings_equal(const char *str0, const char *str1);
