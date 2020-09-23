// RUN: %clang -### -target m680x0-unknown-linux -mcpu=68000 %s 2>&1 | FileCheck --check-prefix=CHECK-MX00 %s
// RUN: %clang -### -target m680x0-unknown-linux -m68000 %s 2>&1 | FileCheck --check-prefix=CHECK-MX00 %s
// CHECK-MX00: "-target-cpu" "68000"

// RUN: %clang -### -target m680x0-unknown-linux -mcpu=68010 %s 2>&1 | FileCheck --check-prefix=CHECK-MX10 %s
// RUN: %clang -### -target m680x0-unknown-linux -m68010 %s 2>&1 | FileCheck --check-prefix=CHECK-MX10 %s
// CHECK-MX10: "-target-cpu" "68010"

// RUN: %clang -### -target m680x0-unknown-linux -mcpu=68020 %s 2>&1 | FileCheck --check-prefix=CHECK-MX20 %s
// RUN: %clang -### -target m680x0-unknown-linux -m68020 %s 2>&1 | FileCheck --check-prefix=CHECK-MX20 %s
// CHECK-MX20: "-target-cpu" "68020"

// RUN: %clang -### -target m680x0-unknown-linux -mcpu=68030 %s 2>&1 | FileCheck --check-prefix=CHECK-MX30 %s
// RUN: %clang -### -target m680x0-unknown-linux -m68030 %s 2>&1 | FileCheck --check-prefix=CHECK-MX30 %s
// CHECK-MX30: "-target-cpu" "68030"

// RUN: %clang -### -target m680x0-unknown-linux -mcpu=68040 %s 2>&1 | FileCheck --check-prefix=CHECK-MX40 %s
// RUN: %clang -### -target m680x0-unknown-linux -m68040 %s 2>&1 | FileCheck --check-prefix=CHECK-MX40 %s
// CHECK-MX40: "-target-cpu" "68040"

// RUN: %clang -### -target m680x0-unknown-linux -mcpu=68060 %s 2>&1 | FileCheck --check-prefix=CHECK-MX60 %s
// RUN: %clang -### -target m680x0-unknown-linux -m68060 %s 2>&1 | FileCheck --check-prefix=CHECK-MX60 %s
// CHECK-MX60: "-target-cpu" "68060"
