program randomnesspoems1reyza.aleo;

record AccountQueryRecord:
    owner as address.private;
    node_id as field.private;
    game_id as field.private;
    pool_id as field.private;
    account_id as field.private;
    asset_id as field.private;
    diffie as scalar.private;
    diffie_bruh as scalar.private;
    z1 as field.private;
    z2 as field.private;
    z3 as field.private;
    z4 as field.private;
    z5 as field.private;


closure generate_field:
    input r0 as field;
    input r1 as scalar;
    hash.bhp256 r0 into r2 as field;    hash.bhp256 r1 into r3 as scalar;    commit.bhp256 r2 r3 into r4 as field;    output r4 as field;


closure generate_ziffie:
    input r0 as field;
    input r1 as scalar;
    hash.bhp256 r0 into r2 as field;    hash.bhp256 r1 into r3 as scalar;    commit.bhp256 r2 r3 into r4 as field;    output r4 as field;


closure generate_scalar:
    input r0 as scalar;
    hash.bhp256 r0 into r1 as scalar;    output r1 as scalar;


function interpretations:
    input r0 as field.private;
    input r1 as field.private;
    input r2 as field.private;
    input r3 as address.private;
    input r4 as scalar.private;
    call generate_scalar r4 into r5;
    add r4 r4 into r6;
    call generate_scalar r6 into r7;
    call generate_field r0 r5 into r8;
    call generate_ziffie r8 r5 into r9;
    call generate_field r2 r7 into r10;
    call generate_ziffie r10 r4 into r11;
    mul r1 r2 into r12;
    call generate_field r12 r7 into r13;
    call generate_ziffie r13 r7 into r14;
    add r0 r2 into r15;
    call generate_field r15 r5 into r16;
    call generate_ziffie r16 r5 into r17;
    mul r0 r1 into r18;
    call generate_field r18 r5 into r19;
    call generate_ziffie r19 r4 into r20;
    cast r3 r8 r10 r13 r16 r19 r5 r7 r9 r11 r14 r17 r20 into r21 as AccountQueryRecord.record;
    output r21 as AccountQueryRecord.record;
