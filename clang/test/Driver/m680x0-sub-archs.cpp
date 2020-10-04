// RUN: %clang -### -target m680x0-unknown-linux -mcpu=68000 %s 2>&1 | FileCheck --check-prefix=CHECK-MX00 %s
// RUN: %clang -### -target m680x0-unknown-linux -mcpu=m68000 %s 2>&1 | FileCheck --check-prefix=CHECK-MX00 %s
// RUN: %clang -### -target m680x0-unknown-linux -mcpu=M68000 %s 2>&1 | FileCheck --check-prefix=CHECK-MX00 %s
// RUN: %clang -### -target m680x0-unknown-linux -m68000 %s 2>&1 | FileCheck --check-prefix=CHECK-MX00 %s
// CHECK-MX00: "-target-cpu" "M68000"

// RUN: %clang -### -target m680x0-unknown-linux -mcpu=68010 %s 2>&1 | FileCheck --check-prefix=CHECK-MX10 %s
// RUN: %clang -### -target m680x0-unknown-linux -mcpu=m68010 %s 2>&1 | FileCheck --check-prefix=CHECK-MX10 %s
// RUN: %clang -### -target m680x0-unknown-linux -mcpu=M68010 %s 2>&1 | FileCheck --check-prefix=CHECK-MX10 %s
// RUN: %clang -### -target m680x0-unknown-linux -m68010 %s 2>&1 | FileCheck --check-prefix=CHECK-MX10 %s
// CHECK-MX10: "-target-cpu" "M68010"

// RUN: %clang -### -target m680x0-unknown-linux -mcpu=68020 %s 2>&1 | FileCheck --check-prefix=CHECK-MX20 %s
// RUN: %clang -### -target m680x0-unknown-linux -mcpu=m68020 %s 2>&1 | FileCheck --check-prefix=CHECK-MX20 %s
// RUN: %clang -### -target m680x0-unknown-linux -mcpu=M68020 %s 2>&1 | FileCheck --check-prefix=CHECK-MX20 %s
// RUN: %clang -### -target m680x0-unknown-linux -m68020 %s 2>&1 | FileCheck --check-prefix=CHECK-MX20 %s
// CHECK-MX20: "-target-cpu" "M68020"

// RUN: %clang -### -target m680x0-unknown-linux -mcpu=68030 %s 2>&1 | FileCheck --check-prefix=CHECK-MX30 %s
// RUN: %clang -### -target m680x0-unknown-linux -mcpu=m68030 %s 2>&1 | FileCheck --check-prefix=CHECK-MX30 %s
// RUN: %clang -### -target m680x0-unknown-linux -mcpu=M68030 %s 2>&1 | FileCheck --check-prefix=CHECK-MX30 %s
// RUN: %clang -### -target m680x0-unknown-linux -m68030 %s 2>&1 | FileCheck --check-prefix=CHECK-MX30 %s
// CHECK-MX30: "-target-cpu" "M68030"

// RUN: %clang -### -target m680x0-unknown-linux -mcpu=68040 %s 2>&1 | FileCheck --check-prefix=CHECK-MX40 %s
// RUN: %clang -### -target m680x0-unknown-linux -mcpu=m68040 %s 2>&1 | FileCheck --check-prefix=CHECK-MX40 %s
// RUN: %clang -### -target m680x0-unknown-linux -mcpu=M68040 %s 2>&1 | FileCheck --check-prefix=CHECK-MX40 %s
// RUN: %clang -### -target m680x0-unknown-linux -m68040 %s 2>&1 | FileCheck --check-prefix=CHECK-MX40 %s
// CHECK-MX40: "-target-cpu" "M68040"
