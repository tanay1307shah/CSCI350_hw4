
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc c0 b5 10 80       	mov    $0x8010b5c0,%esp
8010002d:	b8 60 2e 10 80       	mov    $0x80102e60,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb f4 b5 10 80       	mov    $0x8010b5f4,%ebx
  struct buf head;
} bcache;

void
binit(void)
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010004c:	68 c0 70 10 80       	push   $0x801070c0
80100051:	68 c0 b5 10 80       	push   $0x8010b5c0
80100056:	e8 85 42 00 00       	call   801042e0 <initlock>

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 0c fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd0c
80100062:	fc 10 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 10 fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd10
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba bc fc 10 80       	mov    $0x8010fcbc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008b:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 c7 70 10 80       	push   $0x801070c7
80100097:	50                   	push   %eax
80100098:	e8 13 41 00 00       	call   801041b0 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 10 fd 10 80       	mov    0x8010fd10,%eax

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
801000b0:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d bc fc 10 80       	cmp    $0x8010fcbc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
static struct buf*
bget(uint dev, uint blockno)
{
  struct buf *b;

  acquire(&bcache.lock);
801000df:	68 c0 b5 10 80       	push   $0x8010b5c0
801000e4:	e8 57 43 00 00       	call   80104440 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d 10 fd 10 80    	mov    0x8010fd10,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  // Not cached; recycle an unused buffer.
  // Even if refcnt==0, B_DIRTY indicates a buffer is in use
  // because log.c has modified it but not yet committed it.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 0c fd 10 80    	mov    0x8010fd0c,%ebx
80100126:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 c0 b5 10 80       	push   $0x8010b5c0
80100162:	e8 89 43 00 00       	call   801044f0 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 7e 40 00 00       	call   801041f0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
bread(uint dev, uint blockno)
{
  struct buf *b;

  b = bget(dev, blockno);
  if((b->flags & B_VALID) == 0) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
    iderw(b);
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 6d 1f 00 00       	call   801020f0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
  }
  return b;
}
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
      release(&bcache.lock);
      acquiresleep(&b->lock);
      return b;
    }
  }
  panic("bget: no buffers");
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 ce 70 10 80       	push   $0x801070ce
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
}

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 dd 40 00 00       	call   80104290 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
  b->flags |= B_DIRTY;
  iderw(b);
801001c4:	e9 27 1f 00 00       	jmp    801020f0 <iderw>
// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 df 70 10 80       	push   $0x801070df
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 9c 40 00 00       	call   80104290 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 4c 40 00 00       	call   80104250 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
8010020b:	e8 30 42 00 00       	call   80104440 <acquire>
  b->refcnt--;
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100213:	83 c4 10             	add    $0x10,%esp
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
80100216:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100219:	85 c0                	test   %eax,%eax
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100232:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
  b->refcnt--;
  if (b->refcnt == 0) {
    // no one is waiting for it.
    b->next->prev = b->prev;
    b->prev->next = b->next;
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
80100241:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 c0 b5 10 80 	movl   $0x8010b5c0,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
  
  release(&bcache.lock);
8010025c:	e9 8f 42 00 00       	jmp    801044f0 <release>
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 e6 70 10 80       	push   $0x801070e6
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 cb 14 00 00       	call   80101750 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 af 41 00 00       	call   80104440 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
    while(input.r == input.w){
801002a1:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002a6:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 a0 ff 10 80       	push   $0x8010ffa0
801002bd:	e8 6e 3a 00 00       	call   80103d30 <sleep>

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
801002c2:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
      if(myproc()->killed){
801002d2:	e8 a9 34 00 00       	call   80103780 <myproc>
801002d7:	8b 40 24             	mov    0x24(%eax),%eax
801002da:	85 c0                	test   %eax,%eax
801002dc:	74 d2                	je     801002b0 <consoleread+0x40>
        release(&cons.lock);
801002de:	83 ec 0c             	sub    $0xc,%esp
801002e1:	68 20 a5 10 80       	push   $0x8010a520
801002e6:	e8 05 42 00 00       	call   801044f0 <release>
        ilock(ip);
801002eb:	89 3c 24             	mov    %edi,(%esp)
801002ee:	e8 7d 13 00 00       	call   80101670 <ilock>
        return -1;
801002f3:	83 c4 10             	add    $0x10,%esp
801002f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002fe:	5b                   	pop    %ebx
801002ff:	5e                   	pop    %esi
80100300:	5f                   	pop    %edi
80100301:	5d                   	pop    %ebp
80100302:	c3                   	ret    
80100303:	90                   	nop
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 a0 ff 10 80    	mov    %edx,0x8010ffa0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 20 ff 10 80 	movsbl -0x7fef00e0(%edx),%edx
    if(c == C('D')){  // EOF
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
80100322:	83 c6 01             	add    $0x1,%esi
    --n;
80100325:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
80100328:	83 fa 0a             	cmp    $0xa,%edx
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
    --n;
    if(c == '\n')
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&cons.lock);
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 a5 41 00 00       	call   801044f0 <release>
  ilock(ip);
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 1d 13 00 00       	call   80101670 <ilock>

  return target - n;
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a0                	jmp    801002fb <consoleread+0x8b>
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
80100360:	a3 a0 ff 10 80       	mov    %eax,0x8010ffa0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
    release(&cons.lock);
}

void
panic(char *s)
{
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 30             	sub    $0x30,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100378:	fa                   	cli    
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
80100379:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100380:	00 00 00 
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
80100383:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100386:	8d 75 f8             	lea    -0x8(%ebp),%esi
  uint pcs[10];

  cli();
  cons.locking = 0;
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
80100389:	e8 62 23 00 00       	call   801026f0 <lapicid>
8010038e:	83 ec 08             	sub    $0x8,%esp
80100391:	50                   	push   %eax
80100392:	68 ed 70 10 80       	push   $0x801070ed
80100397:	e8 c4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
8010039c:	58                   	pop    %eax
8010039d:	ff 75 08             	pushl  0x8(%ebp)
801003a0:	e8 bb 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003a5:	c7 04 24 9b 7a 10 80 	movl   $0x80107a9b,(%esp)
801003ac:	e8 af 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003b1:	5a                   	pop    %edx
801003b2:	8d 45 08             	lea    0x8(%ebp),%eax
801003b5:	59                   	pop    %ecx
801003b6:	53                   	push   %ebx
801003b7:	50                   	push   %eax
801003b8:	e8 43 3f 00 00       	call   80104300 <getcallerpcs>
801003bd:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003c0:	83 ec 08             	sub    $0x8,%esp
801003c3:	ff 33                	pushl  (%ebx)
801003c5:	83 c3 04             	add    $0x4,%ebx
801003c8:	68 01 71 10 80       	push   $0x80107101
801003cd:	e8 8e 02 00 00       	call   80100660 <cprintf>
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801003d2:	83 c4 10             	add    $0x10,%esp
801003d5:	39 f3                	cmp    %esi,%ebx
801003d7:	75 e7                	jne    801003c0 <panic+0x50>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801003d9:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e0:	00 00 00 
801003e3:	eb fe                	jmp    801003e3 <panic+0x73>
801003e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801003e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801003f0 <consputc>:
}

void
consputc(int c)
{
  if(panicked){
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 a1 57 00 00       	call   80105bc0 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
{
  int pos;

  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax

  if(c == '\n')
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 

  if(pos < 0 || pos > 25*80)
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 d8                	mov    %ebx,%eax
801004bd:	ee                   	out    %al,(%dx)

  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 e8 56 00 00       	call   80105bc0 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 dc 56 00 00       	call   80105bc0 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 d0 56 00 00       	call   80105bc0 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f8:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100514:	e8 d7 40 00 00       	call   801045f0 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 12 40 00 00       	call   80104540 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 05 71 10 80       	push   $0x80107105
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
    x = -xx;
  else
    x = xx;

  i = 0;
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 30 71 10 80 	movzbl -0x7fef8ed0(%edx),%edx
  }while((x /= base) != 0);
801005b8:	85 c0                	test   %eax,%eax
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
801005bd:	75 e9                	jne    801005a8 <printint+0x28>

  if(sign)
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
    buf[i++] = '-';
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  while(--i >= 0)
    consputc(buf[i]);
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
    consputc(buf[i]);
}
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80100609:	ff 75 08             	pushl  0x8(%ebp)
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
8010060f:	e8 3c 11 00 00       	call   80101750 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 20 3e 00 00       	call   80104440 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 a4 3e 00 00       	call   801044f0 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 1b 10 00 00       	call   80101670 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
{
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
    acquire(&cons.lock);

  if (fmt == 0)
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c != '%'){
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
    if(c == 0)
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
      break;
    switch(c){
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
    if(c != '%'){
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
      consputc(c);
      break;
    }
  }

  if(locking)
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
    release(&cons.lock);
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 a5 10 80       	push   $0x8010a520
8010070d:	e8 de 3d 00 00       	call   801044f0 <release>
80100712:	83 c4 10             	add    $0x10,%esp
}
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
      break;
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
      consputc(c);
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
      break;
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        s = "(null)";
80100788:	b8 18 71 10 80       	mov    $0x80107118,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
      for(; *s; s++)
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
        consputc(*s);
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 a5 10 80       	push   $0x8010a520
801007c8:	e8 73 3c 00 00       	call   80104440 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>

  if (fmt == 0)
    panic("null fmt");
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 1f 71 10 80       	push   $0x8010711f
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
  int c, doprocdump = 0;
801007f6:	31 f6                	xor    %esi,%esi

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int c, doprocdump = 0;

  acquire(&cons.lock);
801007fe:	68 20 a5 10 80       	push   $0x8010a520
80100803:	e8 38 3c 00 00       	call   80104440 <acquire>
  while((c = getc()) >= 0){
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
    switch(c){
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
80100831:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100836:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
        input.e--;
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
        consputc(BACKSPACE);
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
consoleintr(int (*getc)(void))
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        }
      }
      break;
    }
  }
  release(&cons.lock);
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 a5 10 80       	push   $0x8010a520
80100868:	e8 83 3c 00 00       	call   801044f0 <release>
  if(doprocdump) {
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 a0 ff 10 80    	sub    0x8010ffa0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008a5:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
801008a8:	89 15 a8 ff 10 80    	mov    %edx,0x8010ffa8
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
        input.buf[input.e++ % INPUT_BUF] = c;
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 20 ff 10 80    	mov    %cl,-0x7fef00e0(%eax)
        consputc(c);
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 a8 ff 10 80    	cmp    %eax,0x8010ffa8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
          input.w = input.e;
          wakeup(&input.r);
801008e9:	83 ec 0c             	sub    $0xc,%esp
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
        consputc(c);
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
          input.w = input.e;
801008ec:	a3 a4 ff 10 80       	mov    %eax,0x8010ffa4
          wakeup(&input.r);
801008f1:	68 a0 ff 10 80       	push   $0x8010ffa0
801008f6:	e8 e5 35 00 00       	call   80103ee0 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100908:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010090d:	39 05 a4 ff 10 80    	cmp    %eax,0x8010ffa4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
80100920:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
        consputc(BACKSPACE);
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
8010092f:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100934:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100948:	80 ba 20 ff 10 80 0a 	cmpb   $0xa,-0x7fef00e0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
      break;
    }
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
80100977:	e9 54 36 00 00       	jmp    80103fd0 <procdump>
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010097c:	c6 80 20 ff 10 80 0a 	movb   $0xa,-0x7fef00e0(%eax)
        consputc(c);
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
  return n;
}

void
consoleinit(void)
{
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
801009a6:	68 28 71 10 80       	push   $0x80107128
801009ab:	68 20 a5 10 80       	push   $0x8010a520
801009b0:	e8 2b 39 00 00       	call   801042e0 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
801009b5:	58                   	pop    %eax
801009b6:	5a                   	pop    %edx
801009b7:	6a 00                	push   $0x0
801009b9:	6a 01                	push   $0x1
void
consoleinit(void)
{
  initlock(&cons.lock, "console");

  devsw[CONSOLE].write = consolewrite;
801009bb:	c7 05 6c 09 11 80 00 	movl   $0x80100600,0x8011096c
801009c2:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009c5:	c7 05 68 09 11 80 70 	movl   $0x80100270,0x80110968
801009cc:	02 10 80 
  cons.locking = 1;
801009cf:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009d6:	00 00 00 

  ioapicenable(IRQ_KBD, 0);
801009d9:	e8 c2 18 00 00       	call   801022a0 <ioapicenable>
}
801009de:	83 c4 10             	add    $0x10,%esp
801009e1:	c9                   	leave  
801009e2:	c3                   	ret    
801009e3:	66 90                	xchg   %ax,%ax
801009e5:	66 90                	xchg   %ax,%ax
801009e7:	66 90                	xchg   %ax,%ax
801009e9:	66 90                	xchg   %ax,%ax
801009eb:	66 90                	xchg   %ax,%ax
801009ed:	66 90                	xchg   %ax,%ax
801009ef:	90                   	nop

801009f0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
801009fc:	e8 7f 2d 00 00       	call   80103780 <myproc>
80100a01:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
80100a07:	e8 44 21 00 00       	call   80102b50 <begin_op>

  if((ip = namei(path)) == 0){
80100a0c:	83 ec 0c             	sub    $0xc,%esp
80100a0f:	ff 75 08             	pushl  0x8(%ebp)
80100a12:	e8 a9 14 00 00       	call   80101ec0 <namei>
80100a17:	83 c4 10             	add    $0x10,%esp
80100a1a:	85 c0                	test   %eax,%eax
80100a1c:	0f 84 9c 01 00 00    	je     80100bbe <exec+0x1ce>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100a22:	83 ec 0c             	sub    $0xc,%esp
80100a25:	89 c3                	mov    %eax,%ebx
80100a27:	50                   	push   %eax
80100a28:	e8 43 0c 00 00       	call   80101670 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a2d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a33:	6a 34                	push   $0x34
80100a35:	6a 00                	push   $0x0
80100a37:	50                   	push   %eax
80100a38:	53                   	push   %ebx
80100a39:	e8 12 0f 00 00       	call   80101950 <readi>
80100a3e:	83 c4 20             	add    $0x20,%esp
80100a41:	83 f8 34             	cmp    $0x34,%eax
80100a44:	74 22                	je     80100a68 <exec+0x78>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a46:	83 ec 0c             	sub    $0xc,%esp
80100a49:	53                   	push   %ebx
80100a4a:	e8 b1 0e 00 00       	call   80101900 <iunlockput>
    end_op();
80100a4f:	e8 6c 21 00 00       	call   80102bc0 <end_op>
80100a54:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a57:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a5f:	5b                   	pop    %ebx
80100a60:	5e                   	pop    %esi
80100a61:	5f                   	pop    %edi
80100a62:	5d                   	pop    %ebp
80100a63:	c3                   	ret    
80100a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a68:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a6f:	45 4c 46 
80100a72:	75 d2                	jne    80100a46 <exec+0x56>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a74:	e8 d7 62 00 00       	call   80106d50 <setupkvm>
80100a79:	85 c0                	test   %eax,%eax
80100a7b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a81:	74 c3                	je     80100a46 <exec+0x56>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a83:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a8a:	00 
80100a8b:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a91:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
80100a98:	00 00 00 
80100a9b:	0f 84 c5 00 00 00    	je     80100b66 <exec+0x176>
80100aa1:	31 ff                	xor    %edi,%edi
80100aa3:	eb 18                	jmp    80100abd <exec+0xcd>
80100aa5:	8d 76 00             	lea    0x0(%esi),%esi
80100aa8:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100aaf:	83 c7 01             	add    $0x1,%edi
80100ab2:	83 c6 20             	add    $0x20,%esi
80100ab5:	39 f8                	cmp    %edi,%eax
80100ab7:	0f 8e a9 00 00 00    	jle    80100b66 <exec+0x176>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100abd:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100ac3:	6a 20                	push   $0x20
80100ac5:	56                   	push   %esi
80100ac6:	50                   	push   %eax
80100ac7:	53                   	push   %ebx
80100ac8:	e8 83 0e 00 00       	call   80101950 <readi>
80100acd:	83 c4 10             	add    $0x10,%esp
80100ad0:	83 f8 20             	cmp    $0x20,%eax
80100ad3:	75 7b                	jne    80100b50 <exec+0x160>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100ad5:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100adc:	75 ca                	jne    80100aa8 <exec+0xb8>
      continue;
    if(ph.memsz < ph.filesz)
80100ade:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ae4:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100aea:	72 64                	jb     80100b50 <exec+0x160>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100aec:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100af2:	72 5c                	jb     80100b50 <exec+0x160>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100af4:	83 ec 04             	sub    $0x4,%esp
80100af7:	50                   	push   %eax
80100af8:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100afe:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b04:	e8 97 60 00 00       	call   80106ba0 <allocuvm>
80100b09:	83 c4 10             	add    $0x10,%esp
80100b0c:	85 c0                	test   %eax,%eax
80100b0e:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100b14:	74 3a                	je     80100b50 <exec+0x160>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100b16:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b1c:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b21:	75 2d                	jne    80100b50 <exec+0x160>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b23:	83 ec 0c             	sub    $0xc,%esp
80100b26:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b2c:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b32:	53                   	push   %ebx
80100b33:	50                   	push   %eax
80100b34:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b3a:	e8 a1 5f 00 00       	call   80106ae0 <loaduvm>
80100b3f:	83 c4 20             	add    $0x20,%esp
80100b42:	85 c0                	test   %eax,%eax
80100b44:	0f 89 5e ff ff ff    	jns    80100aa8 <exec+0xb8>
80100b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b50:	83 ec 0c             	sub    $0xc,%esp
80100b53:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b59:	e8 72 61 00 00       	call   80106cd0 <freevm>
80100b5e:	83 c4 10             	add    $0x10,%esp
80100b61:	e9 e0 fe ff ff       	jmp    80100a46 <exec+0x56>
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b66:	83 ec 0c             	sub    $0xc,%esp
80100b69:	53                   	push   %ebx
80100b6a:	e8 91 0d 00 00       	call   80101900 <iunlockput>
  end_op();
80100b6f:	e8 4c 20 00 00       	call   80102bc0 <end_op>
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100b74:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b7a:	83 c4 0c             	add    $0xc,%esp
  end_op();
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100b7d:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b82:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b87:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b8d:	52                   	push   %edx
80100b8e:	50                   	push   %eax
80100b8f:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b95:	e8 06 60 00 00       	call   80106ba0 <allocuvm>
80100b9a:	83 c4 10             	add    $0x10,%esp
80100b9d:	85 c0                	test   %eax,%eax
80100b9f:	89 c6                	mov    %eax,%esi
80100ba1:	75 3a                	jne    80100bdd <exec+0x1ed>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100ba3:	83 ec 0c             	sub    $0xc,%esp
80100ba6:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bac:	e8 1f 61 00 00       	call   80106cd0 <freevm>
80100bb1:	83 c4 10             	add    $0x10,%esp
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
80100bb4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bb9:	e9 9e fe ff ff       	jmp    80100a5c <exec+0x6c>
  struct proc *curproc = myproc();

  begin_op();

  if((ip = namei(path)) == 0){
    end_op();
80100bbe:	e8 fd 1f 00 00       	call   80102bc0 <end_op>
    cprintf("exec: fail\n");
80100bc3:	83 ec 0c             	sub    $0xc,%esp
80100bc6:	68 41 71 10 80       	push   $0x80107141
80100bcb:	e8 90 fa ff ff       	call   80100660 <cprintf>
    return -1;
80100bd0:	83 c4 10             	add    $0x10,%esp
80100bd3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bd8:	e9 7f fe ff ff       	jmp    80100a5c <exec+0x6c>
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bdd:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100be3:	83 ec 08             	sub    $0x8,%esp
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100be6:	31 ff                	xor    %edi,%edi
80100be8:	89 f3                	mov    %esi,%ebx
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bea:	50                   	push   %eax
80100beb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bf1:	e8 fa 61 00 00       	call   80106df0 <clearpteu>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bf6:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bf9:	83 c4 10             	add    $0x10,%esp
80100bfc:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c02:	8b 00                	mov    (%eax),%eax
80100c04:	85 c0                	test   %eax,%eax
80100c06:	74 79                	je     80100c81 <exec+0x291>
80100c08:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c0e:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c14:	eb 13                	jmp    80100c29 <exec+0x239>
80100c16:	8d 76 00             	lea    0x0(%esi),%esi
80100c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(argc >= MAXARG)
80100c20:	83 ff 20             	cmp    $0x20,%edi
80100c23:	0f 84 7a ff ff ff    	je     80100ba3 <exec+0x1b3>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c29:	83 ec 0c             	sub    $0xc,%esp
80100c2c:	50                   	push   %eax
80100c2d:	e8 4e 3b 00 00       	call   80104780 <strlen>
80100c32:	f7 d0                	not    %eax
80100c34:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c36:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c39:	5a                   	pop    %edx

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c3a:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c3d:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c40:	e8 3b 3b 00 00       	call   80104780 <strlen>
80100c45:	83 c0 01             	add    $0x1,%eax
80100c48:	50                   	push   %eax
80100c49:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c4c:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c4f:	53                   	push   %ebx
80100c50:	56                   	push   %esi
80100c51:	e8 ba 63 00 00       	call   80107010 <copyout>
80100c56:	83 c4 20             	add    $0x20,%esp
80100c59:	85 c0                	test   %eax,%eax
80100c5b:	0f 88 42 ff ff ff    	js     80100ba3 <exec+0x1b3>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c61:	8b 45 0c             	mov    0xc(%ebp),%eax
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c64:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c6b:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c6e:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c74:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c77:	85 c0                	test   %eax,%eax
80100c79:	75 a5                	jne    80100c20 <exec+0x230>
80100c7b:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c81:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c88:	89 d9                	mov    %ebx,%ecx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100c8a:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c91:	00 00 00 00 

  ustack[0] = 0xffffffff;  // fake return PC
80100c95:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c9c:	ff ff ff 
  ustack[1] = argc;
80100c9f:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100ca5:	29 c1                	sub    %eax,%ecx

  sp -= (3+argc+1) * 4;
80100ca7:	83 c0 0c             	add    $0xc,%eax
80100caa:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cac:	50                   	push   %eax
80100cad:	52                   	push   %edx
80100cae:	53                   	push   %ebx
80100caf:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cb5:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cbb:	e8 50 63 00 00       	call   80107010 <copyout>
80100cc0:	83 c4 10             	add    $0x10,%esp
80100cc3:	85 c0                	test   %eax,%eax
80100cc5:	0f 88 d8 fe ff ff    	js     80100ba3 <exec+0x1b3>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100ccb:	8b 45 08             	mov    0x8(%ebp),%eax
80100cce:	0f b6 10             	movzbl (%eax),%edx
80100cd1:	84 d2                	test   %dl,%dl
80100cd3:	74 19                	je     80100cee <exec+0x2fe>
80100cd5:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cd8:	83 c0 01             	add    $0x1,%eax
    if(*s == '/')
      last = s+1;
80100cdb:	80 fa 2f             	cmp    $0x2f,%dl
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cde:	0f b6 10             	movzbl (%eax),%edx
    if(*s == '/')
      last = s+1;
80100ce1:	0f 44 c8             	cmove  %eax,%ecx
80100ce4:	83 c0 01             	add    $0x1,%eax
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100ce7:	84 d2                	test   %dl,%dl
80100ce9:	75 f0                	jne    80100cdb <exec+0x2eb>
80100ceb:	89 4d 08             	mov    %ecx,0x8(%ebp)
    if(*s == '/')
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100cee:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100cf4:	50                   	push   %eax
80100cf5:	6a 10                	push   $0x10
80100cf7:	ff 75 08             	pushl  0x8(%ebp)
80100cfa:	89 f8                	mov    %edi,%eax
80100cfc:	83 c0 6c             	add    $0x6c,%eax
80100cff:	50                   	push   %eax
80100d00:	e8 3b 3a 00 00       	call   80104740 <safestrcpy>

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
  curproc->pgdir = pgdir;
80100d05:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
    if(*s == '/')
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
80100d0b:	89 f8                	mov    %edi,%eax
80100d0d:	8b 7f 04             	mov    0x4(%edi),%edi
  curproc->pgdir = pgdir;
  curproc->sz = sz;
80100d10:	89 30                	mov    %esi,(%eax)
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
  curproc->pgdir = pgdir;
80100d12:	89 48 04             	mov    %ecx,0x4(%eax)
  curproc->sz = sz;
  curproc->tf->eip = elf.entry;  // main
80100d15:	89 c1                	mov    %eax,%ecx
80100d17:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d1d:	8b 40 18             	mov    0x18(%eax),%eax
80100d20:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d23:	8b 41 18             	mov    0x18(%ecx),%eax
80100d26:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d29:	89 0c 24             	mov    %ecx,(%esp)
80100d2c:	e8 1f 5c 00 00       	call   80106950 <switchuvm>
  freevm(oldpgdir);
80100d31:	89 3c 24             	mov    %edi,(%esp)
80100d34:	e8 97 5f 00 00       	call   80106cd0 <freevm>
  return 0;
80100d39:	83 c4 10             	add    $0x10,%esp
80100d3c:	31 c0                	xor    %eax,%eax
80100d3e:	e9 19 fd ff ff       	jmp    80100a5c <exec+0x6c>
80100d43:	66 90                	xchg   %ax,%ax
80100d45:	66 90                	xchg   %ax,%ax
80100d47:	66 90                	xchg   %ax,%ax
80100d49:	66 90                	xchg   %ax,%ax
80100d4b:	66 90                	xchg   %ax,%ax
80100d4d:	66 90                	xchg   %ax,%ax
80100d4f:	90                   	nop

80100d50 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d50:	55                   	push   %ebp
80100d51:	89 e5                	mov    %esp,%ebp
80100d53:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100d56:	68 4d 71 10 80       	push   $0x8010714d
80100d5b:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d60:	e8 7b 35 00 00       	call   801042e0 <initlock>
}
80100d65:	83 c4 10             	add    $0x10,%esp
80100d68:	c9                   	leave  
80100d69:	c3                   	ret    
80100d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d70 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d70:	55                   	push   %ebp
80100d71:	89 e5                	mov    %esp,%ebp
80100d73:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d74:	bb f4 ff 10 80       	mov    $0x8010fff4,%ebx
}

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d79:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  acquire(&ftable.lock);
80100d7c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d81:	e8 ba 36 00 00       	call   80104440 <acquire>
80100d86:	83 c4 10             	add    $0x10,%esp
80100d89:	eb 10                	jmp    80100d9b <filealloc+0x2b>
80100d8b:	90                   	nop
80100d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d90:	83 c3 18             	add    $0x18,%ebx
80100d93:	81 fb 54 09 11 80    	cmp    $0x80110954,%ebx
80100d99:	74 25                	je     80100dc0 <filealloc+0x50>
    if(f->ref == 0){
80100d9b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d9e:	85 c0                	test   %eax,%eax
80100da0:	75 ee                	jne    80100d90 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100da2:	83 ec 0c             	sub    $0xc,%esp
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
80100da5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100dac:	68 c0 ff 10 80       	push   $0x8010ffc0
80100db1:	e8 3a 37 00 00       	call   801044f0 <release>
      return f;
80100db6:	89 d8                	mov    %ebx,%eax
80100db8:	83 c4 10             	add    $0x10,%esp
    }
  }
  release(&ftable.lock);
  return 0;
}
80100dbb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dbe:	c9                   	leave  
80100dbf:	c3                   	ret    
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100dc0:	83 ec 0c             	sub    $0xc,%esp
80100dc3:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dc8:	e8 23 37 00 00       	call   801044f0 <release>
  return 0;
80100dcd:	83 c4 10             	add    $0x10,%esp
80100dd0:	31 c0                	xor    %eax,%eax
}
80100dd2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dd5:	c9                   	leave  
80100dd6:	c3                   	ret    
80100dd7:	89 f6                	mov    %esi,%esi
80100dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100de0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100de0:	55                   	push   %ebp
80100de1:	89 e5                	mov    %esp,%ebp
80100de3:	53                   	push   %ebx
80100de4:	83 ec 10             	sub    $0x10,%esp
80100de7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100dea:	68 c0 ff 10 80       	push   $0x8010ffc0
80100def:	e8 4c 36 00 00       	call   80104440 <acquire>
  if(f->ref < 1)
80100df4:	8b 43 04             	mov    0x4(%ebx),%eax
80100df7:	83 c4 10             	add    $0x10,%esp
80100dfa:	85 c0                	test   %eax,%eax
80100dfc:	7e 1a                	jle    80100e18 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100dfe:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100e01:	83 ec 0c             	sub    $0xc,%esp
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
  f->ref++;
80100e04:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100e07:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e0c:	e8 df 36 00 00       	call   801044f0 <release>
  return f;
}
80100e11:	89 d8                	mov    %ebx,%eax
80100e13:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e16:	c9                   	leave  
80100e17:	c3                   	ret    
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
80100e18:	83 ec 0c             	sub    $0xc,%esp
80100e1b:	68 54 71 10 80       	push   $0x80107154
80100e20:	e8 4b f5 ff ff       	call   80100370 <panic>
80100e25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e30 <fileclose>:
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	57                   	push   %edi
80100e34:	56                   	push   %esi
80100e35:	53                   	push   %ebx
80100e36:	83 ec 28             	sub    $0x28,%esp
80100e39:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e3c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e41:	e8 fa 35 00 00       	call   80104440 <acquire>
  if(f->ref < 1)
80100e46:	8b 47 04             	mov    0x4(%edi),%eax
80100e49:	83 c4 10             	add    $0x10,%esp
80100e4c:	85 c0                	test   %eax,%eax
80100e4e:	0f 8e 9b 00 00 00    	jle    80100eef <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100e54:	83 e8 01             	sub    $0x1,%eax
80100e57:	85 c0                	test   %eax,%eax
80100e59:	89 47 04             	mov    %eax,0x4(%edi)
80100e5c:	74 1a                	je     80100e78 <fileclose+0x48>
    release(&ftable.lock);
80100e5e:	c7 45 08 c0 ff 10 80 	movl   $0x8010ffc0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e65:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e68:	5b                   	pop    %ebx
80100e69:	5e                   	pop    %esi
80100e6a:	5f                   	pop    %edi
80100e6b:	5d                   	pop    %ebp

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
80100e6c:	e9 7f 36 00 00       	jmp    801044f0 <release>
80100e71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return;
  }
  ff = *f;
80100e78:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e7c:	8b 1f                	mov    (%edi),%ebx
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e7e:	83 ec 0c             	sub    $0xc,%esp
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e81:	8b 77 0c             	mov    0xc(%edi),%esi
  f->ref = 0;
  f->type = FD_NONE;
80100e84:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e8a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e8d:	8b 47 10             	mov    0x10(%edi),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e90:	68 c0 ff 10 80       	push   $0x8010ffc0
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e95:	89 45 e0             	mov    %eax,-0x20(%ebp)
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e98:	e8 53 36 00 00       	call   801044f0 <release>

  if(ff.type == FD_PIPE)
80100e9d:	83 c4 10             	add    $0x10,%esp
80100ea0:	83 fb 01             	cmp    $0x1,%ebx
80100ea3:	74 13                	je     80100eb8 <fileclose+0x88>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100ea5:	83 fb 02             	cmp    $0x2,%ebx
80100ea8:	74 26                	je     80100ed0 <fileclose+0xa0>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100eaa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ead:	5b                   	pop    %ebx
80100eae:	5e                   	pop    %esi
80100eaf:	5f                   	pop    %edi
80100eb0:	5d                   	pop    %ebp
80100eb1:	c3                   	ret    
80100eb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);

  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
80100eb8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100ebc:	83 ec 08             	sub    $0x8,%esp
80100ebf:	53                   	push   %ebx
80100ec0:	56                   	push   %esi
80100ec1:	e8 2a 24 00 00       	call   801032f0 <pipeclose>
80100ec6:	83 c4 10             	add    $0x10,%esp
80100ec9:	eb df                	jmp    80100eaa <fileclose+0x7a>
80100ecb:	90                   	nop
80100ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  else if(ff.type == FD_INODE){
    begin_op();
80100ed0:	e8 7b 1c 00 00       	call   80102b50 <begin_op>
    iput(ff.ip);
80100ed5:	83 ec 0c             	sub    $0xc,%esp
80100ed8:	ff 75 e0             	pushl  -0x20(%ebp)
80100edb:	e8 c0 08 00 00       	call   801017a0 <iput>
    end_op();
80100ee0:	83 c4 10             	add    $0x10,%esp
  }
}
80100ee3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ee6:	5b                   	pop    %ebx
80100ee7:	5e                   	pop    %esi
80100ee8:	5f                   	pop    %edi
80100ee9:	5d                   	pop    %ebp
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
80100eea:	e9 d1 1c 00 00       	jmp    80102bc0 <end_op>
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
80100eef:	83 ec 0c             	sub    $0xc,%esp
80100ef2:	68 5c 71 10 80       	push   $0x8010715c
80100ef7:	e8 74 f4 ff ff       	call   80100370 <panic>
80100efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f00 <filestat>:
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100f00:	55                   	push   %ebp
80100f01:	89 e5                	mov    %esp,%ebp
80100f03:	53                   	push   %ebx
80100f04:	83 ec 04             	sub    $0x4,%esp
80100f07:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100f0a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f0d:	75 31                	jne    80100f40 <filestat+0x40>
    ilock(f->ip);
80100f0f:	83 ec 0c             	sub    $0xc,%esp
80100f12:	ff 73 10             	pushl  0x10(%ebx)
80100f15:	e8 56 07 00 00       	call   80101670 <ilock>
    stati(f->ip, st);
80100f1a:	58                   	pop    %eax
80100f1b:	5a                   	pop    %edx
80100f1c:	ff 75 0c             	pushl  0xc(%ebp)
80100f1f:	ff 73 10             	pushl  0x10(%ebx)
80100f22:	e8 f9 09 00 00       	call   80101920 <stati>
    iunlock(f->ip);
80100f27:	59                   	pop    %ecx
80100f28:	ff 73 10             	pushl  0x10(%ebx)
80100f2b:	e8 20 08 00 00       	call   80101750 <iunlock>
    return 0;
80100f30:	83 c4 10             	add    $0x10,%esp
80100f33:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f38:	c9                   	leave  
80100f39:	c3                   	ret    
80100f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
  }
  return -1;
80100f40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f48:	c9                   	leave  
80100f49:	c3                   	ret    
80100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f50 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f50:	55                   	push   %ebp
80100f51:	89 e5                	mov    %esp,%ebp
80100f53:	57                   	push   %edi
80100f54:	56                   	push   %esi
80100f55:	53                   	push   %ebx
80100f56:	83 ec 0c             	sub    $0xc,%esp
80100f59:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f5c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f5f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f62:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f66:	74 60                	je     80100fc8 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100f68:	8b 03                	mov    (%ebx),%eax
80100f6a:	83 f8 01             	cmp    $0x1,%eax
80100f6d:	74 41                	je     80100fb0 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f6f:	83 f8 02             	cmp    $0x2,%eax
80100f72:	75 5b                	jne    80100fcf <fileread+0x7f>
    ilock(f->ip);
80100f74:	83 ec 0c             	sub    $0xc,%esp
80100f77:	ff 73 10             	pushl  0x10(%ebx)
80100f7a:	e8 f1 06 00 00       	call   80101670 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f7f:	57                   	push   %edi
80100f80:	ff 73 14             	pushl  0x14(%ebx)
80100f83:	56                   	push   %esi
80100f84:	ff 73 10             	pushl  0x10(%ebx)
80100f87:	e8 c4 09 00 00       	call   80101950 <readi>
80100f8c:	83 c4 20             	add    $0x20,%esp
80100f8f:	85 c0                	test   %eax,%eax
80100f91:	89 c6                	mov    %eax,%esi
80100f93:	7e 03                	jle    80100f98 <fileread+0x48>
      f->off += r;
80100f95:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100f98:	83 ec 0c             	sub    $0xc,%esp
80100f9b:	ff 73 10             	pushl  0x10(%ebx)
80100f9e:	e8 ad 07 00 00       	call   80101750 <iunlock>
    return r;
80100fa3:	83 c4 10             	add    $0x10,%esp
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
    ilock(f->ip);
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100fa6:	89 f0                	mov    %esi,%eax
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100fa8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fab:	5b                   	pop    %ebx
80100fac:	5e                   	pop    %esi
80100fad:	5f                   	pop    %edi
80100fae:	5d                   	pop    %ebp
80100faf:	c3                   	ret    
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fb0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fb3:	89 45 08             	mov    %eax,0x8(%ebp)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100fb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb9:	5b                   	pop    %ebx
80100fba:	5e                   	pop    %esi
80100fbb:	5f                   	pop    %edi
80100fbc:	5d                   	pop    %ebp
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fbd:	e9 ce 24 00 00       	jmp    80103490 <piperead>
80100fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fileread(struct file *f, char *addr, int n)
{
  int r;

  if(f->readable == 0)
    return -1;
80100fc8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fcd:	eb d9                	jmp    80100fa8 <fileread+0x58>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
80100fcf:	83 ec 0c             	sub    $0xc,%esp
80100fd2:	68 66 71 10 80       	push   $0x80107166
80100fd7:	e8 94 f3 ff ff       	call   80100370 <panic>
80100fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fe0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fe0:	55                   	push   %ebp
80100fe1:	89 e5                	mov    %esp,%ebp
80100fe3:	57                   	push   %edi
80100fe4:	56                   	push   %esi
80100fe5:	53                   	push   %ebx
80100fe6:	83 ec 1c             	sub    $0x1c,%esp
80100fe9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fec:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
80100fef:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100ff3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100ff6:	8b 45 10             	mov    0x10(%ebp),%eax
80100ff9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int r;

  if(f->writable == 0)
80100ffc:	0f 84 aa 00 00 00    	je     801010ac <filewrite+0xcc>
    return -1;
  if(f->type == FD_PIPE)
80101002:	8b 06                	mov    (%esi),%eax
80101004:	83 f8 01             	cmp    $0x1,%eax
80101007:	0f 84 c2 00 00 00    	je     801010cf <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
8010100d:	83 f8 02             	cmp    $0x2,%eax
80101010:	0f 85 d8 00 00 00    	jne    801010ee <filewrite+0x10e>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101016:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101019:	31 ff                	xor    %edi,%edi
8010101b:	85 c0                	test   %eax,%eax
8010101d:	7f 34                	jg     80101053 <filewrite+0x73>
8010101f:	e9 9c 00 00 00       	jmp    801010c0 <filewrite+0xe0>
80101024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101028:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
8010102b:	83 ec 0c             	sub    $0xc,%esp
8010102e:	ff 76 10             	pushl  0x10(%esi)
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101031:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101034:	e8 17 07 00 00       	call   80101750 <iunlock>
      end_op();
80101039:	e8 82 1b 00 00       	call   80102bc0 <end_op>
8010103e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101041:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
80101044:	39 d8                	cmp    %ebx,%eax
80101046:	0f 85 95 00 00 00    	jne    801010e1 <filewrite+0x101>
        panic("short filewrite");
      i += r;
8010104c:	01 c7                	add    %eax,%edi
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
8010104e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101051:	7e 6d                	jle    801010c0 <filewrite+0xe0>
      int n1 = n - i;
80101053:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101056:	b8 00 06 00 00       	mov    $0x600,%eax
8010105b:	29 fb                	sub    %edi,%ebx
8010105d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101063:	0f 4f d8             	cmovg  %eax,%ebx
      if(n1 > max)
        n1 = max;

      begin_op();
80101066:	e8 e5 1a 00 00       	call   80102b50 <begin_op>
      ilock(f->ip);
8010106b:	83 ec 0c             	sub    $0xc,%esp
8010106e:	ff 76 10             	pushl  0x10(%esi)
80101071:	e8 fa 05 00 00       	call   80101670 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101076:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101079:	53                   	push   %ebx
8010107a:	ff 76 14             	pushl  0x14(%esi)
8010107d:	01 f8                	add    %edi,%eax
8010107f:	50                   	push   %eax
80101080:	ff 76 10             	pushl  0x10(%esi)
80101083:	e8 c8 09 00 00       	call   80101a50 <writei>
80101088:	83 c4 20             	add    $0x20,%esp
8010108b:	85 c0                	test   %eax,%eax
8010108d:	7f 99                	jg     80101028 <filewrite+0x48>
        f->off += r;
      iunlock(f->ip);
8010108f:	83 ec 0c             	sub    $0xc,%esp
80101092:	ff 76 10             	pushl  0x10(%esi)
80101095:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101098:	e8 b3 06 00 00       	call   80101750 <iunlock>
      end_op();
8010109d:	e8 1e 1b 00 00       	call   80102bc0 <end_op>

      if(r < 0)
801010a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010a5:	83 c4 10             	add    $0x10,%esp
801010a8:	85 c0                	test   %eax,%eax
801010aa:	74 98                	je     80101044 <filewrite+0x64>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  panic("filewrite");
}
801010b4:	5b                   	pop    %ebx
801010b5:	5e                   	pop    %esi
801010b6:	5f                   	pop    %edi
801010b7:	5d                   	pop    %ebp
801010b8:	c3                   	ret    
801010b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010c0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010c3:	75 e7                	jne    801010ac <filewrite+0xcc>
  }
  panic("filewrite");
}
801010c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010c8:	89 f8                	mov    %edi,%eax
801010ca:	5b                   	pop    %ebx
801010cb:	5e                   	pop    %esi
801010cc:	5f                   	pop    %edi
801010cd:	5d                   	pop    %ebp
801010ce:	c3                   	ret    
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010cf:	8b 46 0c             	mov    0xc(%esi),%eax
801010d2:	89 45 08             	mov    %eax,0x8(%ebp)
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010d8:	5b                   	pop    %ebx
801010d9:	5e                   	pop    %esi
801010da:	5f                   	pop    %edi
801010db:	5d                   	pop    %ebp
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010dc:	e9 af 22 00 00       	jmp    80103390 <pipewrite>
      end_op();

      if(r < 0)
        break;
      if(r != n1)
        panic("short filewrite");
801010e1:	83 ec 0c             	sub    $0xc,%esp
801010e4:	68 6f 71 10 80       	push   $0x8010716f
801010e9:	e8 82 f2 ff ff       	call   80100370 <panic>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
801010ee:	83 ec 0c             	sub    $0xc,%esp
801010f1:	68 75 71 10 80       	push   $0x80107175
801010f6:	e8 75 f2 ff ff       	call   80100370 <panic>
801010fb:	66 90                	xchg   %ax,%ax
801010fd:	66 90                	xchg   %ax,%ax
801010ff:	90                   	nop

80101100 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
80101100:	55                   	push   %ebp
80101101:	89 e5                	mov    %esp,%ebp
80101103:	57                   	push   %edi
80101104:	56                   	push   %esi
80101105:	53                   	push   %ebx
80101106:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101109:	8b 0d c0 09 11 80    	mov    0x801109c0,%ecx
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
8010110f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101112:	85 c9                	test   %ecx,%ecx
80101114:	0f 84 85 00 00 00    	je     8010119f <balloc+0x9f>
8010111a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101121:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101124:	83 ec 08             	sub    $0x8,%esp
80101127:	89 f0                	mov    %esi,%eax
80101129:	c1 f8 0c             	sar    $0xc,%eax
8010112c:	03 05 d8 09 11 80    	add    0x801109d8,%eax
80101132:	50                   	push   %eax
80101133:	ff 75 d8             	pushl  -0x28(%ebp)
80101136:	e8 95 ef ff ff       	call   801000d0 <bread>
8010113b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010113e:	a1 c0 09 11 80       	mov    0x801109c0,%eax
80101143:	83 c4 10             	add    $0x10,%esp
80101146:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101149:	31 c0                	xor    %eax,%eax
8010114b:	eb 2d                	jmp    8010117a <balloc+0x7a>
8010114d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101150:	89 c1                	mov    %eax,%ecx
80101152:	ba 01 00 00 00       	mov    $0x1,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101157:	8b 5d e4             	mov    -0x1c(%ebp),%ebx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
8010115a:	83 e1 07             	and    $0x7,%ecx
8010115d:	d3 e2                	shl    %cl,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010115f:	89 c1                	mov    %eax,%ecx
80101161:	c1 f9 03             	sar    $0x3,%ecx
80101164:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101169:	85 d7                	test   %edx,%edi
8010116b:	74 43                	je     801011b0 <balloc+0xb0>
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010116d:	83 c0 01             	add    $0x1,%eax
80101170:	83 c6 01             	add    $0x1,%esi
80101173:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101178:	74 05                	je     8010117f <balloc+0x7f>
8010117a:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010117d:	72 d1                	jb     80101150 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
8010117f:	83 ec 0c             	sub    $0xc,%esp
80101182:	ff 75 e4             	pushl  -0x1c(%ebp)
80101185:	e8 56 f0 ff ff       	call   801001e0 <brelse>
{
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
8010118a:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101191:	83 c4 10             	add    $0x10,%esp
80101194:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101197:	39 05 c0 09 11 80    	cmp    %eax,0x801109c0
8010119d:	77 82                	ja     80101121 <balloc+0x21>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
8010119f:	83 ec 0c             	sub    $0xc,%esp
801011a2:	68 7f 71 10 80       	push   $0x8010717f
801011a7:	e8 c4 f1 ff ff       	call   80100370 <panic>
801011ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011b0:	09 fa                	or     %edi,%edx
801011b2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
801011b5:	83 ec 0c             	sub    $0xc,%esp
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011b8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
801011bc:	57                   	push   %edi
801011bd:	e8 6e 1b 00 00       	call   80102d30 <log_write>
        brelse(bp);
801011c2:	89 3c 24             	mov    %edi,(%esp)
801011c5:	e8 16 f0 ff ff       	call   801001e0 <brelse>
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
801011ca:	58                   	pop    %eax
801011cb:	5a                   	pop    %edx
801011cc:	56                   	push   %esi
801011cd:	ff 75 d8             	pushl  -0x28(%ebp)
801011d0:	e8 fb ee ff ff       	call   801000d0 <bread>
801011d5:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011d7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011da:	83 c4 0c             	add    $0xc,%esp
801011dd:	68 00 02 00 00       	push   $0x200
801011e2:	6a 00                	push   $0x0
801011e4:	50                   	push   %eax
801011e5:	e8 56 33 00 00       	call   80104540 <memset>
  log_write(bp);
801011ea:	89 1c 24             	mov    %ebx,(%esp)
801011ed:	e8 3e 1b 00 00       	call   80102d30 <log_write>
  brelse(bp);
801011f2:	89 1c 24             	mov    %ebx,(%esp)
801011f5:	e8 e6 ef ff ff       	call   801001e0 <brelse>
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
801011fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011fd:	89 f0                	mov    %esi,%eax
801011ff:	5b                   	pop    %ebx
80101200:	5e                   	pop    %esi
80101201:	5f                   	pop    %edi
80101202:	5d                   	pop    %ebp
80101203:	c3                   	ret    
80101204:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010120a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101210 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101210:	55                   	push   %ebp
80101211:	89 e5                	mov    %esp,%ebp
80101213:	57                   	push   %edi
80101214:	56                   	push   %esi
80101215:	53                   	push   %ebx
80101216:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101218:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010121a:	bb 14 0a 11 80       	mov    $0x80110a14,%ebx
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
8010121f:	83 ec 28             	sub    $0x28,%esp
80101222:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  struct inode *ip, *empty;

  acquire(&icache.lock);
80101225:	68 e0 09 11 80       	push   $0x801109e0
8010122a:	e8 11 32 00 00       	call   80104440 <acquire>
8010122f:	83 c4 10             	add    $0x10,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101232:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101235:	eb 1b                	jmp    80101252 <iget+0x42>
80101237:	89 f6                	mov    %esi,%esi
80101239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101240:	85 f6                	test   %esi,%esi
80101242:	74 44                	je     80101288 <iget+0x78>

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101244:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010124a:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
80101250:	74 4e                	je     801012a0 <iget+0x90>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101252:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101255:	85 c9                	test   %ecx,%ecx
80101257:	7e e7                	jle    80101240 <iget+0x30>
80101259:	39 3b                	cmp    %edi,(%ebx)
8010125b:	75 e3                	jne    80101240 <iget+0x30>
8010125d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101260:	75 de                	jne    80101240 <iget+0x30>
      ip->ref++;
      release(&icache.lock);
80101262:	83 ec 0c             	sub    $0xc,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
80101265:	83 c1 01             	add    $0x1,%ecx
      release(&icache.lock);
      return ip;
80101268:	89 de                	mov    %ebx,%esi
  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
8010126a:	68 e0 09 11 80       	push   $0x801109e0

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
8010126f:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
80101272:	e8 79 32 00 00       	call   801044f0 <release>
      return ip;
80101277:	83 c4 10             	add    $0x10,%esp
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);

  return ip;
}
8010127a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010127d:	89 f0                	mov    %esi,%eax
8010127f:	5b                   	pop    %ebx
80101280:	5e                   	pop    %esi
80101281:	5f                   	pop    %edi
80101282:	5d                   	pop    %ebp
80101283:	c3                   	ret    
80101284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101288:	85 c9                	test   %ecx,%ecx
8010128a:	0f 44 f3             	cmove  %ebx,%esi

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010128d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101293:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
80101299:	75 b7                	jne    80101252 <iget+0x42>
8010129b:	90                   	nop
8010129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
801012a0:	85 f6                	test   %esi,%esi
801012a2:	74 2d                	je     801012d1 <iget+0xc1>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);
801012a4:	83 ec 0c             	sub    $0xc,%esp
  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
801012a7:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
801012a9:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
801012ac:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
801012b3:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801012ba:	68 e0 09 11 80       	push   $0x801109e0
801012bf:	e8 2c 32 00 00       	call   801044f0 <release>

  return ip;
801012c4:	83 c4 10             	add    $0x10,%esp
}
801012c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ca:	89 f0                	mov    %esi,%eax
801012cc:	5b                   	pop    %ebx
801012cd:	5e                   	pop    %esi
801012ce:	5f                   	pop    %edi
801012cf:	5d                   	pop    %ebp
801012d0:	c3                   	ret    
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");
801012d1:	83 ec 0c             	sub    $0xc,%esp
801012d4:	68 95 71 10 80       	push   $0x80107195
801012d9:	e8 92 f0 ff ff       	call   80100370 <panic>
801012de:	66 90                	xchg   %ax,%ax

801012e0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801012e0:	55                   	push   %ebp
801012e1:	89 e5                	mov    %esp,%ebp
801012e3:	57                   	push   %edi
801012e4:	56                   	push   %esi
801012e5:	53                   	push   %ebx
801012e6:	89 c6                	mov    %eax,%esi
801012e8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801012eb:	83 fa 0b             	cmp    $0xb,%edx
801012ee:	77 18                	ja     80101308 <bmap+0x28>
801012f0:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
    if((addr = ip->addrs[bn]) == 0)
801012f3:	8b 43 5c             	mov    0x5c(%ebx),%eax
801012f6:	85 c0                	test   %eax,%eax
801012f8:	74 76                	je     80101370 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801012fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012fd:	5b                   	pop    %ebx
801012fe:	5e                   	pop    %esi
801012ff:	5f                   	pop    %edi
80101300:	5d                   	pop    %ebp
80101301:	c3                   	ret    
80101302:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
80101308:	8d 5a f4             	lea    -0xc(%edx),%ebx

  if(bn < NINDIRECT){
8010130b:	83 fb 7f             	cmp    $0x7f,%ebx
8010130e:	0f 87 83 00 00 00    	ja     80101397 <bmap+0xb7>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101314:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010131a:	85 c0                	test   %eax,%eax
8010131c:	74 6a                	je     80101388 <bmap+0xa8>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010131e:	83 ec 08             	sub    $0x8,%esp
80101321:	50                   	push   %eax
80101322:	ff 36                	pushl  (%esi)
80101324:	e8 a7 ed ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101329:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010132d:	83 c4 10             	add    $0x10,%esp

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
80101330:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101332:	8b 1a                	mov    (%edx),%ebx
80101334:	85 db                	test   %ebx,%ebx
80101336:	75 1d                	jne    80101355 <bmap+0x75>
      a[bn] = addr = balloc(ip->dev);
80101338:	8b 06                	mov    (%esi),%eax
8010133a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010133d:	e8 be fd ff ff       	call   80101100 <balloc>
80101342:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
80101345:	83 ec 0c             	sub    $0xc,%esp
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
80101348:	89 c3                	mov    %eax,%ebx
8010134a:	89 02                	mov    %eax,(%edx)
      log_write(bp);
8010134c:	57                   	push   %edi
8010134d:	e8 de 19 00 00       	call   80102d30 <log_write>
80101352:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
80101355:	83 ec 0c             	sub    $0xc,%esp
80101358:	57                   	push   %edi
80101359:	e8 82 ee ff ff       	call   801001e0 <brelse>
8010135e:	83 c4 10             	add    $0x10,%esp
    return addr;
  }

  panic("bmap: out of range");
}
80101361:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
80101364:	89 d8                	mov    %ebx,%eax
    return addr;
  }

  panic("bmap: out of range");
}
80101366:	5b                   	pop    %ebx
80101367:	5e                   	pop    %esi
80101368:	5f                   	pop    %edi
80101369:	5d                   	pop    %ebp
8010136a:	c3                   	ret    
8010136b:	90                   	nop
8010136c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
80101370:	8b 06                	mov    (%esi),%eax
80101372:	e8 89 fd ff ff       	call   80101100 <balloc>
80101377:	89 43 5c             	mov    %eax,0x5c(%ebx)
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010137a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010137d:	5b                   	pop    %ebx
8010137e:	5e                   	pop    %esi
8010137f:	5f                   	pop    %edi
80101380:	5d                   	pop    %ebp
80101381:	c3                   	ret    
80101382:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101388:	8b 06                	mov    (%esi),%eax
8010138a:	e8 71 fd ff ff       	call   80101100 <balloc>
8010138f:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
80101395:	eb 87                	jmp    8010131e <bmap+0x3e>
    }
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
80101397:	83 ec 0c             	sub    $0xc,%esp
8010139a:	68 a5 71 10 80       	push   $0x801071a5
8010139f:	e8 cc ef ff ff       	call   80100370 <panic>
801013a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801013aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801013b0 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
801013b0:	55                   	push   %ebp
801013b1:	89 e5                	mov    %esp,%ebp
801013b3:	56                   	push   %esi
801013b4:	53                   	push   %ebx
801013b5:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
801013b8:	83 ec 08             	sub    $0x8,%esp
801013bb:	6a 01                	push   $0x1
801013bd:	ff 75 08             	pushl  0x8(%ebp)
801013c0:	e8 0b ed ff ff       	call   801000d0 <bread>
801013c5:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013c7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ca:	83 c4 0c             	add    $0xc,%esp
801013cd:	6a 1c                	push   $0x1c
801013cf:	50                   	push   %eax
801013d0:	56                   	push   %esi
801013d1:	e8 1a 32 00 00       	call   801045f0 <memmove>
  brelse(bp);
801013d6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013d9:	83 c4 10             	add    $0x10,%esp
}
801013dc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013df:	5b                   	pop    %ebx
801013e0:	5e                   	pop    %esi
801013e1:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
801013e2:	e9 f9 ed ff ff       	jmp    801001e0 <brelse>
801013e7:	89 f6                	mov    %esi,%esi
801013e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013f0 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801013f0:	55                   	push   %ebp
801013f1:	89 e5                	mov    %esp,%ebp
801013f3:	56                   	push   %esi
801013f4:	53                   	push   %ebx
801013f5:	89 d3                	mov    %edx,%ebx
801013f7:	89 c6                	mov    %eax,%esi
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
801013f9:	83 ec 08             	sub    $0x8,%esp
801013fc:	68 c0 09 11 80       	push   $0x801109c0
80101401:	50                   	push   %eax
80101402:	e8 a9 ff ff ff       	call   801013b0 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
80101407:	58                   	pop    %eax
80101408:	5a                   	pop    %edx
80101409:	89 da                	mov    %ebx,%edx
8010140b:	c1 ea 0c             	shr    $0xc,%edx
8010140e:	03 15 d8 09 11 80    	add    0x801109d8,%edx
80101414:	52                   	push   %edx
80101415:	56                   	push   %esi
80101416:	e8 b5 ec ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
8010141b:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
8010141d:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101423:	ba 01 00 00 00       	mov    $0x1,%edx
80101428:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
8010142b:	c1 fb 03             	sar    $0x3,%ebx
8010142e:	83 c4 10             	add    $0x10,%esp
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101431:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101433:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101438:	85 d1                	test   %edx,%ecx
8010143a:	74 27                	je     80101463 <bfree+0x73>
8010143c:	89 c6                	mov    %eax,%esi
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
8010143e:	f7 d2                	not    %edx
80101440:	89 c8                	mov    %ecx,%eax
  log_write(bp);
80101442:	83 ec 0c             	sub    $0xc,%esp
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101445:	21 d0                	and    %edx,%eax
80101447:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
  log_write(bp);
8010144b:	56                   	push   %esi
8010144c:	e8 df 18 00 00       	call   80102d30 <log_write>
  brelse(bp);
80101451:	89 34 24             	mov    %esi,(%esp)
80101454:	e8 87 ed ff ff       	call   801001e0 <brelse>
}
80101459:	83 c4 10             	add    $0x10,%esp
8010145c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010145f:	5b                   	pop    %ebx
80101460:	5e                   	pop    %esi
80101461:	5d                   	pop    %ebp
80101462:	c3                   	ret    
  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
80101463:	83 ec 0c             	sub    $0xc,%esp
80101466:	68 b8 71 10 80       	push   $0x801071b8
8010146b:	e8 00 ef ff ff       	call   80100370 <panic>

80101470 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
80101470:	55                   	push   %ebp
80101471:	89 e5                	mov    %esp,%ebp
80101473:	53                   	push   %ebx
80101474:	bb 20 0a 11 80       	mov    $0x80110a20,%ebx
80101479:	83 ec 0c             	sub    $0xc,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
8010147c:	68 cb 71 10 80       	push   $0x801071cb
80101481:	68 e0 09 11 80       	push   $0x801109e0
80101486:	e8 55 2e 00 00       	call   801042e0 <initlock>
8010148b:	83 c4 10             	add    $0x10,%esp
8010148e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
80101490:	83 ec 08             	sub    $0x8,%esp
80101493:	68 d2 71 10 80       	push   $0x801071d2
80101498:	53                   	push   %ebx
80101499:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010149f:	e8 0c 2d 00 00       	call   801041b0 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
801014a4:	83 c4 10             	add    $0x10,%esp
801014a7:	81 fb 40 26 11 80    	cmp    $0x80112640,%ebx
801014ad:	75 e1                	jne    80101490 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }

  readsb(dev, &sb);
801014af:	83 ec 08             	sub    $0x8,%esp
801014b2:	68 c0 09 11 80       	push   $0x801109c0
801014b7:	ff 75 08             	pushl  0x8(%ebp)
801014ba:	e8 f1 fe ff ff       	call   801013b0 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014bf:	ff 35 d8 09 11 80    	pushl  0x801109d8
801014c5:	ff 35 d4 09 11 80    	pushl  0x801109d4
801014cb:	ff 35 d0 09 11 80    	pushl  0x801109d0
801014d1:	ff 35 cc 09 11 80    	pushl  0x801109cc
801014d7:	ff 35 c8 09 11 80    	pushl  0x801109c8
801014dd:	ff 35 c4 09 11 80    	pushl  0x801109c4
801014e3:	ff 35 c0 09 11 80    	pushl  0x801109c0
801014e9:	68 38 72 10 80       	push   $0x80107238
801014ee:	e8 6d f1 ff ff       	call   80100660 <cprintf>
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
801014f3:	83 c4 30             	add    $0x30,%esp
801014f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014f9:	c9                   	leave  
801014fa:	c3                   	ret    
801014fb:	90                   	nop
801014fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101500 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
80101500:	55                   	push   %ebp
80101501:	89 e5                	mov    %esp,%ebp
80101503:	57                   	push   %edi
80101504:	56                   	push   %esi
80101505:	53                   	push   %ebx
80101506:	83 ec 1c             	sub    $0x1c,%esp
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101509:	83 3d c8 09 11 80 01 	cmpl   $0x1,0x801109c8
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
80101510:	8b 45 0c             	mov    0xc(%ebp),%eax
80101513:	8b 75 08             	mov    0x8(%ebp),%esi
80101516:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101519:	0f 86 91 00 00 00    	jbe    801015b0 <ialloc+0xb0>
8010151f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101524:	eb 21                	jmp    80101547 <ialloc+0x47>
80101526:	8d 76 00             	lea    0x0(%esi),%esi
80101529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101530:	83 ec 0c             	sub    $0xc,%esp
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101533:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101536:	57                   	push   %edi
80101537:	e8 a4 ec ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010153c:	83 c4 10             	add    $0x10,%esp
8010153f:	39 1d c8 09 11 80    	cmp    %ebx,0x801109c8
80101545:	76 69                	jbe    801015b0 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101547:	89 d8                	mov    %ebx,%eax
80101549:	83 ec 08             	sub    $0x8,%esp
8010154c:	c1 e8 03             	shr    $0x3,%eax
8010154f:	03 05 d4 09 11 80    	add    0x801109d4,%eax
80101555:	50                   	push   %eax
80101556:	56                   	push   %esi
80101557:	e8 74 eb ff ff       	call   801000d0 <bread>
8010155c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010155e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
80101560:	83 c4 10             	add    $0x10,%esp
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
80101563:	83 e0 07             	and    $0x7,%eax
80101566:	c1 e0 06             	shl    $0x6,%eax
80101569:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010156d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101571:	75 bd                	jne    80101530 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101573:	83 ec 04             	sub    $0x4,%esp
80101576:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101579:	6a 40                	push   $0x40
8010157b:	6a 00                	push   $0x0
8010157d:	51                   	push   %ecx
8010157e:	e8 bd 2f 00 00       	call   80104540 <memset>
      dip->type = type;
80101583:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101587:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010158a:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
8010158d:	89 3c 24             	mov    %edi,(%esp)
80101590:	e8 9b 17 00 00       	call   80102d30 <log_write>
      brelse(bp);
80101595:	89 3c 24             	mov    %edi,(%esp)
80101598:	e8 43 ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
8010159d:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015a3:	89 da                	mov    %ebx,%edx
801015a5:	89 f0                	mov    %esi,%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015a7:	5b                   	pop    %ebx
801015a8:	5e                   	pop    %esi
801015a9:	5f                   	pop    %edi
801015aa:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015ab:	e9 60 fc ff ff       	jmp    80101210 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
801015b0:	83 ec 0c             	sub    $0xc,%esp
801015b3:	68 d8 71 10 80       	push   $0x801071d8
801015b8:	e8 b3 ed ff ff       	call   80100370 <panic>
801015bd:	8d 76 00             	lea    0x0(%esi),%esi

801015c0 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk, since i-node cache is write-through.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
801015c0:	55                   	push   %ebp
801015c1:	89 e5                	mov    %esp,%ebp
801015c3:	56                   	push   %esi
801015c4:	53                   	push   %ebx
801015c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015c8:	83 ec 08             	sub    $0x8,%esp
801015cb:	8b 43 04             	mov    0x4(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015ce:	83 c3 5c             	add    $0x5c,%ebx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015d1:	c1 e8 03             	shr    $0x3,%eax
801015d4:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801015da:	50                   	push   %eax
801015db:	ff 73 a4             	pushl  -0x5c(%ebx)
801015de:	e8 ed ea ff ff       	call   801000d0 <bread>
801015e3:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015e5:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
801015e8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015ec:	83 c4 0c             	add    $0xc,%esp
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015ef:	83 e0 07             	and    $0x7,%eax
801015f2:	c1 e0 06             	shl    $0x6,%eax
801015f5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
801015f9:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
801015fc:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101600:	83 c0 0c             	add    $0xc,%eax
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
  dip->major = ip->major;
80101603:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
80101607:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010160b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
8010160f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101613:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101617:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010161a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010161d:	6a 34                	push   $0x34
8010161f:	53                   	push   %ebx
80101620:	50                   	push   %eax
80101621:	e8 ca 2f 00 00       	call   801045f0 <memmove>
  log_write(bp);
80101626:	89 34 24             	mov    %esi,(%esp)
80101629:	e8 02 17 00 00       	call   80102d30 <log_write>
  brelse(bp);
8010162e:	89 75 08             	mov    %esi,0x8(%ebp)
80101631:	83 c4 10             	add    $0x10,%esp
}
80101634:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101637:	5b                   	pop    %ebx
80101638:	5e                   	pop    %esi
80101639:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
8010163a:	e9 a1 eb ff ff       	jmp    801001e0 <brelse>
8010163f:	90                   	nop

80101640 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101640:	55                   	push   %ebp
80101641:	89 e5                	mov    %esp,%ebp
80101643:	53                   	push   %ebx
80101644:	83 ec 10             	sub    $0x10,%esp
80101647:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010164a:	68 e0 09 11 80       	push   $0x801109e0
8010164f:	e8 ec 2d 00 00       	call   80104440 <acquire>
  ip->ref++;
80101654:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101658:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010165f:	e8 8c 2e 00 00       	call   801044f0 <release>
  return ip;
}
80101664:	89 d8                	mov    %ebx,%eax
80101666:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101669:	c9                   	leave  
8010166a:	c3                   	ret    
8010166b:	90                   	nop
8010166c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101670 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
80101670:	55                   	push   %ebp
80101671:	89 e5                	mov    %esp,%ebp
80101673:	56                   	push   %esi
80101674:	53                   	push   %ebx
80101675:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
80101678:	85 db                	test   %ebx,%ebx
8010167a:	0f 84 b7 00 00 00    	je     80101737 <ilock+0xc7>
80101680:	8b 53 08             	mov    0x8(%ebx),%edx
80101683:	85 d2                	test   %edx,%edx
80101685:	0f 8e ac 00 00 00    	jle    80101737 <ilock+0xc7>
    panic("ilock");

  acquiresleep(&ip->lock);
8010168b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010168e:	83 ec 0c             	sub    $0xc,%esp
80101691:	50                   	push   %eax
80101692:	e8 59 2b 00 00       	call   801041f0 <acquiresleep>

  if(ip->valid == 0){
80101697:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010169a:	83 c4 10             	add    $0x10,%esp
8010169d:	85 c0                	test   %eax,%eax
8010169f:	74 0f                	je     801016b0 <ilock+0x40>
    brelse(bp);
    ip->valid = 1;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
801016a1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016a4:	5b                   	pop    %ebx
801016a5:	5e                   	pop    %esi
801016a6:	5d                   	pop    %ebp
801016a7:	c3                   	ret    
801016a8:	90                   	nop
801016a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    panic("ilock");

  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016b0:	8b 43 04             	mov    0x4(%ebx),%eax
801016b3:	83 ec 08             	sub    $0x8,%esp
801016b6:	c1 e8 03             	shr    $0x3,%eax
801016b9:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801016bf:	50                   	push   %eax
801016c0:	ff 33                	pushl  (%ebx)
801016c2:	e8 09 ea ff ff       	call   801000d0 <bread>
801016c7:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016c9:	8b 43 04             	mov    0x4(%ebx),%eax
    ip->type = dip->type;
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016cc:	83 c4 0c             	add    $0xc,%esp

  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016cf:	83 e0 07             	and    $0x7,%eax
801016d2:	c1 e0 06             	shl    $0x6,%eax
801016d5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801016d9:	0f b7 10             	movzwl (%eax),%edx
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016dc:	83 c0 0c             	add    $0xc,%eax
  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
801016df:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801016e3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016e7:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
801016eb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016ef:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
801016f3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801016f7:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
801016fb:	8b 50 fc             	mov    -0x4(%eax),%edx
801016fe:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101701:	6a 34                	push   $0x34
80101703:	50                   	push   %eax
80101704:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101707:	50                   	push   %eax
80101708:	e8 e3 2e 00 00       	call   801045f0 <memmove>
    brelse(bp);
8010170d:	89 34 24             	mov    %esi,(%esp)
80101710:	e8 cb ea ff ff       	call   801001e0 <brelse>
    ip->valid = 1;
    if(ip->type == 0)
80101715:	83 c4 10             	add    $0x10,%esp
80101718:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    brelse(bp);
    ip->valid = 1;
8010171d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101724:	0f 85 77 ff ff ff    	jne    801016a1 <ilock+0x31>
      panic("ilock: no type");
8010172a:	83 ec 0c             	sub    $0xc,%esp
8010172d:	68 f0 71 10 80       	push   $0x801071f0
80101732:	e8 39 ec ff ff       	call   80100370 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
80101737:	83 ec 0c             	sub    $0xc,%esp
8010173a:	68 ea 71 10 80       	push   $0x801071ea
8010173f:	e8 2c ec ff ff       	call   80100370 <panic>
80101744:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010174a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101750 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101750:	55                   	push   %ebp
80101751:	89 e5                	mov    %esp,%ebp
80101753:	56                   	push   %esi
80101754:	53                   	push   %ebx
80101755:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101758:	85 db                	test   %ebx,%ebx
8010175a:	74 28                	je     80101784 <iunlock+0x34>
8010175c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010175f:	83 ec 0c             	sub    $0xc,%esp
80101762:	56                   	push   %esi
80101763:	e8 28 2b 00 00       	call   80104290 <holdingsleep>
80101768:	83 c4 10             	add    $0x10,%esp
8010176b:	85 c0                	test   %eax,%eax
8010176d:	74 15                	je     80101784 <iunlock+0x34>
8010176f:	8b 43 08             	mov    0x8(%ebx),%eax
80101772:	85 c0                	test   %eax,%eax
80101774:	7e 0e                	jle    80101784 <iunlock+0x34>
    panic("iunlock");

  releasesleep(&ip->lock);
80101776:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101779:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010177c:	5b                   	pop    %ebx
8010177d:	5e                   	pop    %esi
8010177e:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
8010177f:	e9 cc 2a 00 00       	jmp    80104250 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
80101784:	83 ec 0c             	sub    $0xc,%esp
80101787:	68 ff 71 10 80       	push   $0x801071ff
8010178c:	e8 df eb ff ff       	call   80100370 <panic>
80101791:	eb 0d                	jmp    801017a0 <iput>
80101793:	90                   	nop
80101794:	90                   	nop
80101795:	90                   	nop
80101796:	90                   	nop
80101797:	90                   	nop
80101798:	90                   	nop
80101799:	90                   	nop
8010179a:	90                   	nop
8010179b:	90                   	nop
8010179c:	90                   	nop
8010179d:	90                   	nop
8010179e:	90                   	nop
8010179f:	90                   	nop

801017a0 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
801017a0:	55                   	push   %ebp
801017a1:	89 e5                	mov    %esp,%ebp
801017a3:	57                   	push   %edi
801017a4:	56                   	push   %esi
801017a5:	53                   	push   %ebx
801017a6:	83 ec 28             	sub    $0x28,%esp
801017a9:	8b 75 08             	mov    0x8(%ebp),%esi
  acquiresleep(&ip->lock);
801017ac:	8d 7e 0c             	lea    0xc(%esi),%edi
801017af:	57                   	push   %edi
801017b0:	e8 3b 2a 00 00       	call   801041f0 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
801017b5:	8b 56 4c             	mov    0x4c(%esi),%edx
801017b8:	83 c4 10             	add    $0x10,%esp
801017bb:	85 d2                	test   %edx,%edx
801017bd:	74 07                	je     801017c6 <iput+0x26>
801017bf:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017c4:	74 32                	je     801017f8 <iput+0x58>
      ip->type = 0;
      iupdate(ip);
      ip->valid = 0;
    }
  }
  releasesleep(&ip->lock);
801017c6:	83 ec 0c             	sub    $0xc,%esp
801017c9:	57                   	push   %edi
801017ca:	e8 81 2a 00 00       	call   80104250 <releasesleep>

  acquire(&icache.lock);
801017cf:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801017d6:	e8 65 2c 00 00       	call   80104440 <acquire>
  ip->ref--;
801017db:	83 6e 08 01          	subl   $0x1,0x8(%esi)
  release(&icache.lock);
801017df:	83 c4 10             	add    $0x10,%esp
801017e2:	c7 45 08 e0 09 11 80 	movl   $0x801109e0,0x8(%ebp)
}
801017e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017ec:	5b                   	pop    %ebx
801017ed:	5e                   	pop    %esi
801017ee:	5f                   	pop    %edi
801017ef:	5d                   	pop    %ebp
  }
  releasesleep(&ip->lock);

  acquire(&icache.lock);
  ip->ref--;
  release(&icache.lock);
801017f0:	e9 fb 2c 00 00       	jmp    801044f0 <release>
801017f5:	8d 76 00             	lea    0x0(%esi),%esi
void
iput(struct inode *ip)
{
  acquiresleep(&ip->lock);
  if(ip->valid && ip->nlink == 0){
    acquire(&icache.lock);
801017f8:	83 ec 0c             	sub    $0xc,%esp
801017fb:	68 e0 09 11 80       	push   $0x801109e0
80101800:	e8 3b 2c 00 00       	call   80104440 <acquire>
    int r = ip->ref;
80101805:	8b 5e 08             	mov    0x8(%esi),%ebx
    release(&icache.lock);
80101808:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010180f:	e8 dc 2c 00 00       	call   801044f0 <release>
    if(r == 1){
80101814:	83 c4 10             	add    $0x10,%esp
80101817:	83 fb 01             	cmp    $0x1,%ebx
8010181a:	75 aa                	jne    801017c6 <iput+0x26>
8010181c:	8d 8e 8c 00 00 00    	lea    0x8c(%esi),%ecx
80101822:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101825:	8d 5e 5c             	lea    0x5c(%esi),%ebx
80101828:	89 cf                	mov    %ecx,%edi
8010182a:	eb 0b                	jmp    80101837 <iput+0x97>
8010182c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101830:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101833:	39 fb                	cmp    %edi,%ebx
80101835:	74 19                	je     80101850 <iput+0xb0>
    if(ip->addrs[i]){
80101837:	8b 13                	mov    (%ebx),%edx
80101839:	85 d2                	test   %edx,%edx
8010183b:	74 f3                	je     80101830 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
8010183d:	8b 06                	mov    (%esi),%eax
8010183f:	e8 ac fb ff ff       	call   801013f0 <bfree>
      ip->addrs[i] = 0;
80101844:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010184a:	eb e4                	jmp    80101830 <iput+0x90>
8010184c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101850:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101856:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101859:	85 c0                	test   %eax,%eax
8010185b:	75 33                	jne    80101890 <iput+0xf0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010185d:	83 ec 0c             	sub    $0xc,%esp
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
80101860:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101867:	56                   	push   %esi
80101868:	e8 53 fd ff ff       	call   801015c0 <iupdate>
    int r = ip->ref;
    release(&icache.lock);
    if(r == 1){
      // inode has no links and no other references: truncate and free.
      itrunc(ip);
      ip->type = 0;
8010186d:	31 c0                	xor    %eax,%eax
8010186f:	66 89 46 50          	mov    %ax,0x50(%esi)
      iupdate(ip);
80101873:	89 34 24             	mov    %esi,(%esp)
80101876:	e8 45 fd ff ff       	call   801015c0 <iupdate>
      ip->valid = 0;
8010187b:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101882:	83 c4 10             	add    $0x10,%esp
80101885:	e9 3c ff ff ff       	jmp    801017c6 <iput+0x26>
8010188a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101890:	83 ec 08             	sub    $0x8,%esp
80101893:	50                   	push   %eax
80101894:	ff 36                	pushl  (%esi)
80101896:	e8 35 e8 ff ff       	call   801000d0 <bread>
8010189b:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018a1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
801018a7:	8d 58 5c             	lea    0x5c(%eax),%ebx
801018aa:	83 c4 10             	add    $0x10,%esp
801018ad:	89 cf                	mov    %ecx,%edi
801018af:	eb 0e                	jmp    801018bf <iput+0x11f>
801018b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018b8:	83 c3 04             	add    $0x4,%ebx
    for(j = 0; j < NINDIRECT; j++){
801018bb:	39 fb                	cmp    %edi,%ebx
801018bd:	74 0f                	je     801018ce <iput+0x12e>
      if(a[j])
801018bf:	8b 13                	mov    (%ebx),%edx
801018c1:	85 d2                	test   %edx,%edx
801018c3:	74 f3                	je     801018b8 <iput+0x118>
        bfree(ip->dev, a[j]);
801018c5:	8b 06                	mov    (%esi),%eax
801018c7:	e8 24 fb ff ff       	call   801013f0 <bfree>
801018cc:	eb ea                	jmp    801018b8 <iput+0x118>
    }
    brelse(bp);
801018ce:	83 ec 0c             	sub    $0xc,%esp
801018d1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018d4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018d7:	e8 04 e9 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018dc:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018e2:	8b 06                	mov    (%esi),%eax
801018e4:	e8 07 fb ff ff       	call   801013f0 <bfree>
    ip->addrs[NDIRECT] = 0;
801018e9:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018f0:	00 00 00 
801018f3:	83 c4 10             	add    $0x10,%esp
801018f6:	e9 62 ff ff ff       	jmp    8010185d <iput+0xbd>
801018fb:	90                   	nop
801018fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101900 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
80101900:	55                   	push   %ebp
80101901:	89 e5                	mov    %esp,%ebp
80101903:	53                   	push   %ebx
80101904:	83 ec 10             	sub    $0x10,%esp
80101907:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
8010190a:	53                   	push   %ebx
8010190b:	e8 40 fe ff ff       	call   80101750 <iunlock>
  iput(ip);
80101910:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101913:	83 c4 10             	add    $0x10,%esp
}
80101916:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101919:	c9                   	leave  
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
8010191a:	e9 81 fe ff ff       	jmp    801017a0 <iput>
8010191f:	90                   	nop

80101920 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	8b 55 08             	mov    0x8(%ebp),%edx
80101926:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101929:	8b 0a                	mov    (%edx),%ecx
8010192b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010192e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101931:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101934:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101938:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010193b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010193f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101943:	8b 52 58             	mov    0x58(%edx),%edx
80101946:	89 50 10             	mov    %edx,0x10(%eax)
}
80101949:	5d                   	pop    %ebp
8010194a:	c3                   	ret    
8010194b:	90                   	nop
8010194c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101950 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101950:	55                   	push   %ebp
80101951:	89 e5                	mov    %esp,%ebp
80101953:	57                   	push   %edi
80101954:	56                   	push   %esi
80101955:	53                   	push   %ebx
80101956:	83 ec 1c             	sub    $0x1c,%esp
80101959:	8b 45 08             	mov    0x8(%ebp),%eax
8010195c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010195f:	8b 75 10             	mov    0x10(%ebp),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101962:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101967:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010196a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010196d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101970:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101973:	0f 84 a7 00 00 00    	je     80101a20 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101979:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010197c:	8b 40 58             	mov    0x58(%eax),%eax
8010197f:	39 f0                	cmp    %esi,%eax
80101981:	0f 82 c1 00 00 00    	jb     80101a48 <readi+0xf8>
80101987:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010198a:	89 fa                	mov    %edi,%edx
8010198c:	01 f2                	add    %esi,%edx
8010198e:	0f 82 b4 00 00 00    	jb     80101a48 <readi+0xf8>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101994:	89 c1                	mov    %eax,%ecx
80101996:	29 f1                	sub    %esi,%ecx
80101998:	39 d0                	cmp    %edx,%eax
8010199a:	0f 43 cf             	cmovae %edi,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
8010199d:	31 ff                	xor    %edi,%edi
8010199f:	85 c9                	test   %ecx,%ecx
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
801019a1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019a4:	74 6d                	je     80101a13 <readi+0xc3>
801019a6:	8d 76 00             	lea    0x0(%esi),%esi
801019a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019b0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019b3:	89 f2                	mov    %esi,%edx
801019b5:	c1 ea 09             	shr    $0x9,%edx
801019b8:	89 d8                	mov    %ebx,%eax
801019ba:	e8 21 f9 ff ff       	call   801012e0 <bmap>
801019bf:	83 ec 08             	sub    $0x8,%esp
801019c2:	50                   	push   %eax
801019c3:	ff 33                	pushl  (%ebx)
    m = min(n - tot, BSIZE - off%BSIZE);
801019c5:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019ca:	e8 01 e7 ff ff       	call   801000d0 <bread>
801019cf:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019d4:	89 f1                	mov    %esi,%ecx
801019d6:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801019dc:	83 c4 0c             	add    $0xc,%esp
    memmove(dst, bp->data + off%BSIZE, m);
801019df:	89 55 dc             	mov    %edx,-0x24(%ebp)
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
801019e2:	29 cb                	sub    %ecx,%ebx
801019e4:	29 f8                	sub    %edi,%eax
801019e6:	39 c3                	cmp    %eax,%ebx
801019e8:	0f 47 d8             	cmova  %eax,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
801019eb:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
801019ef:	53                   	push   %ebx
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019f0:	01 df                	add    %ebx,%edi
801019f2:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
801019f4:	50                   	push   %eax
801019f5:	ff 75 e0             	pushl  -0x20(%ebp)
801019f8:	e8 f3 2b 00 00       	call   801045f0 <memmove>
    brelse(bp);
801019fd:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a00:	89 14 24             	mov    %edx,(%esp)
80101a03:	e8 d8 e7 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a08:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a0b:	83 c4 10             	add    $0x10,%esp
80101a0e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a11:	77 9d                	ja     801019b0 <readi+0x60>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
80101a13:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a16:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a19:	5b                   	pop    %ebx
80101a1a:	5e                   	pop    %esi
80101a1b:	5f                   	pop    %edi
80101a1c:	5d                   	pop    %ebp
80101a1d:	c3                   	ret    
80101a1e:	66 90                	xchg   %ax,%ax
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a20:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a24:	66 83 f8 09          	cmp    $0x9,%ax
80101a28:	77 1e                	ja     80101a48 <readi+0xf8>
80101a2a:	8b 04 c5 60 09 11 80 	mov    -0x7feef6a0(,%eax,8),%eax
80101a31:	85 c0                	test   %eax,%eax
80101a33:	74 13                	je     80101a48 <readi+0xf8>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a35:	89 7d 10             	mov    %edi,0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101a38:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a3b:	5b                   	pop    %ebx
80101a3c:	5e                   	pop    %esi
80101a3d:	5f                   	pop    %edi
80101a3e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a3f:	ff e0                	jmp    *%eax
80101a41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101a48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a4d:	eb c7                	jmp    80101a16 <readi+0xc6>
80101a4f:	90                   	nop

80101a50 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a50:	55                   	push   %ebp
80101a51:	89 e5                	mov    %esp,%ebp
80101a53:	57                   	push   %edi
80101a54:	56                   	push   %esi
80101a55:	53                   	push   %ebx
80101a56:	83 ec 1c             	sub    $0x1c,%esp
80101a59:	8b 45 08             	mov    0x8(%ebp),%eax
80101a5c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a5f:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a62:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a67:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a6a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a6d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a70:	89 7d e0             	mov    %edi,-0x20(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a73:	0f 84 b7 00 00 00    	je     80101b30 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a79:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a7c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a7f:	0f 82 eb 00 00 00    	jb     80101b70 <writei+0x120>
80101a85:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101a88:	89 f8                	mov    %edi,%eax
80101a8a:	01 f0                	add    %esi,%eax
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101a8c:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a91:	0f 87 d9 00 00 00    	ja     80101b70 <writei+0x120>
80101a97:	39 c6                	cmp    %eax,%esi
80101a99:	0f 87 d1 00 00 00    	ja     80101b70 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101a9f:	85 ff                	test   %edi,%edi
80101aa1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101aa8:	74 78                	je     80101b22 <writei+0xd2>
80101aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ab0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101ab3:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101ab5:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101aba:	c1 ea 09             	shr    $0x9,%edx
80101abd:	89 f8                	mov    %edi,%eax
80101abf:	e8 1c f8 ff ff       	call   801012e0 <bmap>
80101ac4:	83 ec 08             	sub    $0x8,%esp
80101ac7:	50                   	push   %eax
80101ac8:	ff 37                	pushl  (%edi)
80101aca:	e8 01 e6 ff ff       	call   801000d0 <bread>
80101acf:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101ad1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101ad4:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101ad7:	89 f1                	mov    %esi,%ecx
80101ad9:	83 c4 0c             	add    $0xc,%esp
80101adc:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101ae2:	29 cb                	sub    %ecx,%ebx
80101ae4:	39 c3                	cmp    %eax,%ebx
80101ae6:	0f 47 d8             	cmova  %eax,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101ae9:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101aed:	53                   	push   %ebx
80101aee:	ff 75 dc             	pushl  -0x24(%ebp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101af1:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101af3:	50                   	push   %eax
80101af4:	e8 f7 2a 00 00       	call   801045f0 <memmove>
    log_write(bp);
80101af9:	89 3c 24             	mov    %edi,(%esp)
80101afc:	e8 2f 12 00 00       	call   80102d30 <log_write>
    brelse(bp);
80101b01:	89 3c 24             	mov    %edi,(%esp)
80101b04:	e8 d7 e6 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b09:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b0c:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b0f:	83 c4 10             	add    $0x10,%esp
80101b12:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101b15:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101b18:	77 96                	ja     80101ab0 <writei+0x60>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101b1a:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b1d:	3b 70 58             	cmp    0x58(%eax),%esi
80101b20:	77 36                	ja     80101b58 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b22:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b25:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b28:	5b                   	pop    %ebx
80101b29:	5e                   	pop    %esi
80101b2a:	5f                   	pop    %edi
80101b2b:	5d                   	pop    %ebp
80101b2c:	c3                   	ret    
80101b2d:	8d 76 00             	lea    0x0(%esi),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b30:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b34:	66 83 f8 09          	cmp    $0x9,%ax
80101b38:	77 36                	ja     80101b70 <writei+0x120>
80101b3a:	8b 04 c5 64 09 11 80 	mov    -0x7feef69c(,%eax,8),%eax
80101b41:	85 c0                	test   %eax,%eax
80101b43:	74 2b                	je     80101b70 <writei+0x120>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b45:	89 7d 10             	mov    %edi,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101b48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b4b:	5b                   	pop    %ebx
80101b4c:	5e                   	pop    %esi
80101b4d:	5f                   	pop    %edi
80101b4e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b4f:	ff e0                	jmp    *%eax
80101b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b58:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101b5b:	83 ec 0c             	sub    $0xc,%esp
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b5e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b61:	50                   	push   %eax
80101b62:	e8 59 fa ff ff       	call   801015c0 <iupdate>
80101b67:	83 c4 10             	add    $0x10,%esp
80101b6a:	eb b6                	jmp    80101b22 <writei+0xd2>
80101b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101b70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b75:	eb ae                	jmp    80101b25 <writei+0xd5>
80101b77:	89 f6                	mov    %esi,%esi
80101b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b80 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b80:	55                   	push   %ebp
80101b81:	89 e5                	mov    %esp,%ebp
80101b83:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101b86:	6a 0e                	push   $0xe
80101b88:	ff 75 0c             	pushl  0xc(%ebp)
80101b8b:	ff 75 08             	pushl  0x8(%ebp)
80101b8e:	e8 dd 2a 00 00       	call   80104670 <strncmp>
}
80101b93:	c9                   	leave  
80101b94:	c3                   	ret    
80101b95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ba0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101ba0:	55                   	push   %ebp
80101ba1:	89 e5                	mov    %esp,%ebp
80101ba3:	57                   	push   %edi
80101ba4:	56                   	push   %esi
80101ba5:	53                   	push   %ebx
80101ba6:	83 ec 1c             	sub    $0x1c,%esp
80101ba9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bac:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bb1:	0f 85 80 00 00 00    	jne    80101c37 <dirlookup+0x97>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101bb7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bba:	31 ff                	xor    %edi,%edi
80101bbc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bbf:	85 d2                	test   %edx,%edx
80101bc1:	75 0d                	jne    80101bd0 <dirlookup+0x30>
80101bc3:	eb 5b                	jmp    80101c20 <dirlookup+0x80>
80101bc5:	8d 76 00             	lea    0x0(%esi),%esi
80101bc8:	83 c7 10             	add    $0x10,%edi
80101bcb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bce:	76 50                	jbe    80101c20 <dirlookup+0x80>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101bd0:	6a 10                	push   $0x10
80101bd2:	57                   	push   %edi
80101bd3:	56                   	push   %esi
80101bd4:	53                   	push   %ebx
80101bd5:	e8 76 fd ff ff       	call   80101950 <readi>
80101bda:	83 c4 10             	add    $0x10,%esp
80101bdd:	83 f8 10             	cmp    $0x10,%eax
80101be0:	75 48                	jne    80101c2a <dirlookup+0x8a>
      panic("dirlookup read");
    if(de.inum == 0)
80101be2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101be7:	74 df                	je     80101bc8 <dirlookup+0x28>
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
80101be9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bec:	83 ec 04             	sub    $0x4,%esp
80101bef:	6a 0e                	push   $0xe
80101bf1:	50                   	push   %eax
80101bf2:	ff 75 0c             	pushl  0xc(%ebp)
80101bf5:	e8 76 2a 00 00       	call   80104670 <strncmp>
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlookup read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
80101bfa:	83 c4 10             	add    $0x10,%esp
80101bfd:	85 c0                	test   %eax,%eax
80101bff:	75 c7                	jne    80101bc8 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101c01:	8b 45 10             	mov    0x10(%ebp),%eax
80101c04:	85 c0                	test   %eax,%eax
80101c06:	74 05                	je     80101c0d <dirlookup+0x6d>
        *poff = off;
80101c08:	8b 45 10             	mov    0x10(%ebp),%eax
80101c0b:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
      return iget(dp->dev, inum);
80101c0d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c11:	8b 03                	mov    (%ebx),%eax
80101c13:	e8 f8 f5 ff ff       	call   80101210 <iget>
    }
  }

  return 0;
}
80101c18:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c1b:	5b                   	pop    %ebx
80101c1c:	5e                   	pop    %esi
80101c1d:	5f                   	pop    %edi
80101c1e:	5d                   	pop    %ebp
80101c1f:	c3                   	ret    
80101c20:	8d 65 f4             	lea    -0xc(%ebp),%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101c23:	31 c0                	xor    %eax,%eax
}
80101c25:	5b                   	pop    %ebx
80101c26:	5e                   	pop    %esi
80101c27:	5f                   	pop    %edi
80101c28:	5d                   	pop    %ebp
80101c29:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlookup read");
80101c2a:	83 ec 0c             	sub    $0xc,%esp
80101c2d:	68 19 72 10 80       	push   $0x80107219
80101c32:	e8 39 e7 ff ff       	call   80100370 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101c37:	83 ec 0c             	sub    $0xc,%esp
80101c3a:	68 07 72 10 80       	push   $0x80107207
80101c3f:	e8 2c e7 ff ff       	call   80100370 <panic>
80101c44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c50 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c50:	55                   	push   %ebp
80101c51:	89 e5                	mov    %esp,%ebp
80101c53:	57                   	push   %edi
80101c54:	56                   	push   %esi
80101c55:	53                   	push   %ebx
80101c56:	89 cf                	mov    %ecx,%edi
80101c58:	89 c3                	mov    %eax,%ebx
80101c5a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c5d:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c60:	89 55 e0             	mov    %edx,-0x20(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101c63:	0f 84 53 01 00 00    	je     80101dbc <namex+0x16c>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c69:	e8 12 1b 00 00       	call   80103780 <myproc>
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c6e:	83 ec 0c             	sub    $0xc,%esp
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c71:	8b 70 68             	mov    0x68(%eax),%esi
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c74:	68 e0 09 11 80       	push   $0x801109e0
80101c79:	e8 c2 27 00 00       	call   80104440 <acquire>
  ip->ref++;
80101c7e:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101c82:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101c89:	e8 62 28 00 00       	call   801044f0 <release>
80101c8e:	83 c4 10             	add    $0x10,%esp
80101c91:	eb 08                	jmp    80101c9b <namex+0x4b>
80101c93:	90                   	nop
80101c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101c98:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101c9b:	0f b6 03             	movzbl (%ebx),%eax
80101c9e:	3c 2f                	cmp    $0x2f,%al
80101ca0:	74 f6                	je     80101c98 <namex+0x48>
    path++;
  if(*path == 0)
80101ca2:	84 c0                	test   %al,%al
80101ca4:	0f 84 e3 00 00 00    	je     80101d8d <namex+0x13d>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101caa:	0f b6 03             	movzbl (%ebx),%eax
80101cad:	89 da                	mov    %ebx,%edx
80101caf:	84 c0                	test   %al,%al
80101cb1:	0f 84 ac 00 00 00    	je     80101d63 <namex+0x113>
80101cb7:	3c 2f                	cmp    $0x2f,%al
80101cb9:	75 09                	jne    80101cc4 <namex+0x74>
80101cbb:	e9 a3 00 00 00       	jmp    80101d63 <namex+0x113>
80101cc0:	84 c0                	test   %al,%al
80101cc2:	74 0a                	je     80101cce <namex+0x7e>
    path++;
80101cc4:	83 c2 01             	add    $0x1,%edx
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101cc7:	0f b6 02             	movzbl (%edx),%eax
80101cca:	3c 2f                	cmp    $0x2f,%al
80101ccc:	75 f2                	jne    80101cc0 <namex+0x70>
80101cce:	89 d1                	mov    %edx,%ecx
80101cd0:	29 d9                	sub    %ebx,%ecx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101cd2:	83 f9 0d             	cmp    $0xd,%ecx
80101cd5:	0f 8e 8d 00 00 00    	jle    80101d68 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101cdb:	83 ec 04             	sub    $0x4,%esp
80101cde:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101ce1:	6a 0e                	push   $0xe
80101ce3:	53                   	push   %ebx
80101ce4:	57                   	push   %edi
80101ce5:	e8 06 29 00 00       	call   801045f0 <memmove>
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101cea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
80101ced:	83 c4 10             	add    $0x10,%esp
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101cf0:	89 d3                	mov    %edx,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101cf2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101cf5:	75 11                	jne    80101d08 <namex+0xb8>
80101cf7:	89 f6                	mov    %esi,%esi
80101cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101d00:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101d03:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d06:	74 f8                	je     80101d00 <namex+0xb0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d08:	83 ec 0c             	sub    $0xc,%esp
80101d0b:	56                   	push   %esi
80101d0c:	e8 5f f9 ff ff       	call   80101670 <ilock>
    if(ip->type != T_DIR){
80101d11:	83 c4 10             	add    $0x10,%esp
80101d14:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d19:	0f 85 7f 00 00 00    	jne    80101d9e <namex+0x14e>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d1f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d22:	85 d2                	test   %edx,%edx
80101d24:	74 09                	je     80101d2f <namex+0xdf>
80101d26:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d29:	0f 84 a3 00 00 00    	je     80101dd2 <namex+0x182>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d2f:	83 ec 04             	sub    $0x4,%esp
80101d32:	6a 00                	push   $0x0
80101d34:	57                   	push   %edi
80101d35:	56                   	push   %esi
80101d36:	e8 65 fe ff ff       	call   80101ba0 <dirlookup>
80101d3b:	83 c4 10             	add    $0x10,%esp
80101d3e:	85 c0                	test   %eax,%eax
80101d40:	74 5c                	je     80101d9e <namex+0x14e>

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d42:	83 ec 0c             	sub    $0xc,%esp
80101d45:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d48:	56                   	push   %esi
80101d49:	e8 02 fa ff ff       	call   80101750 <iunlock>
  iput(ip);
80101d4e:	89 34 24             	mov    %esi,(%esp)
80101d51:	e8 4a fa ff ff       	call   801017a0 <iput>
80101d56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d59:	83 c4 10             	add    $0x10,%esp
80101d5c:	89 c6                	mov    %eax,%esi
80101d5e:	e9 38 ff ff ff       	jmp    80101c9b <namex+0x4b>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d63:	31 c9                	xor    %ecx,%ecx
80101d65:	8d 76 00             	lea    0x0(%esi),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101d68:	83 ec 04             	sub    $0x4,%esp
80101d6b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d6e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d71:	51                   	push   %ecx
80101d72:	53                   	push   %ebx
80101d73:	57                   	push   %edi
80101d74:	e8 77 28 00 00       	call   801045f0 <memmove>
    name[len] = 0;
80101d79:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d7c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d7f:	83 c4 10             	add    $0x10,%esp
80101d82:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d86:	89 d3                	mov    %edx,%ebx
80101d88:	e9 65 ff ff ff       	jmp    80101cf2 <namex+0xa2>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101d8d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d90:	85 c0                	test   %eax,%eax
80101d92:	75 54                	jne    80101de8 <namex+0x198>
80101d94:	89 f0                	mov    %esi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101d96:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d99:	5b                   	pop    %ebx
80101d9a:	5e                   	pop    %esi
80101d9b:	5f                   	pop    %edi
80101d9c:	5d                   	pop    %ebp
80101d9d:	c3                   	ret    

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d9e:	83 ec 0c             	sub    $0xc,%esp
80101da1:	56                   	push   %esi
80101da2:	e8 a9 f9 ff ff       	call   80101750 <iunlock>
  iput(ip);
80101da7:	89 34 24             	mov    %esi,(%esp)
80101daa:	e8 f1 f9 ff ff       	call   801017a0 <iput>
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101daf:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101db2:	8d 65 f4             	lea    -0xc(%ebp),%esp
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101db5:	31 c0                	xor    %eax,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101db7:	5b                   	pop    %ebx
80101db8:	5e                   	pop    %esi
80101db9:	5f                   	pop    %edi
80101dba:	5d                   	pop    %ebp
80101dbb:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101dbc:	ba 01 00 00 00       	mov    $0x1,%edx
80101dc1:	b8 01 00 00 00       	mov    $0x1,%eax
80101dc6:	e8 45 f4 ff ff       	call   80101210 <iget>
80101dcb:	89 c6                	mov    %eax,%esi
80101dcd:	e9 c9 fe ff ff       	jmp    80101c9b <namex+0x4b>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101dd2:	83 ec 0c             	sub    $0xc,%esp
80101dd5:	56                   	push   %esi
80101dd6:	e8 75 f9 ff ff       	call   80101750 <iunlock>
      return ip;
80101ddb:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dde:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
      return ip;
80101de1:	89 f0                	mov    %esi,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101de3:	5b                   	pop    %ebx
80101de4:	5e                   	pop    %esi
80101de5:	5f                   	pop    %edi
80101de6:	5d                   	pop    %ebp
80101de7:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101de8:	83 ec 0c             	sub    $0xc,%esp
80101deb:	56                   	push   %esi
80101dec:	e8 af f9 ff ff       	call   801017a0 <iput>
    return 0;
80101df1:	83 c4 10             	add    $0x10,%esp
80101df4:	31 c0                	xor    %eax,%eax
80101df6:	eb 9e                	jmp    80101d96 <namex+0x146>
80101df8:	90                   	nop
80101df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101e00 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101e00:	55                   	push   %ebp
80101e01:	89 e5                	mov    %esp,%ebp
80101e03:	57                   	push   %edi
80101e04:	56                   	push   %esi
80101e05:	53                   	push   %ebx
80101e06:	83 ec 20             	sub    $0x20,%esp
80101e09:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e0c:	6a 00                	push   $0x0
80101e0e:	ff 75 0c             	pushl  0xc(%ebp)
80101e11:	53                   	push   %ebx
80101e12:	e8 89 fd ff ff       	call   80101ba0 <dirlookup>
80101e17:	83 c4 10             	add    $0x10,%esp
80101e1a:	85 c0                	test   %eax,%eax
80101e1c:	75 67                	jne    80101e85 <dirlink+0x85>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101e1e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e21:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e24:	85 ff                	test   %edi,%edi
80101e26:	74 29                	je     80101e51 <dirlink+0x51>
80101e28:	31 ff                	xor    %edi,%edi
80101e2a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e2d:	eb 09                	jmp    80101e38 <dirlink+0x38>
80101e2f:	90                   	nop
80101e30:	83 c7 10             	add    $0x10,%edi
80101e33:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e36:	76 19                	jbe    80101e51 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e38:	6a 10                	push   $0x10
80101e3a:	57                   	push   %edi
80101e3b:	56                   	push   %esi
80101e3c:	53                   	push   %ebx
80101e3d:	e8 0e fb ff ff       	call   80101950 <readi>
80101e42:	83 c4 10             	add    $0x10,%esp
80101e45:	83 f8 10             	cmp    $0x10,%eax
80101e48:	75 4e                	jne    80101e98 <dirlink+0x98>
      panic("dirlink read");
    if(de.inum == 0)
80101e4a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e4f:	75 df                	jne    80101e30 <dirlink+0x30>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101e51:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e54:	83 ec 04             	sub    $0x4,%esp
80101e57:	6a 0e                	push   $0xe
80101e59:	ff 75 0c             	pushl  0xc(%ebp)
80101e5c:	50                   	push   %eax
80101e5d:	e8 7e 28 00 00       	call   801046e0 <strncpy>
  de.inum = inum;
80101e62:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e65:	6a 10                	push   $0x10
80101e67:	57                   	push   %edi
80101e68:	56                   	push   %esi
80101e69:	53                   	push   %ebx
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101e6a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e6e:	e8 dd fb ff ff       	call   80101a50 <writei>
80101e73:	83 c4 20             	add    $0x20,%esp
80101e76:	83 f8 10             	cmp    $0x10,%eax
80101e79:	75 2a                	jne    80101ea5 <dirlink+0xa5>
    panic("dirlink");

  return 0;
80101e7b:	31 c0                	xor    %eax,%eax
}
80101e7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e80:	5b                   	pop    %ebx
80101e81:	5e                   	pop    %esi
80101e82:	5f                   	pop    %edi
80101e83:	5d                   	pop    %ebp
80101e84:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101e85:	83 ec 0c             	sub    $0xc,%esp
80101e88:	50                   	push   %eax
80101e89:	e8 12 f9 ff ff       	call   801017a0 <iput>
    return -1;
80101e8e:	83 c4 10             	add    $0x10,%esp
80101e91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e96:	eb e5                	jmp    80101e7d <dirlink+0x7d>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101e98:	83 ec 0c             	sub    $0xc,%esp
80101e9b:	68 28 72 10 80       	push   $0x80107228
80101ea0:	e8 cb e4 ff ff       	call   80100370 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101ea5:	83 ec 0c             	sub    $0xc,%esp
80101ea8:	68 82 78 10 80       	push   $0x80107882
80101ead:	e8 be e4 ff ff       	call   80100370 <panic>
80101eb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ec0 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80101ec0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ec1:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80101ec3:	89 e5                	mov    %esp,%ebp
80101ec5:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ec8:	8b 45 08             	mov    0x8(%ebp),%eax
80101ecb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101ece:	e8 7d fd ff ff       	call   80101c50 <namex>
}
80101ed3:	c9                   	leave  
80101ed4:	c3                   	ret    
80101ed5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ee0 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101ee0:	55                   	push   %ebp
  return namex(path, 1, name);
80101ee1:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80101ee6:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101ee8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101eeb:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101eee:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
80101eef:	e9 5c fd ff ff       	jmp    80101c50 <namex>
80101ef4:	66 90                	xchg   %ax,%ax
80101ef6:	66 90                	xchg   %ax,%ax
80101ef8:	66 90                	xchg   %ax,%ax
80101efa:	66 90                	xchg   %ax,%ax
80101efc:	66 90                	xchg   %ax,%ax
80101efe:	66 90                	xchg   %ax,%ax

80101f00 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f00:	55                   	push   %ebp
  if(b == 0)
80101f01:	85 c0                	test   %eax,%eax
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f03:	89 e5                	mov    %esp,%ebp
80101f05:	56                   	push   %esi
80101f06:	53                   	push   %ebx
  if(b == 0)
80101f07:	0f 84 ad 00 00 00    	je     80101fba <idestart+0xba>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101f0d:	8b 58 08             	mov    0x8(%eax),%ebx
80101f10:	89 c1                	mov    %eax,%ecx
80101f12:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f18:	0f 87 8f 00 00 00    	ja     80101fad <idestart+0xad>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f1e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f23:	90                   	nop
80101f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f28:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f29:	83 e0 c0             	and    $0xffffffc0,%eax
80101f2c:	3c 40                	cmp    $0x40,%al
80101f2e:	75 f8                	jne    80101f28 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f30:	31 f6                	xor    %esi,%esi
80101f32:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f37:	89 f0                	mov    %esi,%eax
80101f39:	ee                   	out    %al,(%dx)
80101f3a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f3f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f44:	ee                   	out    %al,(%dx)
80101f45:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f4a:	89 d8                	mov    %ebx,%eax
80101f4c:	ee                   	out    %al,(%dx)
80101f4d:	89 d8                	mov    %ebx,%eax
80101f4f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f54:	c1 f8 08             	sar    $0x8,%eax
80101f57:	ee                   	out    %al,(%dx)
80101f58:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f5d:	89 f0                	mov    %esi,%eax
80101f5f:	ee                   	out    %al,(%dx)
80101f60:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f64:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f69:	83 e0 01             	and    $0x1,%eax
80101f6c:	c1 e0 04             	shl    $0x4,%eax
80101f6f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f72:	ee                   	out    %al,(%dx)
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
80101f73:	f6 01 04             	testb  $0x4,(%ecx)
80101f76:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f7b:	75 13                	jne    80101f90 <idestart+0x90>
80101f7d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f82:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f83:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f86:	5b                   	pop    %ebx
80101f87:	5e                   	pop    %esi
80101f88:	5d                   	pop    %ebp
80101f89:	c3                   	ret    
80101f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f90:	b8 30 00 00 00       	mov    $0x30,%eax
80101f95:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
80101f96:	ba f0 01 00 00       	mov    $0x1f0,%edx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
80101f9b:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f9e:	b9 80 00 00 00       	mov    $0x80,%ecx
80101fa3:	fc                   	cld    
80101fa4:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101fa6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101fa9:	5b                   	pop    %ebx
80101faa:	5e                   	pop    %esi
80101fab:	5d                   	pop    %ebp
80101fac:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
80101fad:	83 ec 0c             	sub    $0xc,%esp
80101fb0:	68 94 72 10 80       	push   $0x80107294
80101fb5:	e8 b6 e3 ff ff       	call   80100370 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
80101fba:	83 ec 0c             	sub    $0xc,%esp
80101fbd:	68 8b 72 10 80       	push   $0x8010728b
80101fc2:	e8 a9 e3 ff ff       	call   80100370 <panic>
80101fc7:	89 f6                	mov    %esi,%esi
80101fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fd0 <ideinit>:
  return 0;
}

void
ideinit(void)
{
80101fd0:	55                   	push   %ebp
80101fd1:	89 e5                	mov    %esp,%ebp
80101fd3:	83 ec 10             	sub    $0x10,%esp
  int i;

  initlock(&idelock, "ide");
80101fd6:	68 a6 72 10 80       	push   $0x801072a6
80101fdb:	68 80 a5 10 80       	push   $0x8010a580
80101fe0:	e8 fb 22 00 00       	call   801042e0 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
80101fe5:	58                   	pop    %eax
80101fe6:	a1 00 2d 11 80       	mov    0x80112d00,%eax
80101feb:	5a                   	pop    %edx
80101fec:	83 e8 01             	sub    $0x1,%eax
80101fef:	50                   	push   %eax
80101ff0:	6a 0e                	push   $0xe
80101ff2:	e8 a9 02 00 00       	call   801022a0 <ioapicenable>
80101ff7:	83 c4 10             	add    $0x10,%esp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101ffa:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fff:	90                   	nop
80102000:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102001:	83 e0 c0             	and    $0xffffffc0,%eax
80102004:	3c 40                	cmp    $0x40,%al
80102006:	75 f8                	jne    80102000 <ideinit+0x30>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102008:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010200d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102012:	ee                   	out    %al,(%dx)
80102013:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102018:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010201d:	eb 06                	jmp    80102025 <ideinit+0x55>
8010201f:	90                   	nop
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
80102020:	83 e9 01             	sub    $0x1,%ecx
80102023:	74 0f                	je     80102034 <ideinit+0x64>
80102025:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102026:	84 c0                	test   %al,%al
80102028:	74 f6                	je     80102020 <ideinit+0x50>
      havedisk1 = 1;
8010202a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102031:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102034:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102039:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010203e:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
8010203f:	c9                   	leave  
80102040:	c3                   	ret    
80102041:	eb 0d                	jmp    80102050 <ideintr>
80102043:	90                   	nop
80102044:	90                   	nop
80102045:	90                   	nop
80102046:	90                   	nop
80102047:	90                   	nop
80102048:	90                   	nop
80102049:	90                   	nop
8010204a:	90                   	nop
8010204b:	90                   	nop
8010204c:	90                   	nop
8010204d:	90                   	nop
8010204e:	90                   	nop
8010204f:	90                   	nop

80102050 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
80102050:	55                   	push   %ebp
80102051:	89 e5                	mov    %esp,%ebp
80102053:	57                   	push   %edi
80102054:	56                   	push   %esi
80102055:	53                   	push   %ebx
80102056:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102059:	68 80 a5 10 80       	push   $0x8010a580
8010205e:	e8 dd 23 00 00       	call   80104440 <acquire>

  if((b = idequeue) == 0){
80102063:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102069:	83 c4 10             	add    $0x10,%esp
8010206c:	85 db                	test   %ebx,%ebx
8010206e:	74 34                	je     801020a4 <ideintr+0x54>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
80102070:	8b 43 58             	mov    0x58(%ebx),%eax
80102073:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102078:	8b 33                	mov    (%ebx),%esi
8010207a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102080:	74 3e                	je     801020c0 <ideintr+0x70>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102082:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
80102085:	83 ec 0c             	sub    $0xc,%esp
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102088:	83 ce 02             	or     $0x2,%esi
8010208b:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
8010208d:	53                   	push   %ebx
8010208e:	e8 4d 1e 00 00       	call   80103ee0 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102093:	a1 64 a5 10 80       	mov    0x8010a564,%eax
80102098:	83 c4 10             	add    $0x10,%esp
8010209b:	85 c0                	test   %eax,%eax
8010209d:	74 05                	je     801020a4 <ideintr+0x54>
    idestart(idequeue);
8010209f:	e8 5c fe ff ff       	call   80101f00 <idestart>

  // First queued buffer is the active request.
  acquire(&idelock);

  if((b = idequeue) == 0){
    release(&idelock);
801020a4:	83 ec 0c             	sub    $0xc,%esp
801020a7:	68 80 a5 10 80       	push   $0x8010a580
801020ac:	e8 3f 24 00 00       	call   801044f0 <release>
  // Start disk on next buf in queue.
  if(idequeue != 0)
    idestart(idequeue);

  release(&idelock);
}
801020b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020b4:	5b                   	pop    %ebx
801020b5:	5e                   	pop    %esi
801020b6:	5f                   	pop    %edi
801020b7:	5d                   	pop    %ebp
801020b8:	c3                   	ret    
801020b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020c0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020c5:	8d 76 00             	lea    0x0(%esi),%esi
801020c8:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020c9:	89 c1                	mov    %eax,%ecx
801020cb:	83 e1 c0             	and    $0xffffffc0,%ecx
801020ce:	80 f9 40             	cmp    $0x40,%cl
801020d1:	75 f5                	jne    801020c8 <ideintr+0x78>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020d3:	a8 21                	test   $0x21,%al
801020d5:	75 ab                	jne    80102082 <ideintr+0x32>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
801020d7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
801020da:	b9 80 00 00 00       	mov    $0x80,%ecx
801020df:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020e4:	fc                   	cld    
801020e5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020e7:	8b 33                	mov    (%ebx),%esi
801020e9:	eb 97                	jmp    80102082 <ideintr+0x32>
801020eb:	90                   	nop
801020ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020f0 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
801020f0:	55                   	push   %ebp
801020f1:	89 e5                	mov    %esp,%ebp
801020f3:	53                   	push   %ebx
801020f4:	83 ec 10             	sub    $0x10,%esp
801020f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
801020fa:	8d 43 0c             	lea    0xc(%ebx),%eax
801020fd:	50                   	push   %eax
801020fe:	e8 8d 21 00 00       	call   80104290 <holdingsleep>
80102103:	83 c4 10             	add    $0x10,%esp
80102106:	85 c0                	test   %eax,%eax
80102108:	0f 84 ad 00 00 00    	je     801021bb <iderw+0xcb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010210e:	8b 03                	mov    (%ebx),%eax
80102110:	83 e0 06             	and    $0x6,%eax
80102113:	83 f8 02             	cmp    $0x2,%eax
80102116:	0f 84 b9 00 00 00    	je     801021d5 <iderw+0xe5>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010211c:	8b 53 04             	mov    0x4(%ebx),%edx
8010211f:	85 d2                	test   %edx,%edx
80102121:	74 0d                	je     80102130 <iderw+0x40>
80102123:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102128:	85 c0                	test   %eax,%eax
8010212a:	0f 84 98 00 00 00    	je     801021c8 <iderw+0xd8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102130:	83 ec 0c             	sub    $0xc,%esp
80102133:	68 80 a5 10 80       	push   $0x8010a580
80102138:	e8 03 23 00 00       	call   80104440 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010213d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102143:	83 c4 10             	add    $0x10,%esp
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
80102146:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010214d:	85 d2                	test   %edx,%edx
8010214f:	75 09                	jne    8010215a <iderw+0x6a>
80102151:	eb 58                	jmp    801021ab <iderw+0xbb>
80102153:	90                   	nop
80102154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102158:	89 c2                	mov    %eax,%edx
8010215a:	8b 42 58             	mov    0x58(%edx),%eax
8010215d:	85 c0                	test   %eax,%eax
8010215f:	75 f7                	jne    80102158 <iderw+0x68>
80102161:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
80102164:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
80102166:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
8010216c:	74 44                	je     801021b2 <iderw+0xc2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010216e:	8b 03                	mov    (%ebx),%eax
80102170:	83 e0 06             	and    $0x6,%eax
80102173:	83 f8 02             	cmp    $0x2,%eax
80102176:	74 23                	je     8010219b <iderw+0xab>
80102178:	90                   	nop
80102179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
80102180:	83 ec 08             	sub    $0x8,%esp
80102183:	68 80 a5 10 80       	push   $0x8010a580
80102188:	53                   	push   %ebx
80102189:	e8 a2 1b 00 00       	call   80103d30 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010218e:	8b 03                	mov    (%ebx),%eax
80102190:	83 c4 10             	add    $0x10,%esp
80102193:	83 e0 06             	and    $0x6,%eax
80102196:	83 f8 02             	cmp    $0x2,%eax
80102199:	75 e5                	jne    80102180 <iderw+0x90>
    sleep(b, &idelock);
  }


  release(&idelock);
8010219b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
801021a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021a5:	c9                   	leave  
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }


  release(&idelock);
801021a6:	e9 45 23 00 00       	jmp    801044f0 <release>

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021ab:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
801021b0:	eb b2                	jmp    80102164 <iderw+0x74>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
801021b2:	89 d8                	mov    %ebx,%eax
801021b4:	e8 47 fd ff ff       	call   80101f00 <idestart>
801021b9:	eb b3                	jmp    8010216e <iderw+0x7e>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
801021bb:	83 ec 0c             	sub    $0xc,%esp
801021be:	68 aa 72 10 80       	push   $0x801072aa
801021c3:	e8 a8 e1 ff ff       	call   80100370 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
801021c8:	83 ec 0c             	sub    $0xc,%esp
801021cb:	68 d5 72 10 80       	push   $0x801072d5
801021d0:	e8 9b e1 ff ff       	call   80100370 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
801021d5:	83 ec 0c             	sub    $0xc,%esp
801021d8:	68 c0 72 10 80       	push   $0x801072c0
801021dd:	e8 8e e1 ff ff       	call   80100370 <panic>
801021e2:	66 90                	xchg   %ax,%ax
801021e4:	66 90                	xchg   %ax,%ax
801021e6:	66 90                	xchg   %ax,%ax
801021e8:	66 90                	xchg   %ax,%ax
801021ea:	66 90                	xchg   %ax,%ax
801021ec:	66 90                	xchg   %ax,%ax
801021ee:	66 90                	xchg   %ax,%ax

801021f0 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
801021f0:	55                   	push   %ebp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
801021f1:	c7 05 34 26 11 80 00 	movl   $0xfec00000,0x80112634
801021f8:	00 c0 fe 
  ioapic->data = data;
}

void
ioapicinit(void)
{
801021fb:	89 e5                	mov    %esp,%ebp
801021fd:	56                   	push   %esi
801021fe:	53                   	push   %ebx
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
801021ff:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102206:	00 00 00 
  return ioapic->data;
80102209:	8b 15 34 26 11 80    	mov    0x80112634,%edx
8010220f:	8b 72 10             	mov    0x10(%edx),%esi
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
80102212:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
80102218:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010221e:	0f b6 15 60 27 11 80 	movzbl 0x80112760,%edx
ioapicinit(void)
{
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102225:	89 f0                	mov    %esi,%eax
80102227:	c1 e8 10             	shr    $0x10,%eax
8010222a:	0f b6 f0             	movzbl %al,%esi

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
  return ioapic->data;
8010222d:	8b 41 10             	mov    0x10(%ecx),%eax
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
80102230:	c1 e8 18             	shr    $0x18,%eax
80102233:	39 d0                	cmp    %edx,%eax
80102235:	74 16                	je     8010224d <ioapicinit+0x5d>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102237:	83 ec 0c             	sub    $0xc,%esp
8010223a:	68 f4 72 10 80       	push   $0x801072f4
8010223f:	e8 1c e4 ff ff       	call   80100660 <cprintf>
80102244:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
8010224a:	83 c4 10             	add    $0x10,%esp
8010224d:	83 c6 21             	add    $0x21,%esi
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102250:	ba 10 00 00 00       	mov    $0x10,%edx
80102255:	b8 20 00 00 00       	mov    $0x20,%eax
8010225a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102260:	89 11                	mov    %edx,(%ecx)
  ioapic->data = data;
80102262:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
80102268:	89 c3                	mov    %eax,%ebx
8010226a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102270:	83 c0 01             	add    $0x1,%eax

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
80102273:	89 59 10             	mov    %ebx,0x10(%ecx)
80102276:	8d 5a 01             	lea    0x1(%edx),%ebx
80102279:	83 c2 02             	add    $0x2,%edx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
8010227c:	39 f0                	cmp    %esi,%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
8010227e:	89 19                	mov    %ebx,(%ecx)
  ioapic->data = data;
80102280:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
80102286:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
8010228d:	75 d1                	jne    80102260 <ioapicinit+0x70>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
8010228f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102292:	5b                   	pop    %ebx
80102293:	5e                   	pop    %esi
80102294:	5d                   	pop    %ebp
80102295:	c3                   	ret    
80102296:	8d 76 00             	lea    0x0(%esi),%esi
80102299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022a0 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
801022a0:	55                   	push   %ebp
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022a1:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
  }
}

void
ioapicenable(int irq, int cpunum)
{
801022a7:	89 e5                	mov    %esp,%ebp
801022a9:	8b 45 08             	mov    0x8(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
801022ac:	8d 50 20             	lea    0x20(%eax),%edx
801022af:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022b3:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
801022b5:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022bb:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
801022be:	89 51 10             	mov    %edx,0x10(%ecx)
{
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022c1:	8b 55 0c             	mov    0xc(%ebp),%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022c4:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
801022c6:	a1 34 26 11 80       	mov    0x80112634,%eax
{
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022cb:	c1 e2 18             	shl    $0x18,%edx

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
801022ce:	89 50 10             	mov    %edx,0x10(%eax)
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
}
801022d1:	5d                   	pop    %ebp
801022d2:	c3                   	ret    
801022d3:	66 90                	xchg   %ax,%ax
801022d5:	66 90                	xchg   %ax,%ax
801022d7:	66 90                	xchg   %ax,%ax
801022d9:	66 90                	xchg   %ax,%ax
801022db:	66 90                	xchg   %ax,%ax
801022dd:	66 90                	xchg   %ax,%ax
801022df:	90                   	nop

801022e0 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
801022e0:	55                   	push   %ebp
801022e1:	89 e5                	mov    %esp,%ebp
801022e3:	53                   	push   %ebx
801022e4:	83 ec 04             	sub    $0x4,%esp
801022e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
801022ea:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022f0:	75 70                	jne    80102362 <kfree+0x82>
801022f2:	81 fb a8 54 11 80    	cmp    $0x801154a8,%ebx
801022f8:	72 68                	jb     80102362 <kfree+0x82>
801022fa:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102300:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102305:	77 5b                	ja     80102362 <kfree+0x82>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80102307:	83 ec 04             	sub    $0x4,%esp
8010230a:	68 00 10 00 00       	push   $0x1000
8010230f:	6a 01                	push   $0x1
80102311:	53                   	push   %ebx
80102312:	e8 29 22 00 00       	call   80104540 <memset>

  if(kmem.use_lock)
80102317:	8b 15 74 26 11 80    	mov    0x80112674,%edx
8010231d:	83 c4 10             	add    $0x10,%esp
80102320:	85 d2                	test   %edx,%edx
80102322:	75 2c                	jne    80102350 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102324:	a1 78 26 11 80       	mov    0x80112678,%eax
80102329:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
8010232b:	a1 74 26 11 80       	mov    0x80112674,%eax

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
80102330:	89 1d 78 26 11 80    	mov    %ebx,0x80112678
  if(kmem.use_lock)
80102336:	85 c0                	test   %eax,%eax
80102338:	75 06                	jne    80102340 <kfree+0x60>
    release(&kmem.lock);
}
8010233a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010233d:	c9                   	leave  
8010233e:	c3                   	ret    
8010233f:	90                   	nop
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
80102340:	c7 45 08 40 26 11 80 	movl   $0x80112640,0x8(%ebp)
}
80102347:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010234a:	c9                   	leave  
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
8010234b:	e9 a0 21 00 00       	jmp    801044f0 <release>

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102350:	83 ec 0c             	sub    $0xc,%esp
80102353:	68 40 26 11 80       	push   $0x80112640
80102358:	e8 e3 20 00 00       	call   80104440 <acquire>
8010235d:	83 c4 10             	add    $0x10,%esp
80102360:	eb c2                	jmp    80102324 <kfree+0x44>
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");
80102362:	83 ec 0c             	sub    $0xc,%esp
80102365:	68 26 73 10 80       	push   $0x80107326
8010236a:	e8 01 e0 ff ff       	call   80100370 <panic>
8010236f:	90                   	nop

80102370 <freerange>:
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
80102370:	55                   	push   %ebp
80102371:	89 e5                	mov    %esp,%ebp
80102373:	56                   	push   %esi
80102374:	53                   	push   %ebx
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102375:	8b 45 08             	mov    0x8(%ebp),%eax
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
80102378:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010237b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102381:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102387:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010238d:	39 de                	cmp    %ebx,%esi
8010238f:	72 23                	jb     801023b4 <freerange+0x44>
80102391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102398:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010239e:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023a1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801023a7:	50                   	push   %eax
801023a8:	e8 33 ff ff ff       	call   801022e0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023ad:	83 c4 10             	add    $0x10,%esp
801023b0:	39 f3                	cmp    %esi,%ebx
801023b2:	76 e4                	jbe    80102398 <freerange+0x28>
    kfree(p);
}
801023b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023b7:	5b                   	pop    %ebx
801023b8:	5e                   	pop    %esi
801023b9:	5d                   	pop    %ebp
801023ba:	c3                   	ret    
801023bb:	90                   	nop
801023bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023c0 <kinit1>:
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
801023c0:	55                   	push   %ebp
801023c1:	89 e5                	mov    %esp,%ebp
801023c3:	56                   	push   %esi
801023c4:	53                   	push   %ebx
801023c5:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
801023c8:	83 ec 08             	sub    $0x8,%esp
801023cb:	68 2c 73 10 80       	push   $0x8010732c
801023d0:	68 40 26 11 80       	push   $0x80112640
801023d5:	e8 06 1f 00 00       	call   801042e0 <initlock>

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023da:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023dd:	83 c4 10             	add    $0x10,%esp
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
801023e0:	c7 05 74 26 11 80 00 	movl   $0x0,0x80112674
801023e7:	00 00 00 

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023ea:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023f0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023f6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023fc:	39 de                	cmp    %ebx,%esi
801023fe:	72 1c                	jb     8010241c <kinit1+0x5c>
    kfree(p);
80102400:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102406:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102409:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
8010240f:	50                   	push   %eax
80102410:	e8 cb fe ff ff       	call   801022e0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102415:	83 c4 10             	add    $0x10,%esp
80102418:	39 de                	cmp    %ebx,%esi
8010241a:	73 e4                	jae    80102400 <kinit1+0x40>
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
}
8010241c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010241f:	5b                   	pop    %ebx
80102420:	5e                   	pop    %esi
80102421:	5d                   	pop    %ebp
80102422:	c3                   	ret    
80102423:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102430 <kinit2>:

void
kinit2(void *vstart, void *vend)
{
80102430:	55                   	push   %ebp
80102431:	89 e5                	mov    %esp,%ebp
80102433:	56                   	push   %esi
80102434:	53                   	push   %ebx

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102435:	8b 45 08             	mov    0x8(%ebp),%eax
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
80102438:	8b 75 0c             	mov    0xc(%ebp),%esi

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010243b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102441:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102447:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010244d:	39 de                	cmp    %ebx,%esi
8010244f:	72 23                	jb     80102474 <kinit2+0x44>
80102451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102458:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010245e:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102461:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102467:	50                   	push   %eax
80102468:	e8 73 fe ff ff       	call   801022e0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010246d:	83 c4 10             	add    $0x10,%esp
80102470:	39 de                	cmp    %ebx,%esi
80102472:	73 e4                	jae    80102458 <kinit2+0x28>

void
kinit2(void *vstart, void *vend)
{
  freerange(vstart, vend);
  kmem.use_lock = 1;
80102474:	c7 05 74 26 11 80 01 	movl   $0x1,0x80112674
8010247b:	00 00 00 
}
8010247e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102481:	5b                   	pop    %ebx
80102482:	5e                   	pop    %esi
80102483:	5d                   	pop    %ebp
80102484:	c3                   	ret    
80102485:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102490 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
80102490:	55                   	push   %ebp
80102491:	89 e5                	mov    %esp,%ebp
80102493:	53                   	push   %ebx
80102494:	83 ec 04             	sub    $0x4,%esp
  struct run *r;

  if(kmem.use_lock)
80102497:	a1 74 26 11 80       	mov    0x80112674,%eax
8010249c:	85 c0                	test   %eax,%eax
8010249e:	75 30                	jne    801024d0 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
801024a0:	8b 1d 78 26 11 80    	mov    0x80112678,%ebx
  if(r)
801024a6:	85 db                	test   %ebx,%ebx
801024a8:	74 1c                	je     801024c6 <kalloc+0x36>
    kmem.freelist = r->next;
801024aa:	8b 13                	mov    (%ebx),%edx
801024ac:	89 15 78 26 11 80    	mov    %edx,0x80112678
  if(kmem.use_lock)
801024b2:	85 c0                	test   %eax,%eax
801024b4:	74 10                	je     801024c6 <kalloc+0x36>
    release(&kmem.lock);
801024b6:	83 ec 0c             	sub    $0xc,%esp
801024b9:	68 40 26 11 80       	push   $0x80112640
801024be:	e8 2d 20 00 00       	call   801044f0 <release>
801024c3:	83 c4 10             	add    $0x10,%esp
  return (char*)r;
}
801024c6:	89 d8                	mov    %ebx,%eax
801024c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024cb:	c9                   	leave  
801024cc:	c3                   	ret    
801024cd:	8d 76 00             	lea    0x0(%esi),%esi
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);
801024d0:	83 ec 0c             	sub    $0xc,%esp
801024d3:	68 40 26 11 80       	push   $0x80112640
801024d8:	e8 63 1f 00 00       	call   80104440 <acquire>
  r = kmem.freelist;
801024dd:	8b 1d 78 26 11 80    	mov    0x80112678,%ebx
  if(r)
801024e3:	83 c4 10             	add    $0x10,%esp
801024e6:	a1 74 26 11 80       	mov    0x80112674,%eax
801024eb:	85 db                	test   %ebx,%ebx
801024ed:	75 bb                	jne    801024aa <kalloc+0x1a>
801024ef:	eb c1                	jmp    801024b2 <kalloc+0x22>
801024f1:	66 90                	xchg   %ax,%ax
801024f3:	66 90                	xchg   %ax,%ax
801024f5:	66 90                	xchg   %ax,%ax
801024f7:	66 90                	xchg   %ax,%ax
801024f9:	66 90                	xchg   %ax,%ax
801024fb:	66 90                	xchg   %ax,%ax
801024fd:	66 90                	xchg   %ax,%ax
801024ff:	90                   	nop

80102500 <kbdgetc>:
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
80102500:	55                   	push   %ebp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102501:	ba 64 00 00 00       	mov    $0x64,%edx
80102506:	89 e5                	mov    %esp,%ebp
80102508:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102509:	a8 01                	test   $0x1,%al
8010250b:	0f 84 af 00 00 00    	je     801025c0 <kbdgetc+0xc0>
80102511:	ba 60 00 00 00       	mov    $0x60,%edx
80102516:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102517:	0f b6 d0             	movzbl %al,%edx

  if(data == 0xE0){
8010251a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102520:	74 7e                	je     801025a0 <kbdgetc+0xa0>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
80102522:	84 c0                	test   %al,%al
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
80102524:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
8010252a:	79 24                	jns    80102550 <kbdgetc+0x50>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
8010252c:	f6 c1 40             	test   $0x40,%cl
8010252f:	75 05                	jne    80102536 <kbdgetc+0x36>
80102531:	89 c2                	mov    %eax,%edx
80102533:	83 e2 7f             	and    $0x7f,%edx
    shift &= ~(shiftcode[data] | E0ESC);
80102536:	0f b6 82 60 74 10 80 	movzbl -0x7fef8ba0(%edx),%eax
8010253d:	83 c8 40             	or     $0x40,%eax
80102540:	0f b6 c0             	movzbl %al,%eax
80102543:	f7 d0                	not    %eax
80102545:	21 c8                	and    %ecx,%eax
80102547:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
    return 0;
8010254c:	31 c0                	xor    %eax,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
8010254e:	5d                   	pop    %ebp
8010254f:	c3                   	ret    
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
80102550:	f6 c1 40             	test   $0x40,%cl
80102553:	74 09                	je     8010255e <kbdgetc+0x5e>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102555:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
80102558:	83 e1 bf             	and    $0xffffffbf,%ecx
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
8010255b:	0f b6 d0             	movzbl %al,%edx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
8010255e:	0f b6 82 60 74 10 80 	movzbl -0x7fef8ba0(%edx),%eax
80102565:	09 c1                	or     %eax,%ecx
80102567:	0f b6 82 60 73 10 80 	movzbl -0x7fef8ca0(%edx),%eax
8010256e:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
80102570:	89 c8                	mov    %ecx,%eax
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
80102572:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
  c = charcode[shift & (CTL | SHIFT)][data];
80102578:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
8010257b:	83 e1 08             	and    $0x8,%ecx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
8010257e:	8b 04 85 40 73 10 80 	mov    -0x7fef8cc0(,%eax,4),%eax
80102585:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
80102589:	74 c3                	je     8010254e <kbdgetc+0x4e>
    if('a' <= c && c <= 'z')
8010258b:	8d 50 9f             	lea    -0x61(%eax),%edx
8010258e:	83 fa 19             	cmp    $0x19,%edx
80102591:	77 1d                	ja     801025b0 <kbdgetc+0xb0>
      c += 'A' - 'a';
80102593:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102596:	5d                   	pop    %ebp
80102597:	c3                   	ret    
80102598:	90                   	nop
80102599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
801025a0:	31 c0                	xor    %eax,%eax
  if((st & KBS_DIB) == 0)
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
801025a2:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025a9:	5d                   	pop    %ebp
801025aa:	c3                   	ret    
801025ab:	90                   	nop
801025ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
801025b0:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
801025b3:	8d 50 20             	lea    0x20(%eax),%edx
  }
  return c;
}
801025b6:	5d                   	pop    %ebp
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
801025b7:	83 f9 19             	cmp    $0x19,%ecx
801025ba:	0f 46 c2             	cmovbe %edx,%eax
  }
  return c;
}
801025bd:	c3                   	ret    
801025be:	66 90                	xchg   %ax,%ax
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
    return -1;
801025c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025c5:	5d                   	pop    %ebp
801025c6:	c3                   	ret    
801025c7:	89 f6                	mov    %esi,%esi
801025c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025d0 <kbdintr>:

void
kbdintr(void)
{
801025d0:	55                   	push   %ebp
801025d1:	89 e5                	mov    %esp,%ebp
801025d3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
801025d6:	68 00 25 10 80       	push   $0x80102500
801025db:	e8 10 e2 ff ff       	call   801007f0 <consoleintr>
}
801025e0:	83 c4 10             	add    $0x10,%esp
801025e3:	c9                   	leave  
801025e4:	c3                   	ret    
801025e5:	66 90                	xchg   %ax,%ax
801025e7:	66 90                	xchg   %ax,%ax
801025e9:	66 90                	xchg   %ax,%ax
801025eb:	66 90                	xchg   %ax,%ax
801025ed:	66 90                	xchg   %ax,%ax
801025ef:	90                   	nop

801025f0 <lapicinit>:
}

void
lapicinit(void)
{
  if(!lapic)
801025f0:	a1 7c 26 11 80       	mov    0x8011267c,%eax
  lapic[ID];  // wait for write to finish, by reading
}

void
lapicinit(void)
{
801025f5:	55                   	push   %ebp
801025f6:	89 e5                	mov    %esp,%ebp
  if(!lapic)
801025f8:	85 c0                	test   %eax,%eax
801025fa:	0f 84 c8 00 00 00    	je     801026c8 <lapicinit+0xd8>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102600:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102607:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010260a:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010260d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102614:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102617:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010261a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102621:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
80102624:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102627:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010262e:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
80102631:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102634:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010263b:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010263e:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102641:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102648:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010264b:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
8010264e:	8b 50 30             	mov    0x30(%eax),%edx
80102651:	c1 ea 10             	shr    $0x10,%edx
80102654:	80 fa 03             	cmp    $0x3,%dl
80102657:	77 77                	ja     801026d0 <lapicinit+0xe0>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102659:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102660:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102663:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102666:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010266d:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102670:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102673:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010267a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010267d:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102680:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102687:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010268a:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010268d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102694:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102697:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010269a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026a1:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
801026a4:	8b 50 20             	mov    0x20(%eax),%edx
801026a7:	89 f6                	mov    %esi,%esi
801026a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
801026b0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026b6:	80 e6 10             	and    $0x10,%dh
801026b9:	75 f5                	jne    801026b0 <lapicinit+0xc0>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026bb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026c2:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026c5:	8b 40 20             	mov    0x20(%eax),%eax
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
801026c8:	5d                   	pop    %ebp
801026c9:	c3                   	ret    
801026ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026d0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026d7:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026da:	8b 50 20             	mov    0x20(%eax),%edx
801026dd:	e9 77 ff ff ff       	jmp    80102659 <lapicinit+0x69>
801026e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801026f0 <lapicid>:
}

int
lapicid(void)
{
  if (!lapic)
801026f0:	a1 7c 26 11 80       	mov    0x8011267c,%eax
  lapicw(TPR, 0);
}

int
lapicid(void)
{
801026f5:	55                   	push   %ebp
801026f6:	89 e5                	mov    %esp,%ebp
  if (!lapic)
801026f8:	85 c0                	test   %eax,%eax
801026fa:	74 0c                	je     80102708 <lapicid+0x18>
    return 0;
  return lapic[ID] >> 24;
801026fc:	8b 40 20             	mov    0x20(%eax),%eax
}
801026ff:	5d                   	pop    %ebp
int
lapicid(void)
{
  if (!lapic)
    return 0;
  return lapic[ID] >> 24;
80102700:	c1 e8 18             	shr    $0x18,%eax
}
80102703:	c3                   	ret    
80102704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

int
lapicid(void)
{
  if (!lapic)
    return 0;
80102708:	31 c0                	xor    %eax,%eax
  return lapic[ID] >> 24;
}
8010270a:	5d                   	pop    %ebp
8010270b:	c3                   	ret    
8010270c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102710 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102710:	a1 7c 26 11 80       	mov    0x8011267c,%eax
}

// Acknowledge interrupt.
void
lapiceoi(void)
{
80102715:	55                   	push   %ebp
80102716:	89 e5                	mov    %esp,%ebp
  if(lapic)
80102718:	85 c0                	test   %eax,%eax
8010271a:	74 0d                	je     80102729 <lapiceoi+0x19>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010271c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102723:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102726:	8b 40 20             	mov    0x20(%eax),%eax
void
lapiceoi(void)
{
  if(lapic)
    lapicw(EOI, 0);
}
80102729:	5d                   	pop    %ebp
8010272a:	c3                   	ret    
8010272b:	90                   	nop
8010272c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102730 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
80102730:	55                   	push   %ebp
80102731:	89 e5                	mov    %esp,%ebp
}
80102733:	5d                   	pop    %ebp
80102734:	c3                   	ret    
80102735:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102740 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102740:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102741:	ba 70 00 00 00       	mov    $0x70,%edx
80102746:	b8 0f 00 00 00       	mov    $0xf,%eax
8010274b:	89 e5                	mov    %esp,%ebp
8010274d:	53                   	push   %ebx
8010274e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102751:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102754:	ee                   	out    %al,(%dx)
80102755:	ba 71 00 00 00       	mov    $0x71,%edx
8010275a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010275f:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102760:	31 c0                	xor    %eax,%eax

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102762:	c1 e3 18             	shl    $0x18,%ebx
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102765:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
8010276b:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
8010276d:	c1 e9 0c             	shr    $0xc,%ecx
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102770:	c1 e8 04             	shr    $0x4,%eax

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102773:	89 da                	mov    %ebx,%edx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102775:	80 cd 06             	or     $0x6,%ch
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102778:	66 a3 69 04 00 80    	mov    %ax,0x80000469

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010277e:	a1 7c 26 11 80       	mov    0x8011267c,%eax
80102783:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102789:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010278c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102793:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102796:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102799:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027a0:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027a3:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027a6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027ac:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027af:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027b5:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027b8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027be:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027c1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027c7:	8b 40 20             	mov    0x20(%eax),%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
801027ca:	5b                   	pop    %ebx
801027cb:	5d                   	pop    %ebp
801027cc:	c3                   	ret    
801027cd:	8d 76 00             	lea    0x0(%esi),%esi

801027d0 <cmostime>:
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void
cmostime(struct rtcdate *r)
{
801027d0:	55                   	push   %ebp
801027d1:	ba 70 00 00 00       	mov    $0x70,%edx
801027d6:	b8 0b 00 00 00       	mov    $0xb,%eax
801027db:	89 e5                	mov    %esp,%ebp
801027dd:	57                   	push   %edi
801027de:	56                   	push   %esi
801027df:	53                   	push   %ebx
801027e0:	83 ec 4c             	sub    $0x4c,%esp
801027e3:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801027e4:	ba 71 00 00 00       	mov    $0x71,%edx
801027e9:	ec                   	in     (%dx),%al
801027ea:	83 e0 04             	and    $0x4,%eax
801027ed:	8d 75 d0             	lea    -0x30(%ebp),%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801027f0:	31 db                	xor    %ebx,%ebx
801027f2:	88 45 b7             	mov    %al,-0x49(%ebp)
801027f5:	bf 70 00 00 00       	mov    $0x70,%edi
801027fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102800:	89 d8                	mov    %ebx,%eax
80102802:	89 fa                	mov    %edi,%edx
80102804:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102805:	b9 71 00 00 00       	mov    $0x71,%ecx
8010280a:	89 ca                	mov    %ecx,%edx
8010280c:	ec                   	in     (%dx),%al
}

static void
fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
8010280d:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102810:	89 fa                	mov    %edi,%edx
80102812:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102815:	b8 02 00 00 00       	mov    $0x2,%eax
8010281a:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010281b:	89 ca                	mov    %ecx,%edx
8010281d:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
8010281e:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102821:	89 fa                	mov    %edi,%edx
80102823:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102826:	b8 04 00 00 00       	mov    $0x4,%eax
8010282b:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010282c:	89 ca                	mov    %ecx,%edx
8010282e:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
8010282f:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102832:	89 fa                	mov    %edi,%edx
80102834:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102837:	b8 07 00 00 00       	mov    $0x7,%eax
8010283c:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010283d:	89 ca                	mov    %ecx,%edx
8010283f:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
80102840:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102843:	89 fa                	mov    %edi,%edx
80102845:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102848:	b8 08 00 00 00       	mov    $0x8,%eax
8010284d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010284e:	89 ca                	mov    %ecx,%edx
80102850:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
80102851:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102854:	89 fa                	mov    %edi,%edx
80102856:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102859:	b8 09 00 00 00       	mov    $0x9,%eax
8010285e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010285f:	89 ca                	mov    %ecx,%edx
80102861:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
80102862:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102865:	89 fa                	mov    %edi,%edx
80102867:	89 45 cc             	mov    %eax,-0x34(%ebp)
8010286a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010286f:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102870:	89 ca                	mov    %ecx,%edx
80102872:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102873:	84 c0                	test   %al,%al
80102875:	78 89                	js     80102800 <cmostime+0x30>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102877:	89 d8                	mov    %ebx,%eax
80102879:	89 fa                	mov    %edi,%edx
8010287b:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010287c:	89 ca                	mov    %ecx,%edx
8010287e:	ec                   	in     (%dx),%al
}

static void
fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
8010287f:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102882:	89 fa                	mov    %edi,%edx
80102884:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102887:	b8 02 00 00 00       	mov    $0x2,%eax
8010288c:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010288d:	89 ca                	mov    %ecx,%edx
8010288f:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
80102890:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102893:	89 fa                	mov    %edi,%edx
80102895:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102898:	b8 04 00 00 00       	mov    $0x4,%eax
8010289d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010289e:	89 ca                	mov    %ecx,%edx
801028a0:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
801028a1:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028a4:	89 fa                	mov    %edi,%edx
801028a6:	89 45 d8             	mov    %eax,-0x28(%ebp)
801028a9:	b8 07 00 00 00       	mov    $0x7,%eax
801028ae:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028af:	89 ca                	mov    %ecx,%edx
801028b1:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
801028b2:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028b5:	89 fa                	mov    %edi,%edx
801028b7:	89 45 dc             	mov    %eax,-0x24(%ebp)
801028ba:	b8 08 00 00 00       	mov    $0x8,%eax
801028bf:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028c0:	89 ca                	mov    %ecx,%edx
801028c2:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
801028c3:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028c6:	89 fa                	mov    %edi,%edx
801028c8:	89 45 e0             	mov    %eax,-0x20(%ebp)
801028cb:	b8 09 00 00 00       	mov    $0x9,%eax
801028d0:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028d1:	89 ca                	mov    %ecx,%edx
801028d3:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
801028d4:	0f b6 c0             	movzbl %al,%eax
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
801028d7:	83 ec 04             	sub    $0x4,%esp
  r->second = cmos_read(SECS);
  r->minute = cmos_read(MINS);
  r->hour   = cmos_read(HOURS);
  r->day    = cmos_read(DAY);
  r->month  = cmos_read(MONTH);
  r->year   = cmos_read(YEAR);
801028da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
801028dd:	8d 45 b8             	lea    -0x48(%ebp),%eax
801028e0:	6a 18                	push   $0x18
801028e2:	56                   	push   %esi
801028e3:	50                   	push   %eax
801028e4:	e8 a7 1c 00 00       	call   80104590 <memcmp>
801028e9:	83 c4 10             	add    $0x10,%esp
801028ec:	85 c0                	test   %eax,%eax
801028ee:	0f 85 0c ff ff ff    	jne    80102800 <cmostime+0x30>
      break;
  }

  // convert
  if(bcd) {
801028f4:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
801028f8:	75 78                	jne    80102972 <cmostime+0x1a2>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
801028fa:	8b 45 b8             	mov    -0x48(%ebp),%eax
801028fd:	89 c2                	mov    %eax,%edx
801028ff:	83 e0 0f             	and    $0xf,%eax
80102902:	c1 ea 04             	shr    $0x4,%edx
80102905:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102908:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010290b:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
8010290e:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102911:	89 c2                	mov    %eax,%edx
80102913:	83 e0 0f             	and    $0xf,%eax
80102916:	c1 ea 04             	shr    $0x4,%edx
80102919:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010291c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010291f:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
80102922:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102925:	89 c2                	mov    %eax,%edx
80102927:	83 e0 0f             	and    $0xf,%eax
8010292a:	c1 ea 04             	shr    $0x4,%edx
8010292d:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102930:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102933:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102936:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102939:	89 c2                	mov    %eax,%edx
8010293b:	83 e0 0f             	and    $0xf,%eax
8010293e:	c1 ea 04             	shr    $0x4,%edx
80102941:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102944:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102947:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
8010294a:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010294d:	89 c2                	mov    %eax,%edx
8010294f:	83 e0 0f             	and    $0xf,%eax
80102952:	c1 ea 04             	shr    $0x4,%edx
80102955:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102958:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010295b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
8010295e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102961:	89 c2                	mov    %eax,%edx
80102963:	83 e0 0f             	and    $0xf,%eax
80102966:	c1 ea 04             	shr    $0x4,%edx
80102969:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010296c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010296f:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
80102972:	8b 75 08             	mov    0x8(%ebp),%esi
80102975:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102978:	89 06                	mov    %eax,(%esi)
8010297a:	8b 45 bc             	mov    -0x44(%ebp),%eax
8010297d:	89 46 04             	mov    %eax,0x4(%esi)
80102980:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102983:	89 46 08             	mov    %eax,0x8(%esi)
80102986:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102989:	89 46 0c             	mov    %eax,0xc(%esi)
8010298c:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010298f:	89 46 10             	mov    %eax,0x10(%esi)
80102992:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102995:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
80102998:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
8010299f:	8d 65 f4             	lea    -0xc(%ebp),%esp
801029a2:	5b                   	pop    %ebx
801029a3:	5e                   	pop    %esi
801029a4:	5f                   	pop    %edi
801029a5:	5d                   	pop    %ebp
801029a6:	c3                   	ret    
801029a7:	66 90                	xchg   %ax,%ax
801029a9:	66 90                	xchg   %ax,%ax
801029ab:	66 90                	xchg   %ax,%ax
801029ad:	66 90                	xchg   %ax,%ax
801029af:	90                   	nop

801029b0 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
801029b0:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
801029b6:	85 c9                	test   %ecx,%ecx
801029b8:	0f 8e 85 00 00 00    	jle    80102a43 <install_trans+0x93>
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
801029be:	55                   	push   %ebp
801029bf:	89 e5                	mov    %esp,%ebp
801029c1:	57                   	push   %edi
801029c2:	56                   	push   %esi
801029c3:	53                   	push   %ebx
801029c4:	31 db                	xor    %ebx,%ebx
801029c6:	83 ec 0c             	sub    $0xc,%esp
801029c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
801029d0:	a1 b4 26 11 80       	mov    0x801126b4,%eax
801029d5:	83 ec 08             	sub    $0x8,%esp
801029d8:	01 d8                	add    %ebx,%eax
801029da:	83 c0 01             	add    $0x1,%eax
801029dd:	50                   	push   %eax
801029de:	ff 35 c4 26 11 80    	pushl  0x801126c4
801029e4:	e8 e7 d6 ff ff       	call   801000d0 <bread>
801029e9:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
801029eb:	58                   	pop    %eax
801029ec:	5a                   	pop    %edx
801029ed:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
801029f4:	ff 35 c4 26 11 80    	pushl  0x801126c4
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
801029fa:	83 c3 01             	add    $0x1,%ebx
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
801029fd:	e8 ce d6 ff ff       	call   801000d0 <bread>
80102a02:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102a04:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a07:	83 c4 0c             	add    $0xc,%esp
80102a0a:	68 00 02 00 00       	push   $0x200
80102a0f:	50                   	push   %eax
80102a10:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a13:	50                   	push   %eax
80102a14:	e8 d7 1b 00 00       	call   801045f0 <memmove>
    bwrite(dbuf);  // write dst to disk
80102a19:	89 34 24             	mov    %esi,(%esp)
80102a1c:	e8 7f d7 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102a21:	89 3c 24             	mov    %edi,(%esp)
80102a24:	e8 b7 d7 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102a29:	89 34 24             	mov    %esi,(%esp)
80102a2c:	e8 af d7 ff ff       	call   801001e0 <brelse>
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a31:	83 c4 10             	add    $0x10,%esp
80102a34:	39 1d c8 26 11 80    	cmp    %ebx,0x801126c8
80102a3a:	7f 94                	jg     801029d0 <install_trans+0x20>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
    brelse(lbuf);
    brelse(dbuf);
  }
}
80102a3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a3f:	5b                   	pop    %ebx
80102a40:	5e                   	pop    %esi
80102a41:	5f                   	pop    %edi
80102a42:	5d                   	pop    %ebp
80102a43:	f3 c3                	repz ret 
80102a45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a50 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102a50:	55                   	push   %ebp
80102a51:	89 e5                	mov    %esp,%ebp
80102a53:	53                   	push   %ebx
80102a54:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
80102a57:	ff 35 b4 26 11 80    	pushl  0x801126b4
80102a5d:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102a63:	e8 68 d6 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a68:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
  for (i = 0; i < log.lh.n; i++) {
80102a6e:	83 c4 10             	add    $0x10,%esp
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102a71:	89 c3                	mov    %eax,%ebx
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102a73:	85 c9                	test   %ecx,%ecx
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a75:	89 48 5c             	mov    %ecx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102a78:	7e 1f                	jle    80102a99 <write_head+0x49>
80102a7a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102a81:	31 d2                	xor    %edx,%edx
80102a83:	90                   	nop
80102a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102a88:	8b 8a cc 26 11 80    	mov    -0x7feed934(%edx),%ecx
80102a8e:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102a92:	83 c2 04             	add    $0x4,%edx
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102a95:	39 c2                	cmp    %eax,%edx
80102a97:	75 ef                	jne    80102a88 <write_head+0x38>
    hb->block[i] = log.lh.block[i];
  }
  bwrite(buf);
80102a99:	83 ec 0c             	sub    $0xc,%esp
80102a9c:	53                   	push   %ebx
80102a9d:	e8 fe d6 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102aa2:	89 1c 24             	mov    %ebx,(%esp)
80102aa5:	e8 36 d7 ff ff       	call   801001e0 <brelse>
}
80102aaa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102aad:	c9                   	leave  
80102aae:	c3                   	ret    
80102aaf:	90                   	nop

80102ab0 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
80102ab0:	55                   	push   %ebp
80102ab1:	89 e5                	mov    %esp,%ebp
80102ab3:	53                   	push   %ebx
80102ab4:	83 ec 2c             	sub    $0x2c,%esp
80102ab7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
80102aba:	68 60 75 10 80       	push   $0x80107560
80102abf:	68 80 26 11 80       	push   $0x80112680
80102ac4:	e8 17 18 00 00       	call   801042e0 <initlock>
  readsb(dev, &sb);
80102ac9:	58                   	pop    %eax
80102aca:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102acd:	5a                   	pop    %edx
80102ace:	50                   	push   %eax
80102acf:	53                   	push   %ebx
80102ad0:	e8 db e8 ff ff       	call   801013b0 <readsb>
  log.start = sb.logstart;
  log.size = sb.nlog;
80102ad5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102ad8:	8b 45 ec             	mov    -0x14(%ebp),%eax

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102adb:	59                   	pop    %ecx
  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
80102adc:	89 1d c4 26 11 80    	mov    %ebx,0x801126c4

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
80102ae2:	89 15 b8 26 11 80    	mov    %edx,0x801126b8
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102ae8:	a3 b4 26 11 80       	mov    %eax,0x801126b4

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102aed:	5a                   	pop    %edx
80102aee:	50                   	push   %eax
80102aef:	53                   	push   %ebx
80102af0:	e8 db d5 ff ff       	call   801000d0 <bread>
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102af5:	8b 48 5c             	mov    0x5c(%eax),%ecx
  for (i = 0; i < log.lh.n; i++) {
80102af8:	83 c4 10             	add    $0x10,%esp
80102afb:	85 c9                	test   %ecx,%ecx
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102afd:	89 0d c8 26 11 80    	mov    %ecx,0x801126c8
  for (i = 0; i < log.lh.n; i++) {
80102b03:	7e 1c                	jle    80102b21 <initlog+0x71>
80102b05:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102b0c:	31 d2                	xor    %edx,%edx
80102b0e:	66 90                	xchg   %ax,%ax
    log.lh.block[i] = lh->block[i];
80102b10:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b14:	83 c2 04             	add    $0x4,%edx
80102b17:	89 8a c8 26 11 80    	mov    %ecx,-0x7feed938(%edx)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102b1d:	39 da                	cmp    %ebx,%edx
80102b1f:	75 ef                	jne    80102b10 <initlog+0x60>
    log.lh.block[i] = lh->block[i];
  }
  brelse(buf);
80102b21:	83 ec 0c             	sub    $0xc,%esp
80102b24:	50                   	push   %eax
80102b25:	e8 b6 d6 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102b2a:	e8 81 fe ff ff       	call   801029b0 <install_trans>
  log.lh.n = 0;
80102b2f:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102b36:	00 00 00 
  write_head(); // clear the log
80102b39:	e8 12 ff ff ff       	call   80102a50 <write_head>
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
  recover_from_log();
}
80102b3e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b41:	c9                   	leave  
80102b42:	c3                   	ret    
80102b43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b50 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102b50:	55                   	push   %ebp
80102b51:	89 e5                	mov    %esp,%ebp
80102b53:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102b56:	68 80 26 11 80       	push   $0x80112680
80102b5b:	e8 e0 18 00 00       	call   80104440 <acquire>
80102b60:	83 c4 10             	add    $0x10,%esp
80102b63:	eb 18                	jmp    80102b7d <begin_op+0x2d>
80102b65:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102b68:	83 ec 08             	sub    $0x8,%esp
80102b6b:	68 80 26 11 80       	push   $0x80112680
80102b70:	68 80 26 11 80       	push   $0x80112680
80102b75:	e8 b6 11 00 00       	call   80103d30 <sleep>
80102b7a:	83 c4 10             	add    $0x10,%esp
void
begin_op(void)
{
  acquire(&log.lock);
  while(1){
    if(log.committing){
80102b7d:	a1 c0 26 11 80       	mov    0x801126c0,%eax
80102b82:	85 c0                	test   %eax,%eax
80102b84:	75 e2                	jne    80102b68 <begin_op+0x18>
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102b86:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102b8b:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102b91:	83 c0 01             	add    $0x1,%eax
80102b94:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102b97:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102b9a:	83 fa 1e             	cmp    $0x1e,%edx
80102b9d:	7f c9                	jg     80102b68 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102b9f:	83 ec 0c             	sub    $0xc,%esp
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
80102ba2:	a3 bc 26 11 80       	mov    %eax,0x801126bc
      release(&log.lock);
80102ba7:	68 80 26 11 80       	push   $0x80112680
80102bac:	e8 3f 19 00 00       	call   801044f0 <release>
      break;
    }
  }
}
80102bb1:	83 c4 10             	add    $0x10,%esp
80102bb4:	c9                   	leave  
80102bb5:	c3                   	ret    
80102bb6:	8d 76 00             	lea    0x0(%esi),%esi
80102bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bc0 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102bc0:	55                   	push   %ebp
80102bc1:	89 e5                	mov    %esp,%ebp
80102bc3:	57                   	push   %edi
80102bc4:	56                   	push   %esi
80102bc5:	53                   	push   %ebx
80102bc6:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102bc9:	68 80 26 11 80       	push   $0x80112680
80102bce:	e8 6d 18 00 00       	call   80104440 <acquire>
  log.outstanding -= 1;
80102bd3:	a1 bc 26 11 80       	mov    0x801126bc,%eax
  if(log.committing)
80102bd8:	8b 1d c0 26 11 80    	mov    0x801126c0,%ebx
80102bde:	83 c4 10             	add    $0x10,%esp
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102be1:	83 e8 01             	sub    $0x1,%eax
  if(log.committing)
80102be4:	85 db                	test   %ebx,%ebx
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102be6:	a3 bc 26 11 80       	mov    %eax,0x801126bc
  if(log.committing)
80102beb:	0f 85 23 01 00 00    	jne    80102d14 <end_op+0x154>
    panic("log.committing");
  if(log.outstanding == 0){
80102bf1:	85 c0                	test   %eax,%eax
80102bf3:	0f 85 f7 00 00 00    	jne    80102cf0 <end_op+0x130>
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102bf9:	83 ec 0c             	sub    $0xc,%esp
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
80102bfc:	c7 05 c0 26 11 80 01 	movl   $0x1,0x801126c0
80102c03:	00 00 00 
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c06:	31 db                	xor    %ebx,%ebx
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102c08:	68 80 26 11 80       	push   $0x80112680
80102c0d:	e8 de 18 00 00       	call   801044f0 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c12:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102c18:	83 c4 10             	add    $0x10,%esp
80102c1b:	85 c9                	test   %ecx,%ecx
80102c1d:	0f 8e 8a 00 00 00    	jle    80102cad <end_op+0xed>
80102c23:	90                   	nop
80102c24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102c28:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102c2d:	83 ec 08             	sub    $0x8,%esp
80102c30:	01 d8                	add    %ebx,%eax
80102c32:	83 c0 01             	add    $0x1,%eax
80102c35:	50                   	push   %eax
80102c36:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102c3c:	e8 8f d4 ff ff       	call   801000d0 <bread>
80102c41:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c43:	58                   	pop    %eax
80102c44:	5a                   	pop    %edx
80102c45:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102c4c:	ff 35 c4 26 11 80    	pushl  0x801126c4
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c52:	83 c3 01             	add    $0x1,%ebx
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c55:	e8 76 d4 ff ff       	call   801000d0 <bread>
80102c5a:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102c5c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c5f:	83 c4 0c             	add    $0xc,%esp
80102c62:	68 00 02 00 00       	push   $0x200
80102c67:	50                   	push   %eax
80102c68:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c6b:	50                   	push   %eax
80102c6c:	e8 7f 19 00 00       	call   801045f0 <memmove>
    bwrite(to);  // write the log
80102c71:	89 34 24             	mov    %esi,(%esp)
80102c74:	e8 27 d5 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102c79:	89 3c 24             	mov    %edi,(%esp)
80102c7c:	e8 5f d5 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102c81:	89 34 24             	mov    %esi,(%esp)
80102c84:	e8 57 d5 ff ff       	call   801001e0 <brelse>
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c89:	83 c4 10             	add    $0x10,%esp
80102c8c:	3b 1d c8 26 11 80    	cmp    0x801126c8,%ebx
80102c92:	7c 94                	jl     80102c28 <end_op+0x68>
static void
commit()
{
  if (log.lh.n > 0) {
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102c94:	e8 b7 fd ff ff       	call   80102a50 <write_head>
    install_trans(); // Now install writes to home locations
80102c99:	e8 12 fd ff ff       	call   801029b0 <install_trans>
    log.lh.n = 0;
80102c9e:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102ca5:	00 00 00 
    write_head();    // Erase the transaction from the log
80102ca8:	e8 a3 fd ff ff       	call   80102a50 <write_head>

  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
80102cad:	83 ec 0c             	sub    $0xc,%esp
80102cb0:	68 80 26 11 80       	push   $0x80112680
80102cb5:	e8 86 17 00 00       	call   80104440 <acquire>
    log.committing = 0;
    wakeup(&log);
80102cba:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
    log.committing = 0;
80102cc1:	c7 05 c0 26 11 80 00 	movl   $0x0,0x801126c0
80102cc8:	00 00 00 
    wakeup(&log);
80102ccb:	e8 10 12 00 00       	call   80103ee0 <wakeup>
    release(&log.lock);
80102cd0:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102cd7:	e8 14 18 00 00       	call   801044f0 <release>
80102cdc:	83 c4 10             	add    $0x10,%esp
  }
}
80102cdf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ce2:	5b                   	pop    %ebx
80102ce3:	5e                   	pop    %esi
80102ce4:	5f                   	pop    %edi
80102ce5:	5d                   	pop    %ebp
80102ce6:	c3                   	ret    
80102ce7:	89 f6                	mov    %esi,%esi
80102ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
80102cf0:	83 ec 0c             	sub    $0xc,%esp
80102cf3:	68 80 26 11 80       	push   $0x80112680
80102cf8:	e8 e3 11 00 00       	call   80103ee0 <wakeup>
  }
  release(&log.lock);
80102cfd:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102d04:	e8 e7 17 00 00       	call   801044f0 <release>
80102d09:	83 c4 10             	add    $0x10,%esp
    acquire(&log.lock);
    log.committing = 0;
    wakeup(&log);
    release(&log.lock);
  }
}
80102d0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d0f:	5b                   	pop    %ebx
80102d10:	5e                   	pop    %esi
80102d11:	5f                   	pop    %edi
80102d12:	5d                   	pop    %ebp
80102d13:	c3                   	ret    
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
80102d14:	83 ec 0c             	sub    $0xc,%esp
80102d17:	68 64 75 10 80       	push   $0x80107564
80102d1c:	e8 4f d6 ff ff       	call   80100370 <panic>
80102d21:	eb 0d                	jmp    80102d30 <log_write>
80102d23:	90                   	nop
80102d24:	90                   	nop
80102d25:	90                   	nop
80102d26:	90                   	nop
80102d27:	90                   	nop
80102d28:	90                   	nop
80102d29:	90                   	nop
80102d2a:	90                   	nop
80102d2b:	90                   	nop
80102d2c:	90                   	nop
80102d2d:	90                   	nop
80102d2e:	90                   	nop
80102d2f:	90                   	nop

80102d30 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d30:	55                   	push   %ebp
80102d31:	89 e5                	mov    %esp,%ebp
80102d33:	53                   	push   %ebx
80102d34:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d37:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d3d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d40:	83 fa 1d             	cmp    $0x1d,%edx
80102d43:	0f 8f 97 00 00 00    	jg     80102de0 <log_write+0xb0>
80102d49:	a1 b8 26 11 80       	mov    0x801126b8,%eax
80102d4e:	83 e8 01             	sub    $0x1,%eax
80102d51:	39 c2                	cmp    %eax,%edx
80102d53:	0f 8d 87 00 00 00    	jge    80102de0 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102d59:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102d5e:	85 c0                	test   %eax,%eax
80102d60:	0f 8e 87 00 00 00    	jle    80102ded <log_write+0xbd>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102d66:	83 ec 0c             	sub    $0xc,%esp
80102d69:	68 80 26 11 80       	push   $0x80112680
80102d6e:	e8 cd 16 00 00       	call   80104440 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102d73:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102d79:	83 c4 10             	add    $0x10,%esp
80102d7c:	83 fa 00             	cmp    $0x0,%edx
80102d7f:	7e 50                	jle    80102dd1 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102d81:	8b 4b 08             	mov    0x8(%ebx),%ecx
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102d84:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102d86:	3b 0d cc 26 11 80    	cmp    0x801126cc,%ecx
80102d8c:	75 0b                	jne    80102d99 <log_write+0x69>
80102d8e:	eb 38                	jmp    80102dc8 <log_write+0x98>
80102d90:	39 0c 85 cc 26 11 80 	cmp    %ecx,-0x7feed934(,%eax,4)
80102d97:	74 2f                	je     80102dc8 <log_write+0x98>
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102d99:	83 c0 01             	add    $0x1,%eax
80102d9c:	39 d0                	cmp    %edx,%eax
80102d9e:	75 f0                	jne    80102d90 <log_write+0x60>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102da0:	89 0c 95 cc 26 11 80 	mov    %ecx,-0x7feed934(,%edx,4)
  if (i == log.lh.n)
    log.lh.n++;
80102da7:	83 c2 01             	add    $0x1,%edx
80102daa:	89 15 c8 26 11 80    	mov    %edx,0x801126c8
  b->flags |= B_DIRTY; // prevent eviction
80102db0:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102db3:	c7 45 08 80 26 11 80 	movl   $0x80112680,0x8(%ebp)
}
80102dba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102dbd:	c9                   	leave  
  }
  log.lh.block[i] = b->blockno;
  if (i == log.lh.n)
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
  release(&log.lock);
80102dbe:	e9 2d 17 00 00       	jmp    801044f0 <release>
80102dc3:	90                   	nop
80102dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102dc8:	89 0c 85 cc 26 11 80 	mov    %ecx,-0x7feed934(,%eax,4)
80102dcf:	eb df                	jmp    80102db0 <log_write+0x80>
80102dd1:	8b 43 08             	mov    0x8(%ebx),%eax
80102dd4:	a3 cc 26 11 80       	mov    %eax,0x801126cc
  if (i == log.lh.n)
80102dd9:	75 d5                	jne    80102db0 <log_write+0x80>
80102ddb:	eb ca                	jmp    80102da7 <log_write+0x77>
80102ddd:	8d 76 00             	lea    0x0(%esi),%esi
log_write(struct buf *b)
{
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    panic("too big a transaction");
80102de0:	83 ec 0c             	sub    $0xc,%esp
80102de3:	68 73 75 10 80       	push   $0x80107573
80102de8:	e8 83 d5 ff ff       	call   80100370 <panic>
  if (log.outstanding < 1)
    panic("log_write outside of trans");
80102ded:	83 ec 0c             	sub    $0xc,%esp
80102df0:	68 89 75 10 80       	push   $0x80107589
80102df5:	e8 76 d5 ff ff       	call   80100370 <panic>
80102dfa:	66 90                	xchg   %ax,%ax
80102dfc:	66 90                	xchg   %ax,%ax
80102dfe:	66 90                	xchg   %ax,%ax

80102e00 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102e00:	55                   	push   %ebp
80102e01:	89 e5                	mov    %esp,%ebp
80102e03:	53                   	push   %ebx
80102e04:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102e07:	e8 54 09 00 00       	call   80103760 <cpuid>
80102e0c:	89 c3                	mov    %eax,%ebx
80102e0e:	e8 4d 09 00 00       	call   80103760 <cpuid>
80102e13:	83 ec 04             	sub    $0x4,%esp
80102e16:	53                   	push   %ebx
80102e17:	50                   	push   %eax
80102e18:	68 a4 75 10 80       	push   $0x801075a4
80102e1d:	e8 3e d8 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102e22:	e8 e9 29 00 00       	call   80105810 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102e27:	e8 b4 08 00 00       	call   801036e0 <mycpu>
80102e2c:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102e2e:	b8 01 00 00 00       	mov    $0x1,%eax
80102e33:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102e3a:	e8 01 0c 00 00       	call   80103a40 <scheduler>
80102e3f:	90                   	nop

80102e40 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80102e40:	55                   	push   %ebp
80102e41:	89 e5                	mov    %esp,%ebp
80102e43:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102e46:	e8 e5 3a 00 00       	call   80106930 <switchkvm>
  seginit();
80102e4b:	e8 e0 39 00 00       	call   80106830 <seginit>
  lapicinit();
80102e50:	e8 9b f7 ff ff       	call   801025f0 <lapicinit>
  mpmain();
80102e55:	e8 a6 ff ff ff       	call   80102e00 <mpmain>
80102e5a:	66 90                	xchg   %ax,%ax
80102e5c:	66 90                	xchg   %ax,%ax
80102e5e:	66 90                	xchg   %ax,%ax

80102e60 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80102e60:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102e64:	83 e4 f0             	and    $0xfffffff0,%esp
80102e67:	ff 71 fc             	pushl  -0x4(%ecx)
80102e6a:	55                   	push   %ebp
80102e6b:	89 e5                	mov    %esp,%ebp
80102e6d:	53                   	push   %ebx
80102e6e:	51                   	push   %ecx
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102e6f:	bb 80 27 11 80       	mov    $0x80112780,%ebx
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102e74:	83 ec 08             	sub    $0x8,%esp
80102e77:	68 00 00 40 80       	push   $0x80400000
80102e7c:	68 a8 54 11 80       	push   $0x801154a8
80102e81:	e8 3a f5 ff ff       	call   801023c0 <kinit1>
  kvmalloc();      // kernel page table
80102e86:	e8 45 3f 00 00       	call   80106dd0 <kvmalloc>
  mpinit();        // detect other processors
80102e8b:	e8 70 01 00 00       	call   80103000 <mpinit>
  lapicinit();     // interrupt controller
80102e90:	e8 5b f7 ff ff       	call   801025f0 <lapicinit>
  seginit();       // segment descriptors
80102e95:	e8 96 39 00 00       	call   80106830 <seginit>
  picinit();       // disable pic
80102e9a:	e8 31 03 00 00       	call   801031d0 <picinit>
  ioapicinit();    // another interrupt controller
80102e9f:	e8 4c f3 ff ff       	call   801021f0 <ioapicinit>
  consoleinit();   // console hardware
80102ea4:	e8 f7 da ff ff       	call   801009a0 <consoleinit>
  uartinit();      // serial port
80102ea9:	e8 52 2c 00 00       	call   80105b00 <uartinit>
  pinit();         // process table
80102eae:	e8 0d 08 00 00       	call   801036c0 <pinit>
  tvinit();        // trap vectors
80102eb3:	e8 b8 28 00 00       	call   80105770 <tvinit>
  binit();         // buffer cache
80102eb8:	e8 83 d1 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102ebd:	e8 8e de ff ff       	call   80100d50 <fileinit>
  ideinit();       // disk 
80102ec2:	e8 09 f1 ff ff       	call   80101fd0 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102ec7:	83 c4 0c             	add    $0xc,%esp
80102eca:	68 8a 00 00 00       	push   $0x8a
80102ecf:	68 8c a4 10 80       	push   $0x8010a48c
80102ed4:	68 00 70 00 80       	push   $0x80007000
80102ed9:	e8 12 17 00 00       	call   801045f0 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102ede:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102ee5:	00 00 00 
80102ee8:	83 c4 10             	add    $0x10,%esp
80102eeb:	05 80 27 11 80       	add    $0x80112780,%eax
80102ef0:	39 d8                	cmp    %ebx,%eax
80102ef2:	76 6f                	jbe    80102f63 <main+0x103>
80102ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(c == mycpu())  // We've started already.
80102ef8:	e8 e3 07 00 00       	call   801036e0 <mycpu>
80102efd:	39 d8                	cmp    %ebx,%eax
80102eff:	74 49                	je     80102f4a <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102f01:	e8 8a f5 ff ff       	call   80102490 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f06:	05 00 10 00 00       	add    $0x1000,%eax
    *(void(**)(void))(code-8) = mpenter;
80102f0b:	c7 05 f8 6f 00 80 40 	movl   $0x80102e40,0x80006ff8
80102f12:	2e 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102f15:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f1c:	90 10 00 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f1f:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void(**)(void))(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80102f24:	0f b6 03             	movzbl (%ebx),%eax
80102f27:	83 ec 08             	sub    $0x8,%esp
80102f2a:	68 00 70 00 00       	push   $0x7000
80102f2f:	50                   	push   %eax
80102f30:	e8 0b f8 ff ff       	call   80102740 <lapicstartap>
80102f35:	83 c4 10             	add    $0x10,%esp
80102f38:	90                   	nop
80102f39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102f40:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f46:	85 c0                	test   %eax,%eax
80102f48:	74 f6                	je     80102f40 <main+0xe0>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102f4a:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102f51:	00 00 00 
80102f54:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f5a:	05 80 27 11 80       	add    $0x80112780,%eax
80102f5f:	39 c3                	cmp    %eax,%ebx
80102f61:	72 95                	jb     80102ef8 <main+0x98>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk 
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102f63:	83 ec 08             	sub    $0x8,%esp
80102f66:	68 00 00 00 8e       	push   $0x8e000000
80102f6b:	68 00 00 40 80       	push   $0x80400000
80102f70:	e8 bb f4 ff ff       	call   80102430 <kinit2>
  userinit();      // first user process
80102f75:	e8 36 08 00 00       	call   801037b0 <userinit>
  mpmain();        // finish this processor's setup
80102f7a:	e8 81 fe ff ff       	call   80102e00 <mpmain>
80102f7f:	90                   	nop

80102f80 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f80:	55                   	push   %ebp
80102f81:	89 e5                	mov    %esp,%ebp
80102f83:	57                   	push   %edi
80102f84:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80102f85:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f8b:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
80102f8c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f8f:	83 ec 0c             	sub    $0xc,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102f92:	39 de                	cmp    %ebx,%esi
80102f94:	73 48                	jae    80102fde <mpsearch1+0x5e>
80102f96:	8d 76 00             	lea    0x0(%esi),%esi
80102f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fa0:	83 ec 04             	sub    $0x4,%esp
80102fa3:	8d 7e 10             	lea    0x10(%esi),%edi
80102fa6:	6a 04                	push   $0x4
80102fa8:	68 b8 75 10 80       	push   $0x801075b8
80102fad:	56                   	push   %esi
80102fae:	e8 dd 15 00 00       	call   80104590 <memcmp>
80102fb3:	83 c4 10             	add    $0x10,%esp
80102fb6:	85 c0                	test   %eax,%eax
80102fb8:	75 1e                	jne    80102fd8 <mpsearch1+0x58>
80102fba:	8d 7e 10             	lea    0x10(%esi),%edi
80102fbd:	89 f2                	mov    %esi,%edx
80102fbf:	31 c9                	xor    %ecx,%ecx
80102fc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
80102fc8:	0f b6 02             	movzbl (%edx),%eax
80102fcb:	83 c2 01             	add    $0x1,%edx
80102fce:	01 c1                	add    %eax,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80102fd0:	39 fa                	cmp    %edi,%edx
80102fd2:	75 f4                	jne    80102fc8 <mpsearch1+0x48>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fd4:	84 c9                	test   %cl,%cl
80102fd6:	74 10                	je     80102fe8 <mpsearch1+0x68>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102fd8:	39 fb                	cmp    %edi,%ebx
80102fda:	89 fe                	mov    %edi,%esi
80102fdc:	77 c2                	ja     80102fa0 <mpsearch1+0x20>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
80102fde:	8d 65 f4             	lea    -0xc(%ebp),%esp
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
80102fe1:	31 c0                	xor    %eax,%eax
}
80102fe3:	5b                   	pop    %ebx
80102fe4:	5e                   	pop    %esi
80102fe5:	5f                   	pop    %edi
80102fe6:	5d                   	pop    %ebp
80102fe7:	c3                   	ret    
80102fe8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102feb:	89 f0                	mov    %esi,%eax
80102fed:	5b                   	pop    %ebx
80102fee:	5e                   	pop    %esi
80102fef:	5f                   	pop    %edi
80102ff0:	5d                   	pop    %ebp
80102ff1:	c3                   	ret    
80102ff2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103000 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103000:	55                   	push   %ebp
80103001:	89 e5                	mov    %esp,%ebp
80103003:	57                   	push   %edi
80103004:	56                   	push   %esi
80103005:	53                   	push   %ebx
80103006:	83 ec 1c             	sub    $0x1c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103009:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103010:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103017:	c1 e0 08             	shl    $0x8,%eax
8010301a:	09 d0                	or     %edx,%eax
8010301c:	c1 e0 04             	shl    $0x4,%eax
8010301f:	85 c0                	test   %eax,%eax
80103021:	75 1b                	jne    8010303e <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
80103023:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010302a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103031:	c1 e0 08             	shl    $0x8,%eax
80103034:	09 d0                	or     %edx,%eax
80103036:	c1 e0 0a             	shl    $0xa,%eax
80103039:	2d 00 04 00 00       	sub    $0x400,%eax
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
    if((mp = mpsearch1(p, 1024)))
8010303e:	ba 00 04 00 00       	mov    $0x400,%edx
80103043:	e8 38 ff ff ff       	call   80102f80 <mpsearch1>
80103048:	85 c0                	test   %eax,%eax
8010304a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010304d:	0f 84 37 01 00 00    	je     8010318a <mpinit+0x18a>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103053:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103056:	8b 58 04             	mov    0x4(%eax),%ebx
80103059:	85 db                	test   %ebx,%ebx
8010305b:	0f 84 43 01 00 00    	je     801031a4 <mpinit+0x1a4>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103061:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
  if(memcmp(conf, "PCMP", 4) != 0)
80103067:	83 ec 04             	sub    $0x4,%esp
8010306a:	6a 04                	push   $0x4
8010306c:	68 bd 75 10 80       	push   $0x801075bd
80103071:	56                   	push   %esi
80103072:	e8 19 15 00 00       	call   80104590 <memcmp>
80103077:	83 c4 10             	add    $0x10,%esp
8010307a:	85 c0                	test   %eax,%eax
8010307c:	0f 85 22 01 00 00    	jne    801031a4 <mpinit+0x1a4>
    return 0;
  if(conf->version != 1 && conf->version != 4)
80103082:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103089:	3c 01                	cmp    $0x1,%al
8010308b:	74 08                	je     80103095 <mpinit+0x95>
8010308d:	3c 04                	cmp    $0x4,%al
8010308f:	0f 85 0f 01 00 00    	jne    801031a4 <mpinit+0x1a4>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80103095:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
8010309c:	85 ff                	test   %edi,%edi
8010309e:	74 21                	je     801030c1 <mpinit+0xc1>
801030a0:	31 d2                	xor    %edx,%edx
801030a2:	31 c0                	xor    %eax,%eax
801030a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
801030a8:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
801030af:	80 
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030b0:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
801030b3:	01 ca                	add    %ecx,%edx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030b5:	39 c7                	cmp    %eax,%edi
801030b7:	75 ef                	jne    801030a8 <mpinit+0xa8>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801030b9:	84 d2                	test   %dl,%dl
801030bb:	0f 85 e3 00 00 00    	jne    801031a4 <mpinit+0x1a4>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
801030c1:	85 f6                	test   %esi,%esi
801030c3:	0f 84 db 00 00 00    	je     801031a4 <mpinit+0x1a4>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
801030c9:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801030cf:	a3 7c 26 11 80       	mov    %eax,0x8011267c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030d4:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801030db:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
801030e1:	bb 01 00 00 00       	mov    $0x1,%ebx
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030e6:	01 d6                	add    %edx,%esi
801030e8:	90                   	nop
801030e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801030f0:	39 c6                	cmp    %eax,%esi
801030f2:	76 23                	jbe    80103117 <mpinit+0x117>
801030f4:	0f b6 10             	movzbl (%eax),%edx
    switch(*p){
801030f7:	80 fa 04             	cmp    $0x4,%dl
801030fa:	0f 87 c0 00 00 00    	ja     801031c0 <mpinit+0x1c0>
80103100:	ff 24 95 fc 75 10 80 	jmp    *-0x7fef8a04(,%edx,4)
80103107:	89 f6                	mov    %esi,%esi
80103109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103110:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103113:	39 c6                	cmp    %eax,%esi
80103115:	77 dd                	ja     801030f4 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
80103117:	85 db                	test   %ebx,%ebx
80103119:	0f 84 92 00 00 00    	je     801031b1 <mpinit+0x1b1>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
8010311f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103122:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103126:	74 15                	je     8010313d <mpinit+0x13d>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103128:	ba 22 00 00 00       	mov    $0x22,%edx
8010312d:	b8 70 00 00 00       	mov    $0x70,%eax
80103132:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103133:	ba 23 00 00 00       	mov    $0x23,%edx
80103138:	ec                   	in     (%dx),%al
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103139:	83 c8 01             	or     $0x1,%eax
8010313c:	ee                   	out    %al,(%dx)
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
8010313d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103140:	5b                   	pop    %ebx
80103141:	5e                   	pop    %esi
80103142:	5f                   	pop    %edi
80103143:	5d                   	pop    %ebp
80103144:	c3                   	ret    
80103145:	8d 76 00             	lea    0x0(%esi),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
80103148:	8b 0d 00 2d 11 80    	mov    0x80112d00,%ecx
8010314e:	83 f9 07             	cmp    $0x7,%ecx
80103151:	7f 19                	jg     8010316c <mpinit+0x16c>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103153:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103157:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
        ncpu++;
8010315d:	83 c1 01             	add    $0x1,%ecx
80103160:	89 0d 00 2d 11 80    	mov    %ecx,0x80112d00
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103166:	88 97 80 27 11 80    	mov    %dl,-0x7feed880(%edi)
        ncpu++;
      }
      p += sizeof(struct mpproc);
8010316c:	83 c0 14             	add    $0x14,%eax
      continue;
8010316f:	e9 7c ff ff ff       	jmp    801030f0 <mpinit+0xf0>
80103174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103178:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
8010317c:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
8010317f:	88 15 60 27 11 80    	mov    %dl,0x80112760
      p += sizeof(struct mpioapic);
      continue;
80103185:	e9 66 ff ff ff       	jmp    801030f0 <mpinit+0xf0>
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
8010318a:	ba 00 00 01 00       	mov    $0x10000,%edx
8010318f:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103194:	e8 e7 fd ff ff       	call   80102f80 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103199:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
8010319b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
8010319e:	0f 85 af fe ff ff    	jne    80103053 <mpinit+0x53>
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
801031a4:	83 ec 0c             	sub    $0xc,%esp
801031a7:	68 c2 75 10 80       	push   $0x801075c2
801031ac:	e8 bf d1 ff ff       	call   80100370 <panic>
      ismp = 0;
      break;
    }
  }
  if(!ismp)
    panic("Didn't find a suitable machine");
801031b1:	83 ec 0c             	sub    $0xc,%esp
801031b4:	68 dc 75 10 80       	push   $0x801075dc
801031b9:	e8 b2 d1 ff ff       	call   80100370 <panic>
801031be:	66 90                	xchg   %ax,%ax
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
801031c0:	31 db                	xor    %ebx,%ebx
801031c2:	e9 30 ff ff ff       	jmp    801030f7 <mpinit+0xf7>
801031c7:	66 90                	xchg   %ax,%ax
801031c9:	66 90                	xchg   %ax,%ax
801031cb:	66 90                	xchg   %ax,%ax
801031cd:	66 90                	xchg   %ax,%ax
801031cf:	90                   	nop

801031d0 <picinit>:
#define IO_PIC2         0xA0    // Slave (IRQs 8-15)

// Don't use the 8259A interrupt controllers.  Xv6 assumes SMP hardware.
void
picinit(void)
{
801031d0:	55                   	push   %ebp
801031d1:	ba 21 00 00 00       	mov    $0x21,%edx
801031d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801031db:	89 e5                	mov    %esp,%ebp
801031dd:	ee                   	out    %al,(%dx)
801031de:	ba a1 00 00 00       	mov    $0xa1,%edx
801031e3:	ee                   	out    %al,(%dx)
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
801031e4:	5d                   	pop    %ebp
801031e5:	c3                   	ret    
801031e6:	66 90                	xchg   %ax,%ax
801031e8:	66 90                	xchg   %ax,%ax
801031ea:	66 90                	xchg   %ax,%ax
801031ec:	66 90                	xchg   %ax,%ax
801031ee:	66 90                	xchg   %ax,%ax

801031f0 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
801031f0:	55                   	push   %ebp
801031f1:	89 e5                	mov    %esp,%ebp
801031f3:	57                   	push   %edi
801031f4:	56                   	push   %esi
801031f5:	53                   	push   %ebx
801031f6:	83 ec 0c             	sub    $0xc,%esp
801031f9:	8b 75 08             	mov    0x8(%ebp),%esi
801031fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
801031ff:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103205:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010320b:	e8 60 db ff ff       	call   80100d70 <filealloc>
80103210:	85 c0                	test   %eax,%eax
80103212:	89 06                	mov    %eax,(%esi)
80103214:	0f 84 a8 00 00 00    	je     801032c2 <pipealloc+0xd2>
8010321a:	e8 51 db ff ff       	call   80100d70 <filealloc>
8010321f:	85 c0                	test   %eax,%eax
80103221:	89 03                	mov    %eax,(%ebx)
80103223:	0f 84 87 00 00 00    	je     801032b0 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103229:	e8 62 f2 ff ff       	call   80102490 <kalloc>
8010322e:	85 c0                	test   %eax,%eax
80103230:	89 c7                	mov    %eax,%edi
80103232:	0f 84 b0 00 00 00    	je     801032e8 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
80103238:	83 ec 08             	sub    $0x8,%esp
  *f0 = *f1 = 0;
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
    goto bad;
  p->readopen = 1;
8010323b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103242:	00 00 00 
  p->writeopen = 1;
80103245:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010324c:	00 00 00 
  p->nwrite = 0;
8010324f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103256:	00 00 00 
  p->nread = 0;
80103259:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103260:	00 00 00 
  initlock(&p->lock, "pipe");
80103263:	68 10 76 10 80       	push   $0x80107610
80103268:	50                   	push   %eax
80103269:	e8 72 10 00 00       	call   801042e0 <initlock>
  (*f0)->type = FD_PIPE;
8010326e:	8b 06                	mov    (%esi),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103270:	83 c4 10             	add    $0x10,%esp
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
  (*f0)->type = FD_PIPE;
80103273:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103279:	8b 06                	mov    (%esi),%eax
8010327b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010327f:	8b 06                	mov    (%esi),%eax
80103281:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103285:	8b 06                	mov    (%esi),%eax
80103287:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
8010328a:	8b 03                	mov    (%ebx),%eax
8010328c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80103292:	8b 03                	mov    (%ebx),%eax
80103294:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103298:	8b 03                	mov    (%ebx),%eax
8010329a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
8010329e:	8b 03                	mov    (%ebx),%eax
801032a0:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801032a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
801032a6:	31 c0                	xor    %eax,%eax
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801032a8:	5b                   	pop    %ebx
801032a9:	5e                   	pop    %esi
801032aa:	5f                   	pop    %edi
801032ab:	5d                   	pop    %ebp
801032ac:	c3                   	ret    
801032ad:	8d 76 00             	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801032b0:	8b 06                	mov    (%esi),%eax
801032b2:	85 c0                	test   %eax,%eax
801032b4:	74 1e                	je     801032d4 <pipealloc+0xe4>
    fileclose(*f0);
801032b6:	83 ec 0c             	sub    $0xc,%esp
801032b9:	50                   	push   %eax
801032ba:	e8 71 db ff ff       	call   80100e30 <fileclose>
801032bf:	83 c4 10             	add    $0x10,%esp
  if(*f1)
801032c2:	8b 03                	mov    (%ebx),%eax
801032c4:	85 c0                	test   %eax,%eax
801032c6:	74 0c                	je     801032d4 <pipealloc+0xe4>
    fileclose(*f1);
801032c8:	83 ec 0c             	sub    $0xc,%esp
801032cb:	50                   	push   %eax
801032cc:	e8 5f db ff ff       	call   80100e30 <fileclose>
801032d1:	83 c4 10             	add    $0x10,%esp
  return -1;
}
801032d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
801032d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801032dc:	5b                   	pop    %ebx
801032dd:	5e                   	pop    %esi
801032de:	5f                   	pop    %edi
801032df:	5d                   	pop    %ebp
801032e0:	c3                   	ret    
801032e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801032e8:	8b 06                	mov    (%esi),%eax
801032ea:	85 c0                	test   %eax,%eax
801032ec:	75 c8                	jne    801032b6 <pipealloc+0xc6>
801032ee:	eb d2                	jmp    801032c2 <pipealloc+0xd2>

801032f0 <pipeclose>:
  return -1;
}

void
pipeclose(struct pipe *p, int writable)
{
801032f0:	55                   	push   %ebp
801032f1:	89 e5                	mov    %esp,%ebp
801032f3:	56                   	push   %esi
801032f4:	53                   	push   %ebx
801032f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801032f8:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
801032fb:	83 ec 0c             	sub    $0xc,%esp
801032fe:	53                   	push   %ebx
801032ff:	e8 3c 11 00 00       	call   80104440 <acquire>
  if(writable){
80103304:	83 c4 10             	add    $0x10,%esp
80103307:	85 f6                	test   %esi,%esi
80103309:	74 45                	je     80103350 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
8010330b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103311:	83 ec 0c             	sub    $0xc,%esp
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
80103314:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010331b:	00 00 00 
    wakeup(&p->nread);
8010331e:	50                   	push   %eax
8010331f:	e8 bc 0b 00 00       	call   80103ee0 <wakeup>
80103324:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103327:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010332d:	85 d2                	test   %edx,%edx
8010332f:	75 0a                	jne    8010333b <pipeclose+0x4b>
80103331:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103337:	85 c0                	test   %eax,%eax
80103339:	74 35                	je     80103370 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010333b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010333e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103341:	5b                   	pop    %ebx
80103342:	5e                   	pop    %esi
80103343:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80103344:	e9 a7 11 00 00       	jmp    801044f0 <release>
80103349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
80103350:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103356:	83 ec 0c             	sub    $0xc,%esp
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
80103359:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103360:	00 00 00 
    wakeup(&p->nwrite);
80103363:	50                   	push   %eax
80103364:	e8 77 0b 00 00       	call   80103ee0 <wakeup>
80103369:	83 c4 10             	add    $0x10,%esp
8010336c:	eb b9                	jmp    80103327 <pipeclose+0x37>
8010336e:	66 90                	xchg   %ax,%ax
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
80103370:	83 ec 0c             	sub    $0xc,%esp
80103373:	53                   	push   %ebx
80103374:	e8 77 11 00 00       	call   801044f0 <release>
    kfree((char*)p);
80103379:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010337c:	83 c4 10             	add    $0x10,%esp
  } else
    release(&p->lock);
}
8010337f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103382:	5b                   	pop    %ebx
80103383:	5e                   	pop    %esi
80103384:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
80103385:	e9 56 ef ff ff       	jmp    801022e0 <kfree>
8010338a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103390 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103390:	55                   	push   %ebp
80103391:	89 e5                	mov    %esp,%ebp
80103393:	57                   	push   %edi
80103394:	56                   	push   %esi
80103395:	53                   	push   %ebx
80103396:	83 ec 28             	sub    $0x28,%esp
80103399:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
8010339c:	53                   	push   %ebx
8010339d:	e8 9e 10 00 00       	call   80104440 <acquire>
  for(i = 0; i < n; i++){
801033a2:	8b 45 10             	mov    0x10(%ebp),%eax
801033a5:	83 c4 10             	add    $0x10,%esp
801033a8:	85 c0                	test   %eax,%eax
801033aa:	0f 8e b9 00 00 00    	jle    80103469 <pipewrite+0xd9>
801033b0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801033b3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801033b9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801033bf:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
801033c5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801033c8:	03 4d 10             	add    0x10(%ebp),%ecx
801033cb:	89 4d e0             	mov    %ecx,-0x20(%ebp)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801033ce:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
801033d4:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
801033da:	39 d0                	cmp    %edx,%eax
801033dc:	74 38                	je     80103416 <pipewrite+0x86>
801033de:	eb 59                	jmp    80103439 <pipewrite+0xa9>
      if(p->readopen == 0 || myproc()->killed){
801033e0:	e8 9b 03 00 00       	call   80103780 <myproc>
801033e5:	8b 48 24             	mov    0x24(%eax),%ecx
801033e8:	85 c9                	test   %ecx,%ecx
801033ea:	75 34                	jne    80103420 <pipewrite+0x90>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801033ec:	83 ec 0c             	sub    $0xc,%esp
801033ef:	57                   	push   %edi
801033f0:	e8 eb 0a 00 00       	call   80103ee0 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801033f5:	58                   	pop    %eax
801033f6:	5a                   	pop    %edx
801033f7:	53                   	push   %ebx
801033f8:	56                   	push   %esi
801033f9:	e8 32 09 00 00       	call   80103d30 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801033fe:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103404:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010340a:	83 c4 10             	add    $0x10,%esp
8010340d:	05 00 02 00 00       	add    $0x200,%eax
80103412:	39 c2                	cmp    %eax,%edx
80103414:	75 2a                	jne    80103440 <pipewrite+0xb0>
      if(p->readopen == 0 || myproc()->killed){
80103416:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010341c:	85 c0                	test   %eax,%eax
8010341e:	75 c0                	jne    801033e0 <pipewrite+0x50>
        release(&p->lock);
80103420:	83 ec 0c             	sub    $0xc,%esp
80103423:	53                   	push   %ebx
80103424:	e8 c7 10 00 00       	call   801044f0 <release>
        return -1;
80103429:	83 c4 10             	add    $0x10,%esp
8010342c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103431:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103434:	5b                   	pop    %ebx
80103435:	5e                   	pop    %esi
80103436:	5f                   	pop    %edi
80103437:	5d                   	pop    %ebp
80103438:	c3                   	ret    
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103439:	89 c2                	mov    %eax,%edx
8010343b:	90                   	nop
8010343c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103440:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103443:	8d 42 01             	lea    0x1(%edx),%eax
80103446:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
8010344a:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103450:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103456:	0f b6 09             	movzbl (%ecx),%ecx
80103459:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
8010345d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
80103460:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
80103463:	0f 85 65 ff ff ff    	jne    801033ce <pipewrite+0x3e>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103469:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010346f:	83 ec 0c             	sub    $0xc,%esp
80103472:	50                   	push   %eax
80103473:	e8 68 0a 00 00       	call   80103ee0 <wakeup>
  release(&p->lock);
80103478:	89 1c 24             	mov    %ebx,(%esp)
8010347b:	e8 70 10 00 00       	call   801044f0 <release>
  return n;
80103480:	83 c4 10             	add    $0x10,%esp
80103483:	8b 45 10             	mov    0x10(%ebp),%eax
80103486:	eb a9                	jmp    80103431 <pipewrite+0xa1>
80103488:	90                   	nop
80103489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103490 <piperead>:
}

int
piperead(struct pipe *p, char *addr, int n)
{
80103490:	55                   	push   %ebp
80103491:	89 e5                	mov    %esp,%ebp
80103493:	57                   	push   %edi
80103494:	56                   	push   %esi
80103495:	53                   	push   %ebx
80103496:	83 ec 18             	sub    $0x18,%esp
80103499:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010349c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010349f:	53                   	push   %ebx
801034a0:	e8 9b 0f 00 00       	call   80104440 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801034a5:	83 c4 10             	add    $0x10,%esp
801034a8:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801034ae:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
801034b4:	75 6a                	jne    80103520 <piperead+0x90>
801034b6:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
801034bc:	85 f6                	test   %esi,%esi
801034be:	0f 84 cc 00 00 00    	je     80103590 <piperead+0x100>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801034c4:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801034ca:	eb 2d                	jmp    801034f9 <piperead+0x69>
801034cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801034d0:	83 ec 08             	sub    $0x8,%esp
801034d3:	53                   	push   %ebx
801034d4:	56                   	push   %esi
801034d5:	e8 56 08 00 00       	call   80103d30 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801034da:	83 c4 10             	add    $0x10,%esp
801034dd:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801034e3:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
801034e9:	75 35                	jne    80103520 <piperead+0x90>
801034eb:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
801034f1:	85 d2                	test   %edx,%edx
801034f3:	0f 84 97 00 00 00    	je     80103590 <piperead+0x100>
    if(myproc()->killed){
801034f9:	e8 82 02 00 00       	call   80103780 <myproc>
801034fe:	8b 48 24             	mov    0x24(%eax),%ecx
80103501:	85 c9                	test   %ecx,%ecx
80103503:	74 cb                	je     801034d0 <piperead+0x40>
      release(&p->lock);
80103505:	83 ec 0c             	sub    $0xc,%esp
80103508:	53                   	push   %ebx
80103509:	e8 e2 0f 00 00       	call   801044f0 <release>
      return -1;
8010350e:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103511:	8d 65 f4             	lea    -0xc(%ebp),%esp

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(myproc()->killed){
      release(&p->lock);
      return -1;
80103514:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103519:	5b                   	pop    %ebx
8010351a:	5e                   	pop    %esi
8010351b:	5f                   	pop    %edi
8010351c:	5d                   	pop    %ebp
8010351d:	c3                   	ret    
8010351e:	66 90                	xchg   %ax,%ax
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103520:	8b 45 10             	mov    0x10(%ebp),%eax
80103523:	85 c0                	test   %eax,%eax
80103525:	7e 69                	jle    80103590 <piperead+0x100>
    if(p->nread == p->nwrite)
80103527:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010352d:	31 c9                	xor    %ecx,%ecx
8010352f:	eb 15                	jmp    80103546 <piperead+0xb6>
80103531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103538:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010353e:	3b 83 38 02 00 00    	cmp    0x238(%ebx),%eax
80103544:	74 5a                	je     801035a0 <piperead+0x110>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103546:	8d 70 01             	lea    0x1(%eax),%esi
80103549:	25 ff 01 00 00       	and    $0x1ff,%eax
8010354e:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80103554:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80103559:	88 04 0f             	mov    %al,(%edi,%ecx,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
8010355c:	83 c1 01             	add    $0x1,%ecx
8010355f:	39 4d 10             	cmp    %ecx,0x10(%ebp)
80103562:	75 d4                	jne    80103538 <piperead+0xa8>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80103564:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
8010356a:	83 ec 0c             	sub    $0xc,%esp
8010356d:	50                   	push   %eax
8010356e:	e8 6d 09 00 00       	call   80103ee0 <wakeup>
  release(&p->lock);
80103573:	89 1c 24             	mov    %ebx,(%esp)
80103576:	e8 75 0f 00 00       	call   801044f0 <release>
  return i;
8010357b:	8b 45 10             	mov    0x10(%ebp),%eax
8010357e:	83 c4 10             	add    $0x10,%esp
}
80103581:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103584:	5b                   	pop    %ebx
80103585:	5e                   	pop    %esi
80103586:	5f                   	pop    %edi
80103587:	5d                   	pop    %ebp
80103588:	c3                   	ret    
80103589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103590:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
80103597:	eb cb                	jmp    80103564 <piperead+0xd4>
80103599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801035a0:	89 4d 10             	mov    %ecx,0x10(%ebp)
801035a3:	eb bf                	jmp    80103564 <piperead+0xd4>
801035a5:	66 90                	xchg   %ax,%ax
801035a7:	66 90                	xchg   %ax,%ax
801035a9:	66 90                	xchg   %ax,%ax
801035ab:	66 90                	xchg   %ax,%ax
801035ad:	66 90                	xchg   %ax,%ax
801035af:	90                   	nop

801035b0 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801035b0:	55                   	push   %ebp
801035b1:	89 e5                	mov    %esp,%ebp
801035b3:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035b4:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801035b9:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
801035bc:	68 20 2d 11 80       	push   $0x80112d20
801035c1:	e8 7a 0e 00 00       	call   80104440 <acquire>
801035c6:	83 c4 10             	add    $0x10,%esp
801035c9:	eb 10                	jmp    801035db <allocproc+0x2b>
801035cb:	90                   	nop
801035cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035d0:	83 c3 7c             	add    $0x7c,%ebx
801035d3:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
801035d9:	74 75                	je     80103650 <allocproc+0xa0>
    if(p->state == UNUSED)
801035db:	8b 43 0c             	mov    0xc(%ebx),%eax
801035de:	85 c0                	test   %eax,%eax
801035e0:	75 ee                	jne    801035d0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801035e2:	a1 04 a0 10 80       	mov    0x8010a004,%eax

  release(&ptable.lock);
801035e7:	83 ec 0c             	sub    $0xc,%esp

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
801035ea:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;

  release(&ptable.lock);
801035f1:	68 20 2d 11 80       	push   $0x80112d20
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801035f6:	8d 50 01             	lea    0x1(%eax),%edx
801035f9:	89 43 10             	mov    %eax,0x10(%ebx)
801035fc:	89 15 04 a0 10 80    	mov    %edx,0x8010a004

  release(&ptable.lock);
80103602:	e8 e9 0e 00 00       	call   801044f0 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80103607:	e8 84 ee ff ff       	call   80102490 <kalloc>
8010360c:	83 c4 10             	add    $0x10,%esp
8010360f:	85 c0                	test   %eax,%eax
80103611:	89 43 08             	mov    %eax,0x8(%ebx)
80103614:	74 51                	je     80103667 <allocproc+0xb7>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103616:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010361c:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
8010361f:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103624:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
80103627:	c7 40 14 61 57 10 80 	movl   $0x80105761,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010362e:	6a 14                	push   $0x14
80103630:	6a 00                	push   $0x0
80103632:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
80103633:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103636:	e8 05 0f 00 00       	call   80104540 <memset>
  p->context->eip = (uint)forkret;
8010363b:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
8010363e:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
80103641:	c7 40 10 70 36 10 80 	movl   $0x80103670,0x10(%eax)

  return p;
80103648:	89 d8                	mov    %ebx,%eax
}
8010364a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010364d:	c9                   	leave  
8010364e:	c3                   	ret    
8010364f:	90                   	nop

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
80103650:	83 ec 0c             	sub    $0xc,%esp
80103653:	68 20 2d 11 80       	push   $0x80112d20
80103658:	e8 93 0e 00 00       	call   801044f0 <release>
  return 0;
8010365d:	83 c4 10             	add    $0x10,%esp
80103660:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
80103662:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103665:	c9                   	leave  
80103666:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
80103667:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
8010366e:	eb da                	jmp    8010364a <allocproc+0x9a>

80103670 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103670:	55                   	push   %ebp
80103671:	89 e5                	mov    %esp,%ebp
80103673:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103676:	68 20 2d 11 80       	push   $0x80112d20
8010367b:	e8 70 0e 00 00       	call   801044f0 <release>

  if (first) {
80103680:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103685:	83 c4 10             	add    $0x10,%esp
80103688:	85 c0                	test   %eax,%eax
8010368a:	75 04                	jne    80103690 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010368c:	c9                   	leave  
8010368d:	c3                   	ret    
8010368e:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
80103690:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
80103693:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
8010369a:	00 00 00 
    iinit(ROOTDEV);
8010369d:	6a 01                	push   $0x1
8010369f:	e8 cc dd ff ff       	call   80101470 <iinit>
    initlog(ROOTDEV);
801036a4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801036ab:	e8 00 f4 ff ff       	call   80102ab0 <initlog>
801036b0:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
801036b3:	c9                   	leave  
801036b4:	c3                   	ret    
801036b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801036c0 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
801036c0:	55                   	push   %ebp
801036c1:	89 e5                	mov    %esp,%ebp
801036c3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801036c6:	68 15 76 10 80       	push   $0x80107615
801036cb:	68 20 2d 11 80       	push   $0x80112d20
801036d0:	e8 0b 0c 00 00       	call   801042e0 <initlock>
}
801036d5:	83 c4 10             	add    $0x10,%esp
801036d8:	c9                   	leave  
801036d9:	c3                   	ret    
801036da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801036e0 <mycpu>:

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
801036e0:	55                   	push   %ebp
801036e1:	89 e5                	mov    %esp,%ebp
801036e3:	56                   	push   %esi
801036e4:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801036e5:	9c                   	pushf  
801036e6:	58                   	pop    %eax
  int apicid, i;
  
  if(readeflags()&FL_IF)
801036e7:	f6 c4 02             	test   $0x2,%ah
801036ea:	75 5b                	jne    80103747 <mycpu+0x67>
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
801036ec:	e8 ff ef ff ff       	call   801026f0 <lapicid>
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
801036f1:	8b 35 00 2d 11 80    	mov    0x80112d00,%esi
801036f7:	85 f6                	test   %esi,%esi
801036f9:	7e 3f                	jle    8010373a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
801036fb:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
80103702:	39 d0                	cmp    %edx,%eax
80103704:	74 30                	je     80103736 <mycpu+0x56>
80103706:	b9 30 28 11 80       	mov    $0x80112830,%ecx
8010370b:	31 d2                	xor    %edx,%edx
8010370d:	8d 76 00             	lea    0x0(%esi),%esi
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103710:	83 c2 01             	add    $0x1,%edx
80103713:	39 f2                	cmp    %esi,%edx
80103715:	74 23                	je     8010373a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
80103717:	0f b6 19             	movzbl (%ecx),%ebx
8010371a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103720:	39 d8                	cmp    %ebx,%eax
80103722:	75 ec                	jne    80103710 <mycpu+0x30>
      return &cpus[i];
80103724:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
  }
  panic("unknown apicid\n");
}
8010372a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010372d:	5b                   	pop    %ebx
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
8010372e:	05 80 27 11 80       	add    $0x80112780,%eax
  }
  panic("unknown apicid\n");
}
80103733:	5e                   	pop    %esi
80103734:	5d                   	pop    %ebp
80103735:	c3                   	ret    
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103736:	31 d2                	xor    %edx,%edx
80103738:	eb ea                	jmp    80103724 <mycpu+0x44>
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
8010373a:	83 ec 0c             	sub    $0xc,%esp
8010373d:	68 1c 76 10 80       	push   $0x8010761c
80103742:	e8 29 cc ff ff       	call   80100370 <panic>
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
80103747:	83 ec 0c             	sub    $0xc,%esp
8010374a:	68 4c 77 10 80       	push   $0x8010774c
8010374f:	e8 1c cc ff ff       	call   80100370 <panic>
80103754:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010375a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103760 <cpuid>:
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
80103760:	55                   	push   %ebp
80103761:	89 e5                	mov    %esp,%ebp
80103763:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103766:	e8 75 ff ff ff       	call   801036e0 <mycpu>
8010376b:	2d 80 27 11 80       	sub    $0x80112780,%eax
}
80103770:	c9                   	leave  
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
80103771:	c1 f8 04             	sar    $0x4,%eax
80103774:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010377a:	c3                   	ret    
8010377b:	90                   	nop
8010377c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103780 <myproc>:
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
80103780:	55                   	push   %ebp
80103781:	89 e5                	mov    %esp,%ebp
80103783:	53                   	push   %ebx
80103784:	83 ec 04             	sub    $0x4,%esp
  struct cpu *c;
  struct proc *p;
  pushcli();
80103787:	e8 d4 0b 00 00       	call   80104360 <pushcli>
  c = mycpu();
8010378c:	e8 4f ff ff ff       	call   801036e0 <mycpu>
  p = c->proc;
80103791:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103797:	e8 04 0c 00 00       	call   801043a0 <popcli>
  return p;
}
8010379c:	83 c4 04             	add    $0x4,%esp
8010379f:	89 d8                	mov    %ebx,%eax
801037a1:	5b                   	pop    %ebx
801037a2:	5d                   	pop    %ebp
801037a3:	c3                   	ret    
801037a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037b0 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
801037b0:	55                   	push   %ebp
801037b1:	89 e5                	mov    %esp,%ebp
801037b3:	53                   	push   %ebx
801037b4:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
801037b7:	e8 f4 fd ff ff       	call   801035b0 <allocproc>
801037bc:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
801037be:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
  if((p->pgdir = setupkvm()) == 0)
801037c3:	e8 88 35 00 00       	call   80106d50 <setupkvm>
801037c8:	85 c0                	test   %eax,%eax
801037ca:	89 43 04             	mov    %eax,0x4(%ebx)
801037cd:	0f 84 bd 00 00 00    	je     80103890 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801037d3:	83 ec 04             	sub    $0x4,%esp
801037d6:	68 2c 00 00 00       	push   $0x2c
801037db:	68 60 a4 10 80       	push   $0x8010a460
801037e0:	50                   	push   %eax
801037e1:	e8 7a 32 00 00       	call   80106a60 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
801037e6:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
801037e9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
801037ef:	6a 4c                	push   $0x4c
801037f1:	6a 00                	push   $0x0
801037f3:	ff 73 18             	pushl  0x18(%ebx)
801037f6:	e8 45 0d 00 00       	call   80104540 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801037fb:	8b 43 18             	mov    0x18(%ebx),%eax
801037fe:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103803:	b9 23 00 00 00       	mov    $0x23,%ecx
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103808:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010380b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010380f:	8b 43 18             	mov    0x18(%ebx),%eax
80103812:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103816:	8b 43 18             	mov    0x18(%ebx),%eax
80103819:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010381d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103821:	8b 43 18             	mov    0x18(%ebx),%eax
80103824:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103828:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010382c:	8b 43 18             	mov    0x18(%ebx),%eax
8010382f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103836:	8b 43 18             	mov    0x18(%ebx),%eax
80103839:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103840:	8b 43 18             	mov    0x18(%ebx),%eax
80103843:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
8010384a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010384d:	6a 10                	push   $0x10
8010384f:	68 45 76 10 80       	push   $0x80107645
80103854:	50                   	push   %eax
80103855:	e8 e6 0e 00 00       	call   80104740 <safestrcpy>
  p->cwd = namei("/");
8010385a:	c7 04 24 4e 76 10 80 	movl   $0x8010764e,(%esp)
80103861:	e8 5a e6 ff ff       	call   80101ec0 <namei>
80103866:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
80103869:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103870:	e8 cb 0b 00 00       	call   80104440 <acquire>

  p->state = RUNNABLE;
80103875:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
8010387c:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103883:	e8 68 0c 00 00       	call   801044f0 <release>
}
80103888:	83 c4 10             	add    $0x10,%esp
8010388b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010388e:	c9                   	leave  
8010388f:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
80103890:	83 ec 0c             	sub    $0xc,%esp
80103893:	68 2c 76 10 80       	push   $0x8010762c
80103898:	e8 d3 ca ff ff       	call   80100370 <panic>
8010389d:	8d 76 00             	lea    0x0(%esi),%esi

801038a0 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
801038a0:	55                   	push   %ebp
801038a1:	89 e5                	mov    %esp,%ebp
801038a3:	56                   	push   %esi
801038a4:	53                   	push   %ebx
801038a5:	8b 75 08             	mov    0x8(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
801038a8:	e8 b3 0a 00 00       	call   80104360 <pushcli>
  c = mycpu();
801038ad:	e8 2e fe ff ff       	call   801036e0 <mycpu>
  p = c->proc;
801038b2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038b8:	e8 e3 0a 00 00       	call   801043a0 <popcli>
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
801038bd:	83 fe 00             	cmp    $0x0,%esi
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
801038c0:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
801038c2:	7e 34                	jle    801038f8 <growproc+0x58>
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
801038c4:	83 ec 04             	sub    $0x4,%esp
801038c7:	01 c6                	add    %eax,%esi
801038c9:	56                   	push   %esi
801038ca:	50                   	push   %eax
801038cb:	ff 73 04             	pushl  0x4(%ebx)
801038ce:	e8 cd 32 00 00       	call   80106ba0 <allocuvm>
801038d3:	83 c4 10             	add    $0x10,%esp
801038d6:	85 c0                	test   %eax,%eax
801038d8:	74 36                	je     80103910 <growproc+0x70>
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
801038da:	83 ec 0c             	sub    $0xc,%esp
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
801038dd:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
801038df:	53                   	push   %ebx
801038e0:	e8 6b 30 00 00       	call   80106950 <switchuvm>
  return 0;
801038e5:	83 c4 10             	add    $0x10,%esp
801038e8:	31 c0                	xor    %eax,%eax
}
801038ea:	8d 65 f8             	lea    -0x8(%ebp),%esp
801038ed:	5b                   	pop    %ebx
801038ee:	5e                   	pop    %esi
801038ef:	5d                   	pop    %ebp
801038f0:	c3                   	ret    
801038f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
801038f8:	74 e0                	je     801038da <growproc+0x3a>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
801038fa:	83 ec 04             	sub    $0x4,%esp
801038fd:	01 c6                	add    %eax,%esi
801038ff:	56                   	push   %esi
80103900:	50                   	push   %eax
80103901:	ff 73 04             	pushl  0x4(%ebx)
80103904:	e8 97 33 00 00       	call   80106ca0 <deallocuvm>
80103909:	83 c4 10             	add    $0x10,%esp
8010390c:	85 c0                	test   %eax,%eax
8010390e:	75 ca                	jne    801038da <growproc+0x3a>
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
80103910:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103915:	eb d3                	jmp    801038ea <growproc+0x4a>
80103917:	89 f6                	mov    %esi,%esi
80103919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103920 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103920:	55                   	push   %ebp
80103921:	89 e5                	mov    %esp,%ebp
80103923:	57                   	push   %edi
80103924:	56                   	push   %esi
80103925:	53                   	push   %ebx
80103926:	83 ec 1c             	sub    $0x1c,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103929:	e8 32 0a 00 00       	call   80104360 <pushcli>
  c = mycpu();
8010392e:	e8 ad fd ff ff       	call   801036e0 <mycpu>
  p = c->proc;
80103933:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103939:	e8 62 0a 00 00       	call   801043a0 <popcli>
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
8010393e:	e8 6d fc ff ff       	call   801035b0 <allocproc>
80103943:	85 c0                	test   %eax,%eax
80103945:	89 c7                	mov    %eax,%edi
80103947:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010394a:	0f 84 b5 00 00 00    	je     80103a05 <fork+0xe5>
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103950:	83 ec 08             	sub    $0x8,%esp
80103953:	ff 33                	pushl  (%ebx)
80103955:	ff 73 04             	pushl  0x4(%ebx)
80103958:	e8 73 35 00 00       	call   80106ed0 <copyuvm>
8010395d:	83 c4 10             	add    $0x10,%esp
80103960:	85 c0                	test   %eax,%eax
80103962:	89 47 04             	mov    %eax,0x4(%edi)
80103965:	0f 84 a1 00 00 00    	je     80103a0c <fork+0xec>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
8010396b:	8b 03                	mov    (%ebx),%eax
8010396d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103970:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
80103972:	89 59 14             	mov    %ebx,0x14(%ecx)
  *np->tf = *curproc->tf;
80103975:	89 c8                	mov    %ecx,%eax
80103977:	8b 79 18             	mov    0x18(%ecx),%edi
8010397a:	8b 73 18             	mov    0x18(%ebx),%esi
8010397d:	b9 13 00 00 00       	mov    $0x13,%ecx
80103982:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103984:	31 f6                	xor    %esi,%esi
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
80103986:	8b 40 18             	mov    0x18(%eax),%eax
80103989:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
80103990:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103994:	85 c0                	test   %eax,%eax
80103996:	74 13                	je     801039ab <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103998:	83 ec 0c             	sub    $0xc,%esp
8010399b:	50                   	push   %eax
8010399c:	e8 3f d4 ff ff       	call   80100de0 <filedup>
801039a1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801039a4:	83 c4 10             	add    $0x10,%esp
801039a7:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
801039ab:	83 c6 01             	add    $0x1,%esi
801039ae:	83 fe 10             	cmp    $0x10,%esi
801039b1:	75 dd                	jne    80103990 <fork+0x70>
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039b3:	83 ec 0c             	sub    $0xc,%esp
801039b6:	ff 73 68             	pushl  0x68(%ebx)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039b9:	83 c3 6c             	add    $0x6c,%ebx
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039bc:	e8 7f dc ff ff       	call   80101640 <idup>
801039c1:	8b 7d e4             	mov    -0x1c(%ebp),%edi

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039c4:	83 c4 0c             	add    $0xc,%esp
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039c7:	89 47 68             	mov    %eax,0x68(%edi)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039ca:	8d 47 6c             	lea    0x6c(%edi),%eax
801039cd:	6a 10                	push   $0x10
801039cf:	53                   	push   %ebx
801039d0:	50                   	push   %eax
801039d1:	e8 6a 0d 00 00       	call   80104740 <safestrcpy>

  pid = np->pid;
801039d6:	8b 5f 10             	mov    0x10(%edi),%ebx

  acquire(&ptable.lock);
801039d9:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801039e0:	e8 5b 0a 00 00       	call   80104440 <acquire>

  np->state = RUNNABLE;
801039e5:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)

  release(&ptable.lock);
801039ec:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801039f3:	e8 f8 0a 00 00       	call   801044f0 <release>

  return pid;
801039f8:	83 c4 10             	add    $0x10,%esp
801039fb:	89 d8                	mov    %ebx,%eax
}
801039fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103a00:	5b                   	pop    %ebx
80103a01:	5e                   	pop    %esi
80103a02:	5f                   	pop    %edi
80103a03:	5d                   	pop    %ebp
80103a04:	c3                   	ret    
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103a05:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a0a:	eb f1                	jmp    801039fd <fork+0xdd>
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
80103a0c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103a0f:	83 ec 0c             	sub    $0xc,%esp
80103a12:	ff 77 08             	pushl  0x8(%edi)
80103a15:	e8 c6 e8 ff ff       	call   801022e0 <kfree>
    np->kstack = 0;
80103a1a:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%edi)
    np->state = UNUSED;
80103a21:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
    return -1;
80103a28:	83 c4 10             	add    $0x10,%esp
80103a2b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a30:	eb cb                	jmp    801039fd <fork+0xdd>
80103a32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a40 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103a40:	55                   	push   %ebp
80103a41:	89 e5                	mov    %esp,%ebp
80103a43:	57                   	push   %edi
80103a44:	56                   	push   %esi
80103a45:	53                   	push   %ebx
80103a46:	83 ec 0c             	sub    $0xc,%esp
  struct proc *p;
  struct cpu *c = mycpu();
80103a49:	e8 92 fc ff ff       	call   801036e0 <mycpu>
80103a4e:	8d 78 04             	lea    0x4(%eax),%edi
80103a51:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103a53:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103a5a:	00 00 00 
80103a5d:	8d 76 00             	lea    0x0(%esi),%esi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103a60:	fb                   	sti    
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a61:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a64:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a69:	68 20 2d 11 80       	push   $0x80112d20
80103a6e:	e8 cd 09 00 00       	call   80104440 <acquire>
80103a73:	83 c4 10             	add    $0x10,%esp
80103a76:	eb 13                	jmp    80103a8b <scheduler+0x4b>
80103a78:	90                   	nop
80103a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a80:	83 c3 7c             	add    $0x7c,%ebx
80103a83:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103a89:	74 45                	je     80103ad0 <scheduler+0x90>
      if(p->state != RUNNABLE)
80103a8b:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103a8f:	75 ef                	jne    80103a80 <scheduler+0x40>

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
80103a91:	83 ec 0c             	sub    $0xc,%esp
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
80103a94:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103a9a:	53                   	push   %ebx
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a9b:	83 c3 7c             	add    $0x7c,%ebx

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
80103a9e:	e8 ad 2e 00 00       	call   80106950 <switchuvm>
      p->state = RUNNING;

      swtch(&(c->scheduler), p->context);
80103aa3:	58                   	pop    %eax
80103aa4:	5a                   	pop    %edx
80103aa5:	ff 73 a0             	pushl  -0x60(%ebx)
80103aa8:	57                   	push   %edi
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;
80103aa9:	c7 43 90 04 00 00 00 	movl   $0x4,-0x70(%ebx)

      swtch(&(c->scheduler), p->context);
80103ab0:	e8 e6 0c 00 00       	call   8010479b <swtch>
      switchkvm();
80103ab5:	e8 76 2e 00 00       	call   80106930 <switchkvm>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103aba:	83 c4 10             	add    $0x10,%esp
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103abd:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
      swtch(&(c->scheduler), p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103ac3:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103aca:	00 00 00 
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103acd:	75 bc                	jne    80103a8b <scheduler+0x4b>
80103acf:	90                   	nop

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
    }
    release(&ptable.lock);
80103ad0:	83 ec 0c             	sub    $0xc,%esp
80103ad3:	68 20 2d 11 80       	push   $0x80112d20
80103ad8:	e8 13 0a 00 00       	call   801044f0 <release>

  }
80103add:	83 c4 10             	add    $0x10,%esp
80103ae0:	e9 7b ff ff ff       	jmp    80103a60 <scheduler+0x20>
80103ae5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103af0 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103af0:	55                   	push   %ebp
80103af1:	89 e5                	mov    %esp,%ebp
80103af3:	56                   	push   %esi
80103af4:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103af5:	e8 66 08 00 00       	call   80104360 <pushcli>
  c = mycpu();
80103afa:	e8 e1 fb ff ff       	call   801036e0 <mycpu>
  p = c->proc;
80103aff:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103b05:	e8 96 08 00 00       	call   801043a0 <popcli>
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
80103b0a:	83 ec 0c             	sub    $0xc,%esp
80103b0d:	68 20 2d 11 80       	push   $0x80112d20
80103b12:	e8 f9 08 00 00       	call   80104410 <holding>
80103b17:	83 c4 10             	add    $0x10,%esp
80103b1a:	85 c0                	test   %eax,%eax
80103b1c:	74 4f                	je     80103b6d <sched+0x7d>
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
80103b1e:	e8 bd fb ff ff       	call   801036e0 <mycpu>
80103b23:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103b2a:	75 68                	jne    80103b94 <sched+0xa4>
    panic("sched locks");
  if(p->state == RUNNING)
80103b2c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103b30:	74 55                	je     80103b87 <sched+0x97>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103b32:	9c                   	pushf  
80103b33:	58                   	pop    %eax
    panic("sched running");
  if(readeflags()&FL_IF)
80103b34:	f6 c4 02             	test   $0x2,%ah
80103b37:	75 41                	jne    80103b7a <sched+0x8a>
    panic("sched interruptible");
  intena = mycpu()->intena;
80103b39:	e8 a2 fb ff ff       	call   801036e0 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103b3e:	83 c3 1c             	add    $0x1c,%ebx
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
80103b41:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103b47:	e8 94 fb ff ff       	call   801036e0 <mycpu>
80103b4c:	83 ec 08             	sub    $0x8,%esp
80103b4f:	ff 70 04             	pushl  0x4(%eax)
80103b52:	53                   	push   %ebx
80103b53:	e8 43 0c 00 00       	call   8010479b <swtch>
  mycpu()->intena = intena;
80103b58:	e8 83 fb ff ff       	call   801036e0 <mycpu>
}
80103b5d:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
80103b60:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103b66:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103b69:	5b                   	pop    %ebx
80103b6a:	5e                   	pop    %esi
80103b6b:	5d                   	pop    %ebp
80103b6c:	c3                   	ret    
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103b6d:	83 ec 0c             	sub    $0xc,%esp
80103b70:	68 50 76 10 80       	push   $0x80107650
80103b75:	e8 f6 c7 ff ff       	call   80100370 <panic>
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103b7a:	83 ec 0c             	sub    $0xc,%esp
80103b7d:	68 7c 76 10 80       	push   $0x8010767c
80103b82:	e8 e9 c7 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
80103b87:	83 ec 0c             	sub    $0xc,%esp
80103b8a:	68 6e 76 10 80       	push   $0x8010766e
80103b8f:	e8 dc c7 ff ff       	call   80100370 <panic>
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
80103b94:	83 ec 0c             	sub    $0xc,%esp
80103b97:	68 62 76 10 80       	push   $0x80107662
80103b9c:	e8 cf c7 ff ff       	call   80100370 <panic>
80103ba1:	eb 0d                	jmp    80103bb0 <exit>
80103ba3:	90                   	nop
80103ba4:	90                   	nop
80103ba5:	90                   	nop
80103ba6:	90                   	nop
80103ba7:	90                   	nop
80103ba8:	90                   	nop
80103ba9:	90                   	nop
80103baa:	90                   	nop
80103bab:	90                   	nop
80103bac:	90                   	nop
80103bad:	90                   	nop
80103bae:	90                   	nop
80103baf:	90                   	nop

80103bb0 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103bb0:	55                   	push   %ebp
80103bb1:	89 e5                	mov    %esp,%ebp
80103bb3:	57                   	push   %edi
80103bb4:	56                   	push   %esi
80103bb5:	53                   	push   %ebx
80103bb6:	83 ec 0c             	sub    $0xc,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103bb9:	e8 a2 07 00 00       	call   80104360 <pushcli>
  c = mycpu();
80103bbe:	e8 1d fb ff ff       	call   801036e0 <mycpu>
  p = c->proc;
80103bc3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103bc9:	e8 d2 07 00 00       	call   801043a0 <popcli>
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
80103bce:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103bd4:	8d 5e 28             	lea    0x28(%esi),%ebx
80103bd7:	8d 7e 68             	lea    0x68(%esi),%edi
80103bda:	0f 84 e7 00 00 00    	je     80103cc7 <exit+0x117>
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
80103be0:	8b 03                	mov    (%ebx),%eax
80103be2:	85 c0                	test   %eax,%eax
80103be4:	74 12                	je     80103bf8 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103be6:	83 ec 0c             	sub    $0xc,%esp
80103be9:	50                   	push   %eax
80103bea:	e8 41 d2 ff ff       	call   80100e30 <fileclose>
      curproc->ofile[fd] = 0;
80103bef:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103bf5:	83 c4 10             	add    $0x10,%esp
80103bf8:	83 c3 04             	add    $0x4,%ebx

  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103bfb:	39 df                	cmp    %ebx,%edi
80103bfd:	75 e1                	jne    80103be0 <exit+0x30>
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
80103bff:	e8 4c ef ff ff       	call   80102b50 <begin_op>
  iput(curproc->cwd);
80103c04:	83 ec 0c             	sub    $0xc,%esp
80103c07:	ff 76 68             	pushl  0x68(%esi)
80103c0a:	e8 91 db ff ff       	call   801017a0 <iput>
  end_op();
80103c0f:	e8 ac ef ff ff       	call   80102bc0 <end_op>
  curproc->cwd = 0;
80103c14:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)

  acquire(&ptable.lock);
80103c1b:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103c22:	e8 19 08 00 00       	call   80104440 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);
80103c27:	8b 56 14             	mov    0x14(%esi),%edx
80103c2a:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c2d:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103c32:	eb 0e                	jmp    80103c42 <exit+0x92>
80103c34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c38:	83 c0 7c             	add    $0x7c,%eax
80103c3b:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103c40:	74 1c                	je     80103c5e <exit+0xae>
    if(p->state == SLEEPING && p->chan == chan)
80103c42:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c46:	75 f0                	jne    80103c38 <exit+0x88>
80103c48:	3b 50 20             	cmp    0x20(%eax),%edx
80103c4b:	75 eb                	jne    80103c38 <exit+0x88>
      p->state = RUNNABLE;
80103c4d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c54:	83 c0 7c             	add    $0x7c,%eax
80103c57:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103c5c:	75 e4                	jne    80103c42 <exit+0x92>
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103c5e:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
80103c64:	ba 54 2d 11 80       	mov    $0x80112d54,%edx
80103c69:	eb 10                	jmp    80103c7b <exit+0xcb>
80103c6b:	90                   	nop
80103c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c70:	83 c2 7c             	add    $0x7c,%edx
80103c73:	81 fa 54 4c 11 80    	cmp    $0x80114c54,%edx
80103c79:	74 33                	je     80103cae <exit+0xfe>
    if(p->parent == curproc){
80103c7b:	39 72 14             	cmp    %esi,0x14(%edx)
80103c7e:	75 f0                	jne    80103c70 <exit+0xc0>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103c80:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103c84:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103c87:	75 e7                	jne    80103c70 <exit+0xc0>
80103c89:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103c8e:	eb 0a                	jmp    80103c9a <exit+0xea>
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c90:	83 c0 7c             	add    $0x7c,%eax
80103c93:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103c98:	74 d6                	je     80103c70 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103c9a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c9e:	75 f0                	jne    80103c90 <exit+0xe0>
80103ca0:	3b 48 20             	cmp    0x20(%eax),%ecx
80103ca3:	75 eb                	jne    80103c90 <exit+0xe0>
      p->state = RUNNABLE;
80103ca5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103cac:	eb e2                	jmp    80103c90 <exit+0xe0>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
80103cae:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103cb5:	e8 36 fe ff ff       	call   80103af0 <sched>
  panic("zombie exit");
80103cba:	83 ec 0c             	sub    $0xc,%esp
80103cbd:	68 9d 76 10 80       	push   $0x8010769d
80103cc2:	e8 a9 c6 ff ff       	call   80100370 <panic>
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
    panic("init exiting");
80103cc7:	83 ec 0c             	sub    $0xc,%esp
80103cca:	68 90 76 10 80       	push   $0x80107690
80103ccf:	e8 9c c6 ff ff       	call   80100370 <panic>
80103cd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103cda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103ce0 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103ce0:	55                   	push   %ebp
80103ce1:	89 e5                	mov    %esp,%ebp
80103ce3:	53                   	push   %ebx
80103ce4:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103ce7:	68 20 2d 11 80       	push   $0x80112d20
80103cec:	e8 4f 07 00 00       	call   80104440 <acquire>
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103cf1:	e8 6a 06 00 00       	call   80104360 <pushcli>
  c = mycpu();
80103cf6:	e8 e5 f9 ff ff       	call   801036e0 <mycpu>
  p = c->proc;
80103cfb:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d01:	e8 9a 06 00 00       	call   801043a0 <popcli>
// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
80103d06:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103d0d:	e8 de fd ff ff       	call   80103af0 <sched>
  release(&ptable.lock);
80103d12:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103d19:	e8 d2 07 00 00       	call   801044f0 <release>
}
80103d1e:	83 c4 10             	add    $0x10,%esp
80103d21:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d24:	c9                   	leave  
80103d25:	c3                   	ret    
80103d26:	8d 76 00             	lea    0x0(%esi),%esi
80103d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103d30 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103d30:	55                   	push   %ebp
80103d31:	89 e5                	mov    %esp,%ebp
80103d33:	57                   	push   %edi
80103d34:	56                   	push   %esi
80103d35:	53                   	push   %ebx
80103d36:	83 ec 0c             	sub    $0xc,%esp
80103d39:	8b 7d 08             	mov    0x8(%ebp),%edi
80103d3c:	8b 75 0c             	mov    0xc(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103d3f:	e8 1c 06 00 00       	call   80104360 <pushcli>
  c = mycpu();
80103d44:	e8 97 f9 ff ff       	call   801036e0 <mycpu>
  p = c->proc;
80103d49:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d4f:	e8 4c 06 00 00       	call   801043a0 <popcli>
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
80103d54:	85 db                	test   %ebx,%ebx
80103d56:	0f 84 87 00 00 00    	je     80103de3 <sleep+0xb3>
    panic("sleep");

  if(lk == 0)
80103d5c:	85 f6                	test   %esi,%esi
80103d5e:	74 76                	je     80103dd6 <sleep+0xa6>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103d60:	81 fe 20 2d 11 80    	cmp    $0x80112d20,%esi
80103d66:	74 50                	je     80103db8 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103d68:	83 ec 0c             	sub    $0xc,%esp
80103d6b:	68 20 2d 11 80       	push   $0x80112d20
80103d70:	e8 cb 06 00 00       	call   80104440 <acquire>
    release(lk);
80103d75:	89 34 24             	mov    %esi,(%esp)
80103d78:	e8 73 07 00 00       	call   801044f0 <release>
  }
  // Go to sleep.
  p->chan = chan;
80103d7d:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103d80:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103d87:	e8 64 fd ff ff       	call   80103af0 <sched>

  // Tidy up.
  p->chan = 0;
80103d8c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103d93:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103d9a:	e8 51 07 00 00       	call   801044f0 <release>
    acquire(lk);
80103d9f:	89 75 08             	mov    %esi,0x8(%ebp)
80103da2:	83 c4 10             	add    $0x10,%esp
  }
}
80103da5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103da8:	5b                   	pop    %ebx
80103da9:	5e                   	pop    %esi
80103daa:	5f                   	pop    %edi
80103dab:	5d                   	pop    %ebp
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103dac:	e9 8f 06 00 00       	jmp    80104440 <acquire>
80103db1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
80103db8:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103dbb:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103dc2:	e8 29 fd ff ff       	call   80103af0 <sched>

  // Tidy up.
  p->chan = 0;
80103dc7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103dce:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103dd1:	5b                   	pop    %ebx
80103dd2:	5e                   	pop    %esi
80103dd3:	5f                   	pop    %edi
80103dd4:	5d                   	pop    %ebp
80103dd5:	c3                   	ret    
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103dd6:	83 ec 0c             	sub    $0xc,%esp
80103dd9:	68 af 76 10 80       	push   $0x801076af
80103dde:	e8 8d c5 ff ff       	call   80100370 <panic>
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");
80103de3:	83 ec 0c             	sub    $0xc,%esp
80103de6:	68 a9 76 10 80       	push   $0x801076a9
80103deb:	e8 80 c5 ff ff       	call   80100370 <panic>

80103df0 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103df0:	55                   	push   %ebp
80103df1:	89 e5                	mov    %esp,%ebp
80103df3:	56                   	push   %esi
80103df4:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103df5:	e8 66 05 00 00       	call   80104360 <pushcli>
  c = mycpu();
80103dfa:	e8 e1 f8 ff ff       	call   801036e0 <mycpu>
  p = c->proc;
80103dff:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103e05:	e8 96 05 00 00       	call   801043a0 <popcli>
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
80103e0a:	83 ec 0c             	sub    $0xc,%esp
80103e0d:	68 20 2d 11 80       	push   $0x80112d20
80103e12:	e8 29 06 00 00       	call   80104440 <acquire>
80103e17:	83 c4 10             	add    $0x10,%esp
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103e1a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e1c:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80103e21:	eb 10                	jmp    80103e33 <wait+0x43>
80103e23:	90                   	nop
80103e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e28:	83 c3 7c             	add    $0x7c,%ebx
80103e2b:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103e31:	74 1d                	je     80103e50 <wait+0x60>
      if(p->parent != curproc)
80103e33:	39 73 14             	cmp    %esi,0x14(%ebx)
80103e36:	75 f0                	jne    80103e28 <wait+0x38>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103e38:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103e3c:	74 30                	je     80103e6e <wait+0x7e>
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e3e:	83 c3 7c             	add    $0x7c,%ebx
      if(p->parent != curproc)
        continue;
      havekids = 1;
80103e41:	b8 01 00 00 00       	mov    $0x1,%eax
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e46:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103e4c:	75 e5                	jne    80103e33 <wait+0x43>
80103e4e:	66 90                	xchg   %ax,%ax
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
80103e50:	85 c0                	test   %eax,%eax
80103e52:	74 70                	je     80103ec4 <wait+0xd4>
80103e54:	8b 46 24             	mov    0x24(%esi),%eax
80103e57:	85 c0                	test   %eax,%eax
80103e59:	75 69                	jne    80103ec4 <wait+0xd4>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103e5b:	83 ec 08             	sub    $0x8,%esp
80103e5e:	68 20 2d 11 80       	push   $0x80112d20
80103e63:	56                   	push   %esi
80103e64:	e8 c7 fe ff ff       	call   80103d30 <sleep>
  }
80103e69:	83 c4 10             	add    $0x10,%esp
80103e6c:	eb ac                	jmp    80103e1a <wait+0x2a>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80103e6e:	83 ec 0c             	sub    $0xc,%esp
80103e71:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80103e74:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103e77:	e8 64 e4 ff ff       	call   801022e0 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80103e7c:	5a                   	pop    %edx
80103e7d:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80103e80:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103e87:	e8 44 2e 00 00       	call   80106cd0 <freevm>
        p->pid = 0;
80103e8c:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103e93:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103e9a:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103e9e:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103ea5:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103eac:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103eb3:	e8 38 06 00 00       	call   801044f0 <release>
        return pid;
80103eb8:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ebb:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80103ebe:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ec0:	5b                   	pop    %ebx
80103ec1:	5e                   	pop    %esi
80103ec2:	5d                   	pop    %ebp
80103ec3:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
80103ec4:	83 ec 0c             	sub    $0xc,%esp
80103ec7:	68 20 2d 11 80       	push   $0x80112d20
80103ecc:	e8 1f 06 00 00       	call   801044f0 <release>
      return -1;
80103ed1:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ed4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
80103ed7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103edc:	5b                   	pop    %ebx
80103edd:	5e                   	pop    %esi
80103ede:	5d                   	pop    %ebp
80103edf:	c3                   	ret    

80103ee0 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103ee0:	55                   	push   %ebp
80103ee1:	89 e5                	mov    %esp,%ebp
80103ee3:	53                   	push   %ebx
80103ee4:	83 ec 10             	sub    $0x10,%esp
80103ee7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103eea:	68 20 2d 11 80       	push   $0x80112d20
80103eef:	e8 4c 05 00 00       	call   80104440 <acquire>
80103ef4:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ef7:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103efc:	eb 0c                	jmp    80103f0a <wakeup+0x2a>
80103efe:	66 90                	xchg   %ax,%ax
80103f00:	83 c0 7c             	add    $0x7c,%eax
80103f03:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103f08:	74 1c                	je     80103f26 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
80103f0a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f0e:	75 f0                	jne    80103f00 <wakeup+0x20>
80103f10:	3b 58 20             	cmp    0x20(%eax),%ebx
80103f13:	75 eb                	jne    80103f00 <wakeup+0x20>
      p->state = RUNNABLE;
80103f15:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f1c:	83 c0 7c             	add    $0x7c,%eax
80103f1f:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103f24:	75 e4                	jne    80103f0a <wakeup+0x2a>
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f26:	c7 45 08 20 2d 11 80 	movl   $0x80112d20,0x8(%ebp)
}
80103f2d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f30:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f31:	e9 ba 05 00 00       	jmp    801044f0 <release>
80103f36:	8d 76 00             	lea    0x0(%esi),%esi
80103f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f40 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80103f40:	55                   	push   %ebp
80103f41:	89 e5                	mov    %esp,%ebp
80103f43:	53                   	push   %ebx
80103f44:	83 ec 10             	sub    $0x10,%esp
80103f47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
80103f4a:	68 20 2d 11 80       	push   $0x80112d20
80103f4f:	e8 ec 04 00 00       	call   80104440 <acquire>
80103f54:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f57:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103f5c:	eb 0c                	jmp    80103f6a <kill+0x2a>
80103f5e:	66 90                	xchg   %ax,%ax
80103f60:	83 c0 7c             	add    $0x7c,%eax
80103f63:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103f68:	74 3e                	je     80103fa8 <kill+0x68>
    if(p->pid == pid){
80103f6a:	39 58 10             	cmp    %ebx,0x10(%eax)
80103f6d:	75 f1                	jne    80103f60 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103f6f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
80103f73:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103f7a:	74 1c                	je     80103f98 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
80103f7c:	83 ec 0c             	sub    $0xc,%esp
80103f7f:	68 20 2d 11 80       	push   $0x80112d20
80103f84:	e8 67 05 00 00       	call   801044f0 <release>
      return 0;
80103f89:	83 c4 10             	add    $0x10,%esp
80103f8c:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80103f8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f91:	c9                   	leave  
80103f92:	c3                   	ret    
80103f93:	90                   	nop
80103f94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
80103f98:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103f9f:	eb db                	jmp    80103f7c <kill+0x3c>
80103fa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80103fa8:	83 ec 0c             	sub    $0xc,%esp
80103fab:	68 20 2d 11 80       	push   $0x80112d20
80103fb0:	e8 3b 05 00 00       	call   801044f0 <release>
  return -1;
80103fb5:	83 c4 10             	add    $0x10,%esp
80103fb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103fbd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103fc0:	c9                   	leave  
80103fc1:	c3                   	ret    
80103fc2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103fd0 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80103fd0:	55                   	push   %ebp
80103fd1:	89 e5                	mov    %esp,%ebp
80103fd3:	57                   	push   %edi
80103fd4:	56                   	push   %esi
80103fd5:	53                   	push   %ebx
80103fd6:	be c0 2d 11 80       	mov    $0x80112dc0,%esi
80103fdb:	83 ec 4c             	sub    $0x4c,%esp
80103fde:	66 90                	xchg   %ax,%ax
  char *state;
  pte_t* pte;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
80103fe0:	8b 56 a0             	mov    -0x60(%esi),%edx
80103fe3:	85 d2                	test   %edx,%edx
80103fe5:	0f 84 4d 01 00 00    	je     80104138 <procdump+0x168>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80103feb:	83 fa 05             	cmp    $0x5,%edx
      state = states[p->state];
    else
      state = "???";
80103fee:	b9 c0 76 10 80       	mov    $0x801076c0,%ecx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80103ff3:	77 11                	ja     80104006 <procdump+0x36>
80103ff5:	8b 0c 95 74 77 10 80 	mov    -0x7fef888c(,%edx,4),%ecx
      state = states[p->state];
    else
      state = "???";
80103ffc:	ba c0 76 10 80       	mov    $0x801076c0,%edx
80104001:	85 c9                	test   %ecx,%ecx
80104003:	0f 44 ca             	cmove  %edx,%ecx

    cprintf("%d %s %s", p->pid, state, p->name);
80104006:	56                   	push   %esi
80104007:	51                   	push   %ecx
80104008:	ff 76 a4             	pushl  -0x5c(%esi)
8010400b:	68 cb 76 10 80       	push   $0x801076cb
80104010:	e8 4b c6 ff ff       	call   80100660 <cprintf>

    if(p->state == SLEEPING){
80104015:	83 c4 10             	add    $0x10,%esp
80104018:	83 7e a0 02          	cmpl   $0x2,-0x60(%esi)
8010401c:	0f 84 2d 01 00 00    	je     8010414f <procdump+0x17f>
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104022:	83 ec 0c             	sub    $0xc,%esp
80104025:	68 9b 7a 10 80       	push   $0x80107a9b
8010402a:	e8 31 c6 ff ff       	call   80100660 <cprintf>


	for (uint i = 0; i < p->sz; i += PGSIZE) {
8010402f:	8b 46 94             	mov    -0x6c(%esi),%eax
80104032:	83 c4 10             	add    $0x10,%esp
80104035:	85 c0                	test   %eax,%eax
80104037:	0f 84 fb 00 00 00    	je     80104138 <procdump+0x168>
{
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
8010403d:	8b 56 98             	mov    -0x68(%esi),%edx
80104040:	8b 12                	mov    (%edx),%edx
80104042:	f6 c2 01             	test   $0x1,%dl
80104045:	74 71                	je     801040b8 <procdump+0xe8>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80104047:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
    cprintf("\n");


	for (uint i = 0; i < p->sz; i += PGSIZE) {
		// 
		if((pte = walkpgdir(p->pgdir, (void *) i, 0)) == 0)
8010404d:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80104053:	74 63                	je     801040b8 <procdump+0xe8>
80104055:	31 db                	xor    %ebx,%ebx
80104057:	89 f6                	mov    %esi,%esi
80104059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	      panic("copyuvm: pte should exist");
	    
	    if(!(*pte & PTE_P))
80104060:	8b 3a                	mov    (%edx),%edi
80104062:	f7 c7 01 00 00 00    	test   $0x1,%edi
80104068:	0f 84 2c 01 00 00    	je     8010419a <procdump+0x1ca>
	      panic("copyuvm: page not present");
		
		if((*pte & PTE_U) && (*pte & PTE_P)){
8010406e:	89 f8                	mov    %edi,%eax
80104070:	83 e0 05             	and    $0x5,%eax
80104073:	83 f8 05             	cmp    $0x5,%eax
80104076:	74 50                	je     801040c8 <procdump+0xf8>
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");


	for (uint i = 0; i < p->sz; i += PGSIZE) {
80104078:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010407e:	39 5e 94             	cmp    %ebx,-0x6c(%esi)
80104081:	0f 86 b1 00 00 00    	jbe    80104138 <procdump+0x168>
{
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
80104087:	8b 46 98             	mov    -0x68(%esi),%eax
8010408a:	89 da                	mov    %ebx,%edx
8010408c:	c1 ea 16             	shr    $0x16,%edx
8010408f:	8b 04 90             	mov    (%eax,%edx,4),%eax
80104092:	a8 01                	test   $0x1,%al
80104094:	74 22                	je     801040b8 <procdump+0xe8>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80104096:	89 da                	mov    %ebx,%edx
80104098:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010409d:	c1 ea 0a             	shr    $0xa,%edx
801040a0:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
801040a6:	8d 94 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%edx
    cprintf("\n");


	for (uint i = 0; i < p->sz; i += PGSIZE) {
		// 
		if((pte = walkpgdir(p->pgdir, (void *) i, 0)) == 0)
801040ad:	85 d2                	test   %edx,%edx
801040af:	75 af                	jne    80104060 <procdump+0x90>
801040b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	      panic("copyuvm: pte should exist");
801040b8:	83 ec 0c             	sub    $0xc,%esp
801040bb:	68 d4 76 10 80       	push   $0x801076d4
801040c0:	e8 ab c2 ff ff       	call   80100370 <panic>
801040c5:	8d 76 00             	lea    0x0(%esi),%esi
	    if(!(*pte & PTE_P))
	      panic("copyuvm: page not present");
		
		if((*pte & PTE_U) && (*pte & PTE_P)){
			uint temp = PTE_ADDR(*pte) >> 12;
			cprintf("| %d", PTX(i));
801040c8:	89 d8                	mov    %ebx,%eax
801040ca:	83 ec 08             	sub    $0x8,%esp
801040cd:	89 55 b4             	mov    %edx,-0x4c(%ebp)
801040d0:	c1 e8 0c             	shr    $0xc,%eax
			cprintf("| %d        ",temp);
801040d3:	c1 ef 0c             	shr    $0xc,%edi
	    if(!(*pte & PTE_P))
	      panic("copyuvm: page not present");
		
		if((*pte & PTE_U) && (*pte & PTE_P)){
			uint temp = PTE_ADDR(*pte) >> 12;
			cprintf("| %d", PTX(i));
801040d6:	25 ff 03 00 00       	and    $0x3ff,%eax
801040db:	50                   	push   %eax
801040dc:	68 08 77 10 80       	push   $0x80107708
801040e1:	e8 7a c5 ff ff       	call   80100660 <cprintf>
			cprintf("| %d        ",temp);
801040e6:	58                   	pop    %eax
801040e7:	5a                   	pop    %edx
801040e8:	57                   	push   %edi
801040e9:	68 0d 77 10 80       	push   $0x8010770d
801040ee:	e8 6d c5 ff ff       	call   80100660 <cprintf>
			cprintf("| %s", (*pte & PTE_W) ? "Yes" : "No");
801040f3:	8b 55 b4             	mov    -0x4c(%ebp),%edx
801040f6:	b8 c8 76 10 80       	mov    $0x801076c8,%eax
801040fb:	59                   	pop    %ecx
801040fc:	b9 c4 76 10 80       	mov    $0x801076c4,%ecx
80104101:	f6 02 02             	testb  $0x2,(%edx)
80104104:	5f                   	pop    %edi
80104105:	0f 45 c1             	cmovne %ecx,%eax
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");


	for (uint i = 0; i < p->sz; i += PGSIZE) {
80104108:	81 c3 00 10 00 00    	add    $0x1000,%ebx
		
		if((*pte & PTE_U) && (*pte & PTE_P)){
			uint temp = PTE_ADDR(*pte) >> 12;
			cprintf("| %d", PTX(i));
			cprintf("| %d        ",temp);
			cprintf("| %s", (*pte & PTE_W) ? "Yes" : "No");
8010410e:	50                   	push   %eax
8010410f:	68 1a 77 10 80       	push   $0x8010771a
80104114:	e8 47 c5 ff ff       	call   80100660 <cprintf>
			cprintf("|\n");
80104119:	c7 04 24 1f 77 10 80 	movl   $0x8010771f,(%esp)
80104120:	e8 3b c5 ff ff       	call   80100660 <cprintf>
80104125:	83 c4 10             	add    $0x10,%esp
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");


	for (uint i = 0; i < p->sz; i += PGSIZE) {
80104128:	39 5e 94             	cmp    %ebx,-0x6c(%esi)
8010412b:	0f 87 56 ff ff ff    	ja     80104087 <procdump+0xb7>
80104131:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104138:	83 c6 7c             	add    $0x7c,%esi
  struct proc *p;
  char *state;
  pte_t* pte;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010413b:	81 fe c0 4c 11 80    	cmp    $0x80114cc0,%esi
80104141:	0f 85 99 fe ff ff    	jne    80103fe0 <procdump+0x10>
			cprintf("|\n");
		}
		
	 }
  }
}
80104147:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010414a:	5b                   	pop    %ebx
8010414b:	5e                   	pop    %esi
8010414c:	5f                   	pop    %edi
8010414d:	5d                   	pop    %ebp
8010414e:	c3                   	ret    
      state = "???";

    cprintf("%d %s %s", p->pid, state, p->name);

    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
8010414f:	8b 56 b0             	mov    -0x50(%esi),%edx
80104152:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104155:	83 ec 08             	sub    $0x8,%esp
80104158:	8d 5d c0             	lea    -0x40(%ebp),%ebx
8010415b:	50                   	push   %eax
8010415c:	8b 52 0c             	mov    0xc(%edx),%edx
8010415f:	83 c2 08             	add    $0x8,%edx
80104162:	52                   	push   %edx
80104163:	e8 98 01 00 00       	call   80104300 <getcallerpcs>
80104168:	83 c4 10             	add    $0x10,%esp
8010416b:	90                   	nop
8010416c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80104170:	8b 03                	mov    (%ebx),%eax
80104172:	85 c0                	test   %eax,%eax
80104174:	0f 84 a8 fe ff ff    	je     80104022 <procdump+0x52>
        cprintf(" %p", pc[i]);
8010417a:	83 ec 08             	sub    $0x8,%esp
8010417d:	83 c3 04             	add    $0x4,%ebx
80104180:	50                   	push   %eax
80104181:	68 01 71 10 80       	push   $0x80107101
80104186:	e8 d5 c4 ff ff       	call   80100660 <cprintf>

    cprintf("%d %s %s", p->pid, state, p->name);

    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
8010418b:	8d 45 e8             	lea    -0x18(%ebp),%eax
8010418e:	83 c4 10             	add    $0x10,%esp
80104191:	39 d8                	cmp    %ebx,%eax
80104193:	75 db                	jne    80104170 <procdump+0x1a0>
80104195:	e9 88 fe ff ff       	jmp    80104022 <procdump+0x52>
		// 
		if((pte = walkpgdir(p->pgdir, (void *) i, 0)) == 0)
	      panic("copyuvm: pte should exist");
	    
	    if(!(*pte & PTE_P))
	      panic("copyuvm: page not present");
8010419a:	83 ec 0c             	sub    $0xc,%esp
8010419d:	68 ee 76 10 80       	push   $0x801076ee
801041a2:	e8 c9 c1 ff ff       	call   80100370 <panic>
801041a7:	66 90                	xchg   %ax,%ax
801041a9:	66 90                	xchg   %ax,%ax
801041ab:	66 90                	xchg   %ax,%ax
801041ad:	66 90                	xchg   %ax,%ax
801041af:	90                   	nop

801041b0 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
801041b0:	55                   	push   %ebp
801041b1:	89 e5                	mov    %esp,%ebp
801041b3:	53                   	push   %ebx
801041b4:	83 ec 0c             	sub    $0xc,%esp
801041b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
801041ba:	68 8c 77 10 80       	push   $0x8010778c
801041bf:	8d 43 04             	lea    0x4(%ebx),%eax
801041c2:	50                   	push   %eax
801041c3:	e8 18 01 00 00       	call   801042e0 <initlock>
  lk->name = name;
801041c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
801041cb:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
801041d1:	83 c4 10             	add    $0x10,%esp
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
801041d4:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
801041db:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
801041de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041e1:	c9                   	leave  
801041e2:	c3                   	ret    
801041e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801041e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041f0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
801041f0:	55                   	push   %ebp
801041f1:	89 e5                	mov    %esp,%ebp
801041f3:	56                   	push   %esi
801041f4:	53                   	push   %ebx
801041f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801041f8:	83 ec 0c             	sub    $0xc,%esp
801041fb:	8d 73 04             	lea    0x4(%ebx),%esi
801041fe:	56                   	push   %esi
801041ff:	e8 3c 02 00 00       	call   80104440 <acquire>
  while (lk->locked) {
80104204:	8b 13                	mov    (%ebx),%edx
80104206:	83 c4 10             	add    $0x10,%esp
80104209:	85 d2                	test   %edx,%edx
8010420b:	74 16                	je     80104223 <acquiresleep+0x33>
8010420d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80104210:	83 ec 08             	sub    $0x8,%esp
80104213:	56                   	push   %esi
80104214:	53                   	push   %ebx
80104215:	e8 16 fb ff ff       	call   80103d30 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
8010421a:	8b 03                	mov    (%ebx),%eax
8010421c:	83 c4 10             	add    $0x10,%esp
8010421f:	85 c0                	test   %eax,%eax
80104221:	75 ed                	jne    80104210 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
80104223:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80104229:	e8 52 f5 ff ff       	call   80103780 <myproc>
8010422e:	8b 40 10             	mov    0x10(%eax),%eax
80104231:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104234:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104237:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010423a:	5b                   	pop    %ebx
8010423b:	5e                   	pop    %esi
8010423c:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = myproc()->pid;
  release(&lk->lk);
8010423d:	e9 ae 02 00 00       	jmp    801044f0 <release>
80104242:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104250 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
80104250:	55                   	push   %ebp
80104251:	89 e5                	mov    %esp,%ebp
80104253:	56                   	push   %esi
80104254:	53                   	push   %ebx
80104255:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104258:	83 ec 0c             	sub    $0xc,%esp
8010425b:	8d 73 04             	lea    0x4(%ebx),%esi
8010425e:	56                   	push   %esi
8010425f:	e8 dc 01 00 00       	call   80104440 <acquire>
  lk->locked = 0;
80104264:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010426a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104271:	89 1c 24             	mov    %ebx,(%esp)
80104274:	e8 67 fc ff ff       	call   80103ee0 <wakeup>
  release(&lk->lk);
80104279:	89 75 08             	mov    %esi,0x8(%ebp)
8010427c:	83 c4 10             	add    $0x10,%esp
}
8010427f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104282:	5b                   	pop    %ebx
80104283:	5e                   	pop    %esi
80104284:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
80104285:	e9 66 02 00 00       	jmp    801044f0 <release>
8010428a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104290 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
80104290:	55                   	push   %ebp
80104291:	89 e5                	mov    %esp,%ebp
80104293:	57                   	push   %edi
80104294:	56                   	push   %esi
80104295:	53                   	push   %ebx
80104296:	31 ff                	xor    %edi,%edi
80104298:	83 ec 18             	sub    $0x18,%esp
8010429b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
8010429e:	8d 73 04             	lea    0x4(%ebx),%esi
801042a1:	56                   	push   %esi
801042a2:	e8 99 01 00 00       	call   80104440 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
801042a7:	8b 03                	mov    (%ebx),%eax
801042a9:	83 c4 10             	add    $0x10,%esp
801042ac:	85 c0                	test   %eax,%eax
801042ae:	74 13                	je     801042c3 <holdingsleep+0x33>
801042b0:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
801042b3:	e8 c8 f4 ff ff       	call   80103780 <myproc>
801042b8:	39 58 10             	cmp    %ebx,0x10(%eax)
801042bb:	0f 94 c0             	sete   %al
801042be:	0f b6 c0             	movzbl %al,%eax
801042c1:	89 c7                	mov    %eax,%edi
  release(&lk->lk);
801042c3:	83 ec 0c             	sub    $0xc,%esp
801042c6:	56                   	push   %esi
801042c7:	e8 24 02 00 00       	call   801044f0 <release>
  return r;
}
801042cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801042cf:	89 f8                	mov    %edi,%eax
801042d1:	5b                   	pop    %ebx
801042d2:	5e                   	pop    %esi
801042d3:	5f                   	pop    %edi
801042d4:	5d                   	pop    %ebp
801042d5:	c3                   	ret    
801042d6:	66 90                	xchg   %ax,%ax
801042d8:	66 90                	xchg   %ax,%ax
801042da:	66 90                	xchg   %ax,%ax
801042dc:	66 90                	xchg   %ax,%ax
801042de:	66 90                	xchg   %ax,%ax

801042e0 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801042e0:	55                   	push   %ebp
801042e1:	89 e5                	mov    %esp,%ebp
801042e3:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
801042e6:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
801042e9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
801042ef:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
801042f2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
801042f9:	5d                   	pop    %ebp
801042fa:	c3                   	ret    
801042fb:	90                   	nop
801042fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104300 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104300:	55                   	push   %ebp
80104301:	89 e5                	mov    %esp,%ebp
80104303:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104304:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104307:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
8010430a:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
8010430d:	31 c0                	xor    %eax,%eax
8010430f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104310:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104316:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010431c:	77 1a                	ja     80104338 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010431e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104321:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104324:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
80104327:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104329:	83 f8 0a             	cmp    $0xa,%eax
8010432c:	75 e2                	jne    80104310 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010432e:	5b                   	pop    %ebx
8010432f:	5d                   	pop    %ebp
80104330:	c3                   	ret    
80104331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104338:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010433f:	83 c0 01             	add    $0x1,%eax
80104342:	83 f8 0a             	cmp    $0xa,%eax
80104345:	74 e7                	je     8010432e <getcallerpcs+0x2e>
    pcs[i] = 0;
80104347:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010434e:	83 c0 01             	add    $0x1,%eax
80104351:	83 f8 0a             	cmp    $0xa,%eax
80104354:	75 e2                	jne    80104338 <getcallerpcs+0x38>
80104356:	eb d6                	jmp    8010432e <getcallerpcs+0x2e>
80104358:	90                   	nop
80104359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104360 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104360:	55                   	push   %ebp
80104361:	89 e5                	mov    %esp,%ebp
80104363:	53                   	push   %ebx
80104364:	83 ec 04             	sub    $0x4,%esp
80104367:	9c                   	pushf  
80104368:	5b                   	pop    %ebx
}

static inline void
cli(void)
{
  asm volatile("cli");
80104369:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010436a:	e8 71 f3 ff ff       	call   801036e0 <mycpu>
8010436f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104375:	85 c0                	test   %eax,%eax
80104377:	75 11                	jne    8010438a <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
80104379:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010437f:	e8 5c f3 ff ff       	call   801036e0 <mycpu>
80104384:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
8010438a:	e8 51 f3 ff ff       	call   801036e0 <mycpu>
8010438f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80104396:	83 c4 04             	add    $0x4,%esp
80104399:	5b                   	pop    %ebx
8010439a:	5d                   	pop    %ebp
8010439b:	c3                   	ret    
8010439c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801043a0 <popcli>:

void
popcli(void)
{
801043a0:	55                   	push   %ebp
801043a1:	89 e5                	mov    %esp,%ebp
801043a3:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801043a6:	9c                   	pushf  
801043a7:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801043a8:	f6 c4 02             	test   $0x2,%ah
801043ab:	75 52                	jne    801043ff <popcli+0x5f>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
801043ad:	e8 2e f3 ff ff       	call   801036e0 <mycpu>
801043b2:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
801043b8:	8d 51 ff             	lea    -0x1(%ecx),%edx
801043bb:	85 d2                	test   %edx,%edx
801043bd:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
801043c3:	78 2d                	js     801043f2 <popcli+0x52>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
801043c5:	e8 16 f3 ff ff       	call   801036e0 <mycpu>
801043ca:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
801043d0:	85 d2                	test   %edx,%edx
801043d2:	74 0c                	je     801043e0 <popcli+0x40>
    sti();
}
801043d4:	c9                   	leave  
801043d5:	c3                   	ret    
801043d6:	8d 76 00             	lea    0x0(%esi),%esi
801043d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
801043e0:	e8 fb f2 ff ff       	call   801036e0 <mycpu>
801043e5:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
801043eb:	85 c0                	test   %eax,%eax
801043ed:	74 e5                	je     801043d4 <popcli+0x34>
}

static inline void
sti(void)
{
  asm volatile("sti");
801043ef:	fb                   	sti    
    sti();
}
801043f0:	c9                   	leave  
801043f1:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
801043f2:	83 ec 0c             	sub    $0xc,%esp
801043f5:	68 ae 77 10 80       	push   $0x801077ae
801043fa:	e8 71 bf ff ff       	call   80100370 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
801043ff:	83 ec 0c             	sub    $0xc,%esp
80104402:	68 97 77 10 80       	push   $0x80107797
80104407:	e8 64 bf ff ff       	call   80100370 <panic>
8010440c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104410 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104410:	55                   	push   %ebp
80104411:	89 e5                	mov    %esp,%ebp
80104413:	56                   	push   %esi
80104414:	53                   	push   %ebx
80104415:	8b 75 08             	mov    0x8(%ebp),%esi
80104418:	31 db                	xor    %ebx,%ebx
  int r;
  pushcli();
8010441a:	e8 41 ff ff ff       	call   80104360 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
8010441f:	8b 06                	mov    (%esi),%eax
80104421:	85 c0                	test   %eax,%eax
80104423:	74 10                	je     80104435 <holding+0x25>
80104425:	8b 5e 08             	mov    0x8(%esi),%ebx
80104428:	e8 b3 f2 ff ff       	call   801036e0 <mycpu>
8010442d:	39 c3                	cmp    %eax,%ebx
8010442f:	0f 94 c3             	sete   %bl
80104432:	0f b6 db             	movzbl %bl,%ebx
  popcli();
80104435:	e8 66 ff ff ff       	call   801043a0 <popcli>
  return r;
}
8010443a:	89 d8                	mov    %ebx,%eax
8010443c:	5b                   	pop    %ebx
8010443d:	5e                   	pop    %esi
8010443e:	5d                   	pop    %ebp
8010443f:	c3                   	ret    

80104440 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
80104440:	55                   	push   %ebp
80104441:	89 e5                	mov    %esp,%ebp
80104443:	53                   	push   %ebx
80104444:	83 ec 04             	sub    $0x4,%esp
  pushcli(); // disable interrupts to avoid deadlock.
80104447:	e8 14 ff ff ff       	call   80104360 <pushcli>
  if(holding(lk))
8010444c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010444f:	83 ec 0c             	sub    $0xc,%esp
80104452:	53                   	push   %ebx
80104453:	e8 b8 ff ff ff       	call   80104410 <holding>
80104458:	83 c4 10             	add    $0x10,%esp
8010445b:	85 c0                	test   %eax,%eax
8010445d:	0f 85 7d 00 00 00    	jne    801044e0 <acquire+0xa0>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80104463:	ba 01 00 00 00       	mov    $0x1,%edx
80104468:	eb 09                	jmp    80104473 <acquire+0x33>
8010446a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104470:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104473:	89 d0                	mov    %edx,%eax
80104475:	f0 87 03             	lock xchg %eax,(%ebx)
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
80104478:	85 c0                	test   %eax,%eax
8010447a:	75 f4                	jne    80104470 <acquire+0x30>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
8010447c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
80104481:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104484:	e8 57 f2 ff ff       	call   801036e0 <mycpu>
getcallerpcs(void *v, uint pcs[])
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104489:	89 ea                	mov    %ebp,%edx
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
  getcallerpcs(&lk, lk->pcs);
8010448b:	8d 4b 0c             	lea    0xc(%ebx),%ecx
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
8010448e:	89 43 08             	mov    %eax,0x8(%ebx)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104491:	31 c0                	xor    %eax,%eax
80104493:	90                   	nop
80104494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104498:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
8010449e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801044a4:	77 1a                	ja     801044c0 <acquire+0x80>
      break;
    pcs[i] = ebp[1];     // saved %eip
801044a6:	8b 5a 04             	mov    0x4(%edx),%ebx
801044a9:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801044ac:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
801044af:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801044b1:	83 f8 0a             	cmp    $0xa,%eax
801044b4:	75 e2                	jne    80104498 <acquire+0x58>
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
  getcallerpcs(&lk, lk->pcs);
}
801044b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801044b9:	c9                   	leave  
801044ba:	c3                   	ret    
801044bb:	90                   	nop
801044bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
801044c0:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801044c7:	83 c0 01             	add    $0x1,%eax
801044ca:	83 f8 0a             	cmp    $0xa,%eax
801044cd:	74 e7                	je     801044b6 <acquire+0x76>
    pcs[i] = 0;
801044cf:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801044d6:	83 c0 01             	add    $0x1,%eax
801044d9:	83 f8 0a             	cmp    $0xa,%eax
801044dc:	75 e2                	jne    801044c0 <acquire+0x80>
801044de:	eb d6                	jmp    801044b6 <acquire+0x76>
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
801044e0:	83 ec 0c             	sub    $0xc,%esp
801044e3:	68 b5 77 10 80       	push   $0x801077b5
801044e8:	e8 83 be ff ff       	call   80100370 <panic>
801044ed:	8d 76 00             	lea    0x0(%esi),%esi

801044f0 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
801044f0:	55                   	push   %ebp
801044f1:	89 e5                	mov    %esp,%ebp
801044f3:	53                   	push   %ebx
801044f4:	83 ec 10             	sub    $0x10,%esp
801044f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
801044fa:	53                   	push   %ebx
801044fb:	e8 10 ff ff ff       	call   80104410 <holding>
80104500:	83 c4 10             	add    $0x10,%esp
80104503:	85 c0                	test   %eax,%eax
80104505:	74 22                	je     80104529 <release+0x39>
    panic("release");

  lk->pcs[0] = 0;
80104507:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
8010450e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
80104515:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
8010451a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)

  popcli();
}
80104520:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104523:	c9                   	leave  
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
80104524:	e9 77 fe ff ff       	jmp    801043a0 <popcli>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
80104529:	83 ec 0c             	sub    $0xc,%esp
8010452c:	68 bd 77 10 80       	push   $0x801077bd
80104531:	e8 3a be ff ff       	call   80100370 <panic>
80104536:	66 90                	xchg   %ax,%ax
80104538:	66 90                	xchg   %ax,%ax
8010453a:	66 90                	xchg   %ax,%ax
8010453c:	66 90                	xchg   %ax,%ax
8010453e:	66 90                	xchg   %ax,%ax

80104540 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	57                   	push   %edi
80104544:	53                   	push   %ebx
80104545:	8b 55 08             	mov    0x8(%ebp),%edx
80104548:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
8010454b:	f6 c2 03             	test   $0x3,%dl
8010454e:	75 05                	jne    80104555 <memset+0x15>
80104550:	f6 c1 03             	test   $0x3,%cl
80104553:	74 13                	je     80104568 <memset+0x28>
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
80104555:	89 d7                	mov    %edx,%edi
80104557:	8b 45 0c             	mov    0xc(%ebp),%eax
8010455a:	fc                   	cld    
8010455b:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
8010455d:	5b                   	pop    %ebx
8010455e:	89 d0                	mov    %edx,%eax
80104560:	5f                   	pop    %edi
80104561:	5d                   	pop    %ebp
80104562:	c3                   	ret    
80104563:	90                   	nop
80104564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

void*
memset(void *dst, int c, uint n)
{
  if ((int)dst%4 == 0 && n%4 == 0){
    c &= 0xFF;
80104568:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
}

static inline void
stosl(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosl" :
8010456c:	c1 e9 02             	shr    $0x2,%ecx
8010456f:	89 fb                	mov    %edi,%ebx
80104571:	89 f8                	mov    %edi,%eax
80104573:	c1 e3 18             	shl    $0x18,%ebx
80104576:	c1 e0 10             	shl    $0x10,%eax
80104579:	09 d8                	or     %ebx,%eax
8010457b:	09 f8                	or     %edi,%eax
8010457d:	c1 e7 08             	shl    $0x8,%edi
80104580:	09 f8                	or     %edi,%eax
80104582:	89 d7                	mov    %edx,%edi
80104584:	fc                   	cld    
80104585:	f3 ab                	rep stos %eax,%es:(%edi)
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
80104587:	5b                   	pop    %ebx
80104588:	89 d0                	mov    %edx,%eax
8010458a:	5f                   	pop    %edi
8010458b:	5d                   	pop    %ebp
8010458c:	c3                   	ret    
8010458d:	8d 76 00             	lea    0x0(%esi),%esi

80104590 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104590:	55                   	push   %ebp
80104591:	89 e5                	mov    %esp,%ebp
80104593:	57                   	push   %edi
80104594:	56                   	push   %esi
80104595:	8b 45 10             	mov    0x10(%ebp),%eax
80104598:	53                   	push   %ebx
80104599:	8b 75 0c             	mov    0xc(%ebp),%esi
8010459c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010459f:	85 c0                	test   %eax,%eax
801045a1:	74 29                	je     801045cc <memcmp+0x3c>
    if(*s1 != *s2)
801045a3:	0f b6 13             	movzbl (%ebx),%edx
801045a6:	0f b6 0e             	movzbl (%esi),%ecx
801045a9:	38 d1                	cmp    %dl,%cl
801045ab:	75 2b                	jne    801045d8 <memcmp+0x48>
801045ad:	8d 78 ff             	lea    -0x1(%eax),%edi
801045b0:	31 c0                	xor    %eax,%eax
801045b2:	eb 14                	jmp    801045c8 <memcmp+0x38>
801045b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045b8:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
801045bd:	83 c0 01             	add    $0x1,%eax
801045c0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
801045c4:	38 ca                	cmp    %cl,%dl
801045c6:	75 10                	jne    801045d8 <memcmp+0x48>
{
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
801045c8:	39 f8                	cmp    %edi,%eax
801045ca:	75 ec                	jne    801045b8 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
801045cc:	5b                   	pop    %ebx
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
801045cd:	31 c0                	xor    %eax,%eax
}
801045cf:	5e                   	pop    %esi
801045d0:	5f                   	pop    %edi
801045d1:	5d                   	pop    %ebp
801045d2:	c3                   	ret    
801045d3:	90                   	nop
801045d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
801045d8:	0f b6 c2             	movzbl %dl,%eax
    s1++, s2++;
  }

  return 0;
}
801045db:	5b                   	pop    %ebx

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
801045dc:	29 c8                	sub    %ecx,%eax
    s1++, s2++;
  }

  return 0;
}
801045de:	5e                   	pop    %esi
801045df:	5f                   	pop    %edi
801045e0:	5d                   	pop    %ebp
801045e1:	c3                   	ret    
801045e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045f0 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
801045f0:	55                   	push   %ebp
801045f1:	89 e5                	mov    %esp,%ebp
801045f3:	56                   	push   %esi
801045f4:	53                   	push   %ebx
801045f5:	8b 45 08             	mov    0x8(%ebp),%eax
801045f8:	8b 75 0c             	mov    0xc(%ebp),%esi
801045fb:	8b 5d 10             	mov    0x10(%ebp),%ebx
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
801045fe:	39 c6                	cmp    %eax,%esi
80104600:	73 2e                	jae    80104630 <memmove+0x40>
80104602:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104605:	39 c8                	cmp    %ecx,%eax
80104607:	73 27                	jae    80104630 <memmove+0x40>
    s += n;
    d += n;
    while(n-- > 0)
80104609:	85 db                	test   %ebx,%ebx
8010460b:	8d 53 ff             	lea    -0x1(%ebx),%edx
8010460e:	74 17                	je     80104627 <memmove+0x37>
      *--d = *--s;
80104610:	29 d9                	sub    %ebx,%ecx
80104612:	89 cb                	mov    %ecx,%ebx
80104614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104618:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
8010461c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
8010461f:	83 ea 01             	sub    $0x1,%edx
80104622:	83 fa ff             	cmp    $0xffffffff,%edx
80104625:	75 f1                	jne    80104618 <memmove+0x28>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
80104627:	5b                   	pop    %ebx
80104628:	5e                   	pop    %esi
80104629:	5d                   	pop    %ebp
8010462a:	c3                   	ret    
8010462b:	90                   	nop
8010462c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
80104630:	31 d2                	xor    %edx,%edx
80104632:	85 db                	test   %ebx,%ebx
80104634:	74 f1                	je     80104627 <memmove+0x37>
80104636:	8d 76 00             	lea    0x0(%esi),%esi
80104639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      *d++ = *s++;
80104640:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104644:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104647:	83 c2 01             	add    $0x1,%edx
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
8010464a:	39 d3                	cmp    %edx,%ebx
8010464c:	75 f2                	jne    80104640 <memmove+0x50>
      *d++ = *s++;

  return dst;
}
8010464e:	5b                   	pop    %ebx
8010464f:	5e                   	pop    %esi
80104650:	5d                   	pop    %ebp
80104651:	c3                   	ret    
80104652:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104660 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104660:	55                   	push   %ebp
80104661:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104663:	5d                   	pop    %ebp

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
80104664:	eb 8a                	jmp    801045f0 <memmove>
80104666:	8d 76 00             	lea    0x0(%esi),%esi
80104669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104670 <strncmp>:
}

int
strncmp(const char *p, const char *q, uint n)
{
80104670:	55                   	push   %ebp
80104671:	89 e5                	mov    %esp,%ebp
80104673:	57                   	push   %edi
80104674:	56                   	push   %esi
80104675:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104678:	53                   	push   %ebx
80104679:	8b 7d 08             	mov    0x8(%ebp),%edi
8010467c:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
8010467f:	85 c9                	test   %ecx,%ecx
80104681:	74 37                	je     801046ba <strncmp+0x4a>
80104683:	0f b6 17             	movzbl (%edi),%edx
80104686:	0f b6 1e             	movzbl (%esi),%ebx
80104689:	84 d2                	test   %dl,%dl
8010468b:	74 3f                	je     801046cc <strncmp+0x5c>
8010468d:	38 d3                	cmp    %dl,%bl
8010468f:	75 3b                	jne    801046cc <strncmp+0x5c>
80104691:	8d 47 01             	lea    0x1(%edi),%eax
80104694:	01 cf                	add    %ecx,%edi
80104696:	eb 1b                	jmp    801046b3 <strncmp+0x43>
80104698:	90                   	nop
80104699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046a0:	0f b6 10             	movzbl (%eax),%edx
801046a3:	84 d2                	test   %dl,%dl
801046a5:	74 21                	je     801046c8 <strncmp+0x58>
801046a7:	0f b6 19             	movzbl (%ecx),%ebx
801046aa:	83 c0 01             	add    $0x1,%eax
801046ad:	89 ce                	mov    %ecx,%esi
801046af:	38 da                	cmp    %bl,%dl
801046b1:	75 19                	jne    801046cc <strncmp+0x5c>
801046b3:	39 c7                	cmp    %eax,%edi
    n--, p++, q++;
801046b5:	8d 4e 01             	lea    0x1(%esi),%ecx
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
801046b8:	75 e6                	jne    801046a0 <strncmp+0x30>
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
801046ba:	5b                   	pop    %ebx
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
801046bb:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}
801046bd:	5e                   	pop    %esi
801046be:	5f                   	pop    %edi
801046bf:	5d                   	pop    %ebp
801046c0:	c3                   	ret    
801046c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046c8:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
801046cc:	0f b6 c2             	movzbl %dl,%eax
801046cf:	29 d8                	sub    %ebx,%eax
}
801046d1:	5b                   	pop    %ebx
801046d2:	5e                   	pop    %esi
801046d3:	5f                   	pop    %edi
801046d4:	5d                   	pop    %ebp
801046d5:	c3                   	ret    
801046d6:	8d 76 00             	lea    0x0(%esi),%esi
801046d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046e0 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
801046e0:	55                   	push   %ebp
801046e1:	89 e5                	mov    %esp,%ebp
801046e3:	56                   	push   %esi
801046e4:	53                   	push   %ebx
801046e5:	8b 45 08             	mov    0x8(%ebp),%eax
801046e8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801046eb:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
801046ee:	89 c2                	mov    %eax,%edx
801046f0:	eb 19                	jmp    8010470b <strncpy+0x2b>
801046f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046f8:	83 c3 01             	add    $0x1,%ebx
801046fb:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
801046ff:	83 c2 01             	add    $0x1,%edx
80104702:	84 c9                	test   %cl,%cl
80104704:	88 4a ff             	mov    %cl,-0x1(%edx)
80104707:	74 09                	je     80104712 <strncpy+0x32>
80104709:	89 f1                	mov    %esi,%ecx
8010470b:	85 c9                	test   %ecx,%ecx
8010470d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104710:	7f e6                	jg     801046f8 <strncpy+0x18>
    ;
  while(n-- > 0)
80104712:	31 c9                	xor    %ecx,%ecx
80104714:	85 f6                	test   %esi,%esi
80104716:	7e 17                	jle    8010472f <strncpy+0x4f>
80104718:	90                   	nop
80104719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
80104720:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104724:	89 f3                	mov    %esi,%ebx
80104726:	83 c1 01             	add    $0x1,%ecx
80104729:	29 cb                	sub    %ecx,%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
8010472b:	85 db                	test   %ebx,%ebx
8010472d:	7f f1                	jg     80104720 <strncpy+0x40>
    *s++ = 0;
  return os;
}
8010472f:	5b                   	pop    %ebx
80104730:	5e                   	pop    %esi
80104731:	5d                   	pop    %ebp
80104732:	c3                   	ret    
80104733:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104740 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104740:	55                   	push   %ebp
80104741:	89 e5                	mov    %esp,%ebp
80104743:	56                   	push   %esi
80104744:	53                   	push   %ebx
80104745:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104748:	8b 45 08             	mov    0x8(%ebp),%eax
8010474b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
8010474e:	85 c9                	test   %ecx,%ecx
80104750:	7e 26                	jle    80104778 <safestrcpy+0x38>
80104752:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104756:	89 c1                	mov    %eax,%ecx
80104758:	eb 17                	jmp    80104771 <safestrcpy+0x31>
8010475a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104760:	83 c2 01             	add    $0x1,%edx
80104763:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104767:	83 c1 01             	add    $0x1,%ecx
8010476a:	84 db                	test   %bl,%bl
8010476c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010476f:	74 04                	je     80104775 <safestrcpy+0x35>
80104771:	39 f2                	cmp    %esi,%edx
80104773:	75 eb                	jne    80104760 <safestrcpy+0x20>
    ;
  *s = 0;
80104775:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104778:	5b                   	pop    %ebx
80104779:	5e                   	pop    %esi
8010477a:	5d                   	pop    %ebp
8010477b:	c3                   	ret    
8010477c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104780 <strlen>:

int
strlen(const char *s)
{
80104780:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104781:	31 c0                	xor    %eax,%eax
  return os;
}

int
strlen(const char *s)
{
80104783:	89 e5                	mov    %esp,%ebp
80104785:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
80104788:	80 3a 00             	cmpb   $0x0,(%edx)
8010478b:	74 0c                	je     80104799 <strlen+0x19>
8010478d:	8d 76 00             	lea    0x0(%esi),%esi
80104790:	83 c0 01             	add    $0x1,%eax
80104793:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104797:	75 f7                	jne    80104790 <strlen+0x10>
    ;
  return n;
}
80104799:	5d                   	pop    %ebp
8010479a:	c3                   	ret    

8010479b <swtch>:
8010479b:	8b 44 24 04          	mov    0x4(%esp),%eax
8010479f:	8b 54 24 08          	mov    0x8(%esp),%edx
801047a3:	55                   	push   %ebp
801047a4:	53                   	push   %ebx
801047a5:	56                   	push   %esi
801047a6:	57                   	push   %edi
801047a7:	89 20                	mov    %esp,(%eax)
801047a9:	89 d4                	mov    %edx,%esp
801047ab:	5f                   	pop    %edi
801047ac:	5e                   	pop    %esi
801047ad:	5b                   	pop    %ebx
801047ae:	5d                   	pop    %ebp
801047af:	c3                   	ret    

801047b0 <fetchint>:

// Fetch the int at addr from the current process.

int
fetchint(uint addr, int *ip)
{
801047b0:	55                   	push   %ebp
801047b1:	89 e5                	mov    %esp,%ebp
801047b3:	53                   	push   %ebx
801047b4:	83 ec 04             	sub    $0x4,%esp
801047b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
801047ba:	e8 c1 ef ff ff       	call   80103780 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
801047bf:	8b 00                	mov    (%eax),%eax
801047c1:	39 d8                	cmp    %ebx,%eax
801047c3:	76 1b                	jbe    801047e0 <fetchint+0x30>
801047c5:	8d 53 04             	lea    0x4(%ebx),%edx
801047c8:	39 d0                	cmp    %edx,%eax
801047ca:	72 14                	jb     801047e0 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
801047cc:	8b 45 0c             	mov    0xc(%ebp),%eax
801047cf:	8b 13                	mov    (%ebx),%edx
801047d1:	89 10                	mov    %edx,(%eax)
  return 0;
801047d3:	31 c0                	xor    %eax,%eax
}
801047d5:	83 c4 04             	add    $0x4,%esp
801047d8:	5b                   	pop    %ebx
801047d9:	5d                   	pop    %ebp
801047da:	c3                   	ret    
801047db:	90                   	nop
801047dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
    return -1;
801047e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801047e5:	eb ee                	jmp    801047d5 <fetchint+0x25>
801047e7:	89 f6                	mov    %esi,%esi
801047e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047f0 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801047f0:	55                   	push   %ebp
801047f1:	89 e5                	mov    %esp,%ebp
801047f3:	53                   	push   %ebx
801047f4:	83 ec 04             	sub    $0x4,%esp
801047f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
801047fa:	e8 81 ef ff ff       	call   80103780 <myproc>

  if(addr >= curproc->sz)
801047ff:	39 18                	cmp    %ebx,(%eax)
80104801:	76 29                	jbe    8010482c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104803:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104806:	89 da                	mov    %ebx,%edx
80104808:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
8010480a:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
8010480c:	39 c3                	cmp    %eax,%ebx
8010480e:	73 1c                	jae    8010482c <fetchstr+0x3c>
    if(*s == 0)
80104810:	80 3b 00             	cmpb   $0x0,(%ebx)
80104813:	75 10                	jne    80104825 <fetchstr+0x35>
80104815:	eb 29                	jmp    80104840 <fetchstr+0x50>
80104817:	89 f6                	mov    %esi,%esi
80104819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104820:	80 3a 00             	cmpb   $0x0,(%edx)
80104823:	74 1b                	je     80104840 <fetchstr+0x50>

  if(addr >= curproc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
80104825:	83 c2 01             	add    $0x1,%edx
80104828:	39 d0                	cmp    %edx,%eax
8010482a:	77 f4                	ja     80104820 <fetchstr+0x30>
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}
8010482c:	83 c4 04             	add    $0x4,%esp
{
  char *s, *ep;
  struct proc *curproc = myproc();

  if(addr >= curproc->sz)
    return -1;
8010482f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}
80104834:	5b                   	pop    %ebx
80104835:	5d                   	pop    %ebp
80104836:	c3                   	ret    
80104837:	89 f6                	mov    %esi,%esi
80104839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104840:	83 c4 04             	add    $0x4,%esp
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
80104843:	89 d0                	mov    %edx,%eax
80104845:	29 d8                	sub    %ebx,%eax
  }
  return -1;
}
80104847:	5b                   	pop    %ebx
80104848:	5d                   	pop    %ebp
80104849:	c3                   	ret    
8010484a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104850 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104850:	55                   	push   %ebp
80104851:	89 e5                	mov    %esp,%ebp
80104853:	56                   	push   %esi
80104854:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104855:	e8 26 ef ff ff       	call   80103780 <myproc>
8010485a:	8b 40 18             	mov    0x18(%eax),%eax
8010485d:	8b 55 08             	mov    0x8(%ebp),%edx
80104860:	8b 40 44             	mov    0x44(%eax),%eax
80104863:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
// Fetch the int at addr from the current process.

int
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();
80104866:	e8 15 ef ff ff       	call   80103780 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010486b:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
8010486d:	8d 73 04             	lea    0x4(%ebx),%esi
int
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104870:	39 c6                	cmp    %eax,%esi
80104872:	73 1c                	jae    80104890 <argint+0x40>
80104874:	8d 53 08             	lea    0x8(%ebx),%edx
80104877:	39 d0                	cmp    %edx,%eax
80104879:	72 15                	jb     80104890 <argint+0x40>
    return -1;
  *ip = *(int*)(addr);
8010487b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010487e:	8b 53 04             	mov    0x4(%ebx),%edx
80104881:	89 10                	mov    %edx,(%eax)
  return 0;
80104883:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
}
80104885:	5b                   	pop    %ebx
80104886:	5e                   	pop    %esi
80104887:	5d                   	pop    %ebp
80104888:	c3                   	ret    
80104889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
    return -1;
80104890:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104895:	eb ee                	jmp    80104885 <argint+0x35>
80104897:	89 f6                	mov    %esi,%esi
80104899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048a0 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
801048a0:	55                   	push   %ebp
801048a1:	89 e5                	mov    %esp,%ebp
801048a3:	56                   	push   %esi
801048a4:	53                   	push   %ebx
801048a5:	83 ec 10             	sub    $0x10,%esp
801048a8:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
801048ab:	e8 d0 ee ff ff       	call   80103780 <myproc>
801048b0:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
801048b2:	8d 45 f4             	lea    -0xc(%ebp),%eax
801048b5:	83 ec 08             	sub    $0x8,%esp
801048b8:	50                   	push   %eax
801048b9:	ff 75 08             	pushl  0x8(%ebp)
801048bc:	e8 8f ff ff ff       	call   80104850 <argint>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
801048c1:	c1 e8 1f             	shr    $0x1f,%eax
801048c4:	83 c4 10             	add    $0x10,%esp
801048c7:	84 c0                	test   %al,%al
801048c9:	75 2d                	jne    801048f8 <argptr+0x58>
801048cb:	89 d8                	mov    %ebx,%eax
801048cd:	c1 e8 1f             	shr    $0x1f,%eax
801048d0:	84 c0                	test   %al,%al
801048d2:	75 24                	jne    801048f8 <argptr+0x58>
801048d4:	8b 16                	mov    (%esi),%edx
801048d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801048d9:	39 c2                	cmp    %eax,%edx
801048db:	76 1b                	jbe    801048f8 <argptr+0x58>
801048dd:	01 c3                	add    %eax,%ebx
801048df:	39 da                	cmp    %ebx,%edx
801048e1:	72 15                	jb     801048f8 <argptr+0x58>
    return -1;
  *pp = (char*)i;
801048e3:	8b 55 0c             	mov    0xc(%ebp),%edx
801048e6:	89 02                	mov    %eax,(%edx)
  return 0;
801048e8:	31 c0                	xor    %eax,%eax
}
801048ea:	8d 65 f8             	lea    -0x8(%ebp),%esp
801048ed:	5b                   	pop    %ebx
801048ee:	5e                   	pop    %esi
801048ef:	5d                   	pop    %ebp
801048f0:	c3                   	ret    
801048f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct proc *curproc = myproc();
 
  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
    return -1;
801048f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801048fd:	eb eb                	jmp    801048ea <argptr+0x4a>
801048ff:	90                   	nop

80104900 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104900:	55                   	push   %ebp
80104901:	89 e5                	mov    %esp,%ebp
80104903:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
80104906:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104909:	50                   	push   %eax
8010490a:	ff 75 08             	pushl  0x8(%ebp)
8010490d:	e8 3e ff ff ff       	call   80104850 <argint>
80104912:	83 c4 10             	add    $0x10,%esp
80104915:	85 c0                	test   %eax,%eax
80104917:	78 17                	js     80104930 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
80104919:	83 ec 08             	sub    $0x8,%esp
8010491c:	ff 75 0c             	pushl  0xc(%ebp)
8010491f:	ff 75 f4             	pushl  -0xc(%ebp)
80104922:	e8 c9 fe ff ff       	call   801047f0 <fetchstr>
80104927:	83 c4 10             	add    $0x10,%esp
}
8010492a:	c9                   	leave  
8010492b:	c3                   	ret    
8010492c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
80104930:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
80104935:	c9                   	leave  
80104936:	c3                   	ret    
80104937:	89 f6                	mov    %esi,%esi
80104939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104940 <syscall>:
[SYS_procdump] sys_procdump,
};

void
syscall(void)
{
80104940:	55                   	push   %ebp
80104941:	89 e5                	mov    %esp,%ebp
80104943:	56                   	push   %esi
80104944:	53                   	push   %ebx
  int num;
  struct proc *curproc = myproc();
80104945:	e8 36 ee ff ff       	call   80103780 <myproc>

  num = curproc->tf->eax;
8010494a:	8b 70 18             	mov    0x18(%eax),%esi

void
syscall(void)
{
  int num;
  struct proc *curproc = myproc();
8010494d:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
8010494f:	8b 46 1c             	mov    0x1c(%esi),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104952:	8d 50 ff             	lea    -0x1(%eax),%edx
80104955:	83 fa 15             	cmp    $0x15,%edx
80104958:	77 1e                	ja     80104978 <syscall+0x38>
8010495a:	8b 14 85 00 78 10 80 	mov    -0x7fef8800(,%eax,4),%edx
80104961:	85 d2                	test   %edx,%edx
80104963:	74 13                	je     80104978 <syscall+0x38>
    curproc->tf->eax = syscalls[num]();
80104965:	ff d2                	call   *%edx
80104967:	89 46 1c             	mov    %eax,0x1c(%esi)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
8010496a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010496d:	5b                   	pop    %ebx
8010496e:	5e                   	pop    %esi
8010496f:	5d                   	pop    %ebp
80104970:	c3                   	ret    
80104971:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  num = curproc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104978:	50                   	push   %eax
            curproc->pid, curproc->name, num);
80104979:	8d 43 6c             	lea    0x6c(%ebx),%eax

  num = curproc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
8010497c:	50                   	push   %eax
8010497d:	ff 73 10             	pushl  0x10(%ebx)
80104980:	68 c5 77 10 80       	push   $0x801077c5
80104985:	e8 d6 bc ff ff       	call   80100660 <cprintf>
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
8010498a:	8b 43 18             	mov    0x18(%ebx),%eax
8010498d:	83 c4 10             	add    $0x10,%esp
80104990:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
80104997:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010499a:	5b                   	pop    %ebx
8010499b:	5e                   	pop    %esi
8010499c:	5d                   	pop    %ebp
8010499d:	c3                   	ret    
8010499e:	66 90                	xchg   %ax,%ax

801049a0 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801049a0:	55                   	push   %ebp
801049a1:	89 e5                	mov    %esp,%ebp
801049a3:	57                   	push   %edi
801049a4:	56                   	push   %esi
801049a5:	53                   	push   %ebx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801049a6:	8d 75 da             	lea    -0x26(%ebp),%esi
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801049a9:	83 ec 44             	sub    $0x44,%esp
801049ac:	89 4d c0             	mov    %ecx,-0x40(%ebp)
801049af:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801049b2:	56                   	push   %esi
801049b3:	50                   	push   %eax
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801049b4:	89 55 c4             	mov    %edx,-0x3c(%ebp)
801049b7:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801049ba:	e8 21 d5 ff ff       	call   80101ee0 <nameiparent>
801049bf:	83 c4 10             	add    $0x10,%esp
801049c2:	85 c0                	test   %eax,%eax
801049c4:	0f 84 f6 00 00 00    	je     80104ac0 <create+0x120>
    return 0;
  ilock(dp);
801049ca:	83 ec 0c             	sub    $0xc,%esp
801049cd:	89 c7                	mov    %eax,%edi
801049cf:	50                   	push   %eax
801049d0:	e8 9b cc ff ff       	call   80101670 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
801049d5:	8d 45 d4             	lea    -0x2c(%ebp),%eax
801049d8:	83 c4 0c             	add    $0xc,%esp
801049db:	50                   	push   %eax
801049dc:	56                   	push   %esi
801049dd:	57                   	push   %edi
801049de:	e8 bd d1 ff ff       	call   80101ba0 <dirlookup>
801049e3:	83 c4 10             	add    $0x10,%esp
801049e6:	85 c0                	test   %eax,%eax
801049e8:	89 c3                	mov    %eax,%ebx
801049ea:	74 54                	je     80104a40 <create+0xa0>
    iunlockput(dp);
801049ec:	83 ec 0c             	sub    $0xc,%esp
801049ef:	57                   	push   %edi
801049f0:	e8 0b cf ff ff       	call   80101900 <iunlockput>
    ilock(ip);
801049f5:	89 1c 24             	mov    %ebx,(%esp)
801049f8:	e8 73 cc ff ff       	call   80101670 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
801049fd:	83 c4 10             	add    $0x10,%esp
80104a00:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104a05:	75 19                	jne    80104a20 <create+0x80>
80104a07:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
80104a0c:	89 d8                	mov    %ebx,%eax
80104a0e:	75 10                	jne    80104a20 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104a10:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104a13:	5b                   	pop    %ebx
80104a14:	5e                   	pop    %esi
80104a15:	5f                   	pop    %edi
80104a16:	5d                   	pop    %ebp
80104a17:	c3                   	ret    
80104a18:	90                   	nop
80104a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104a20:	83 ec 0c             	sub    $0xc,%esp
80104a23:	53                   	push   %ebx
80104a24:	e8 d7 ce ff ff       	call   80101900 <iunlockput>
    return 0;
80104a29:	83 c4 10             	add    $0x10,%esp
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104a2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
80104a2f:	31 c0                	xor    %eax,%eax
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104a31:	5b                   	pop    %ebx
80104a32:	5e                   	pop    %esi
80104a33:	5f                   	pop    %edi
80104a34:	5d                   	pop    %ebp
80104a35:	c3                   	ret    
80104a36:	8d 76 00             	lea    0x0(%esi),%esi
80104a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80104a40:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104a44:	83 ec 08             	sub    $0x8,%esp
80104a47:	50                   	push   %eax
80104a48:	ff 37                	pushl  (%edi)
80104a4a:	e8 b1 ca ff ff       	call   80101500 <ialloc>
80104a4f:	83 c4 10             	add    $0x10,%esp
80104a52:	85 c0                	test   %eax,%eax
80104a54:	89 c3                	mov    %eax,%ebx
80104a56:	0f 84 cc 00 00 00    	je     80104b28 <create+0x188>
    panic("create: ialloc");

  ilock(ip);
80104a5c:	83 ec 0c             	sub    $0xc,%esp
80104a5f:	50                   	push   %eax
80104a60:	e8 0b cc ff ff       	call   80101670 <ilock>
  ip->major = major;
80104a65:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104a69:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
80104a6d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104a71:	66 89 43 54          	mov    %ax,0x54(%ebx)
  ip->nlink = 1;
80104a75:	b8 01 00 00 00       	mov    $0x1,%eax
80104a7a:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
80104a7e:	89 1c 24             	mov    %ebx,(%esp)
80104a81:	e8 3a cb ff ff       	call   801015c0 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
80104a86:	83 c4 10             	add    $0x10,%esp
80104a89:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104a8e:	74 40                	je     80104ad0 <create+0x130>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
80104a90:	83 ec 04             	sub    $0x4,%esp
80104a93:	ff 73 04             	pushl  0x4(%ebx)
80104a96:	56                   	push   %esi
80104a97:	57                   	push   %edi
80104a98:	e8 63 d3 ff ff       	call   80101e00 <dirlink>
80104a9d:	83 c4 10             	add    $0x10,%esp
80104aa0:	85 c0                	test   %eax,%eax
80104aa2:	78 77                	js     80104b1b <create+0x17b>
    panic("create: dirlink");

  iunlockput(dp);
80104aa4:	83 ec 0c             	sub    $0xc,%esp
80104aa7:	57                   	push   %edi
80104aa8:	e8 53 ce ff ff       	call   80101900 <iunlockput>

  return ip;
80104aad:	83 c4 10             	add    $0x10,%esp
}
80104ab0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
80104ab3:	89 d8                	mov    %ebx,%eax
}
80104ab5:	5b                   	pop    %ebx
80104ab6:	5e                   	pop    %esi
80104ab7:	5f                   	pop    %edi
80104ab8:	5d                   	pop    %ebp
80104ab9:	c3                   	ret    
80104aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
80104ac0:	31 c0                	xor    %eax,%eax
80104ac2:	e9 49 ff ff ff       	jmp    80104a10 <create+0x70>
80104ac7:	89 f6                	mov    %esi,%esi
80104ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
80104ad0:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
80104ad5:	83 ec 0c             	sub    $0xc,%esp
80104ad8:	57                   	push   %edi
80104ad9:	e8 e2 ca ff ff       	call   801015c0 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104ade:	83 c4 0c             	add    $0xc,%esp
80104ae1:	ff 73 04             	pushl  0x4(%ebx)
80104ae4:	68 78 78 10 80       	push   $0x80107878
80104ae9:	53                   	push   %ebx
80104aea:	e8 11 d3 ff ff       	call   80101e00 <dirlink>
80104aef:	83 c4 10             	add    $0x10,%esp
80104af2:	85 c0                	test   %eax,%eax
80104af4:	78 18                	js     80104b0e <create+0x16e>
80104af6:	83 ec 04             	sub    $0x4,%esp
80104af9:	ff 77 04             	pushl  0x4(%edi)
80104afc:	68 77 78 10 80       	push   $0x80107877
80104b01:	53                   	push   %ebx
80104b02:	e8 f9 d2 ff ff       	call   80101e00 <dirlink>
80104b07:	83 c4 10             	add    $0x10,%esp
80104b0a:	85 c0                	test   %eax,%eax
80104b0c:	79 82                	jns    80104a90 <create+0xf0>
      panic("create dots");
80104b0e:	83 ec 0c             	sub    $0xc,%esp
80104b11:	68 6b 78 10 80       	push   $0x8010786b
80104b16:	e8 55 b8 ff ff       	call   80100370 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
80104b1b:	83 ec 0c             	sub    $0xc,%esp
80104b1e:	68 7a 78 10 80       	push   $0x8010787a
80104b23:	e8 48 b8 ff ff       	call   80100370 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
80104b28:	83 ec 0c             	sub    $0xc,%esp
80104b2b:	68 5c 78 10 80       	push   $0x8010785c
80104b30:	e8 3b b8 ff ff       	call   80100370 <panic>
80104b35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b40 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104b40:	55                   	push   %ebp
80104b41:	89 e5                	mov    %esp,%ebp
80104b43:	56                   	push   %esi
80104b44:	53                   	push   %ebx
80104b45:	89 c6                	mov    %eax,%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104b47:	8d 45 f4             	lea    -0xc(%ebp),%eax
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104b4a:	89 d3                	mov    %edx,%ebx
80104b4c:	83 ec 18             	sub    $0x18,%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104b4f:	50                   	push   %eax
80104b50:	6a 00                	push   $0x0
80104b52:	e8 f9 fc ff ff       	call   80104850 <argint>
80104b57:	83 c4 10             	add    $0x10,%esp
80104b5a:	85 c0                	test   %eax,%eax
80104b5c:	78 32                	js     80104b90 <argfd.constprop.0+0x50>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104b5e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104b62:	77 2c                	ja     80104b90 <argfd.constprop.0+0x50>
80104b64:	e8 17 ec ff ff       	call   80103780 <myproc>
80104b69:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104b6c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104b70:	85 c0                	test   %eax,%eax
80104b72:	74 1c                	je     80104b90 <argfd.constprop.0+0x50>
    return -1;
  if(pfd)
80104b74:	85 f6                	test   %esi,%esi
80104b76:	74 02                	je     80104b7a <argfd.constprop.0+0x3a>
    *pfd = fd;
80104b78:	89 16                	mov    %edx,(%esi)
  if(pf)
80104b7a:	85 db                	test   %ebx,%ebx
80104b7c:	74 22                	je     80104ba0 <argfd.constprop.0+0x60>
    *pf = f;
80104b7e:	89 03                	mov    %eax,(%ebx)
  return 0;
80104b80:	31 c0                	xor    %eax,%eax
}
80104b82:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104b85:	5b                   	pop    %ebx
80104b86:	5e                   	pop    %esi
80104b87:	5d                   	pop    %ebp
80104b88:	c3                   	ret    
80104b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b90:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
80104b93:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
}
80104b98:	5b                   	pop    %ebx
80104b99:	5e                   	pop    %esi
80104b9a:	5d                   	pop    %ebp
80104b9b:	c3                   	ret    
80104b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
80104ba0:	31 c0                	xor    %eax,%eax
80104ba2:	eb de                	jmp    80104b82 <argfd.constprop.0+0x42>
80104ba4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104baa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104bb0 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
80104bb0:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104bb1:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
80104bb3:	89 e5                	mov    %esp,%ebp
80104bb5:	56                   	push   %esi
80104bb6:	53                   	push   %ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104bb7:	8d 55 f4             	lea    -0xc(%ebp),%edx
  return -1;
}

int
sys_dup(void)
{
80104bba:	83 ec 10             	sub    $0x10,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104bbd:	e8 7e ff ff ff       	call   80104b40 <argfd.constprop.0>
80104bc2:	85 c0                	test   %eax,%eax
80104bc4:	78 1a                	js     80104be0 <sys_dup+0x30>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80104bc6:	31 db                	xor    %ebx,%ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
80104bc8:	8b 75 f4             	mov    -0xc(%ebp),%esi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80104bcb:	e8 b0 eb ff ff       	call   80103780 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
80104bd0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104bd4:	85 d2                	test   %edx,%edx
80104bd6:	74 18                	je     80104bf0 <sys_dup+0x40>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80104bd8:	83 c3 01             	add    $0x1,%ebx
80104bdb:	83 fb 10             	cmp    $0x10,%ebx
80104bde:	75 f0                	jne    80104bd0 <sys_dup+0x20>
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104be0:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
80104be3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104be8:	5b                   	pop    %ebx
80104be9:	5e                   	pop    %esi
80104bea:	5d                   	pop    %ebp
80104beb:	c3                   	ret    
80104bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80104bf0:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104bf4:	83 ec 0c             	sub    $0xc,%esp
80104bf7:	ff 75 f4             	pushl  -0xc(%ebp)
80104bfa:	e8 e1 c1 ff ff       	call   80100de0 <filedup>
  return fd;
80104bff:	83 c4 10             	add    $0x10,%esp
}
80104c02:	8d 65 f8             	lea    -0x8(%ebp),%esp
  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
80104c05:	89 d8                	mov    %ebx,%eax
}
80104c07:	5b                   	pop    %ebx
80104c08:	5e                   	pop    %esi
80104c09:	5d                   	pop    %ebp
80104c0a:	c3                   	ret    
80104c0b:	90                   	nop
80104c0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104c10 <sys_read>:

int
sys_read(void)
{
80104c10:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c11:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
80104c13:	89 e5                	mov    %esp,%ebp
80104c15:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c18:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104c1b:	e8 20 ff ff ff       	call   80104b40 <argfd.constprop.0>
80104c20:	85 c0                	test   %eax,%eax
80104c22:	78 4c                	js     80104c70 <sys_read+0x60>
80104c24:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c27:	83 ec 08             	sub    $0x8,%esp
80104c2a:	50                   	push   %eax
80104c2b:	6a 02                	push   $0x2
80104c2d:	e8 1e fc ff ff       	call   80104850 <argint>
80104c32:	83 c4 10             	add    $0x10,%esp
80104c35:	85 c0                	test   %eax,%eax
80104c37:	78 37                	js     80104c70 <sys_read+0x60>
80104c39:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c3c:	83 ec 04             	sub    $0x4,%esp
80104c3f:	ff 75 f0             	pushl  -0x10(%ebp)
80104c42:	50                   	push   %eax
80104c43:	6a 01                	push   $0x1
80104c45:	e8 56 fc ff ff       	call   801048a0 <argptr>
80104c4a:	83 c4 10             	add    $0x10,%esp
80104c4d:	85 c0                	test   %eax,%eax
80104c4f:	78 1f                	js     80104c70 <sys_read+0x60>
    return -1;
  return fileread(f, p, n);
80104c51:	83 ec 04             	sub    $0x4,%esp
80104c54:	ff 75 f0             	pushl  -0x10(%ebp)
80104c57:	ff 75 f4             	pushl  -0xc(%ebp)
80104c5a:	ff 75 ec             	pushl  -0x14(%ebp)
80104c5d:	e8 ee c2 ff ff       	call   80100f50 <fileread>
80104c62:	83 c4 10             	add    $0x10,%esp
}
80104c65:	c9                   	leave  
80104c66:	c3                   	ret    
80104c67:	89 f6                	mov    %esi,%esi
80104c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104c70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fileread(f, p, n);
}
80104c75:	c9                   	leave  
80104c76:	c3                   	ret    
80104c77:	89 f6                	mov    %esi,%esi
80104c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c80 <sys_write>:

int
sys_write(void)
{
80104c80:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c81:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104c83:	89 e5                	mov    %esp,%ebp
80104c85:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c88:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104c8b:	e8 b0 fe ff ff       	call   80104b40 <argfd.constprop.0>
80104c90:	85 c0                	test   %eax,%eax
80104c92:	78 4c                	js     80104ce0 <sys_write+0x60>
80104c94:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c97:	83 ec 08             	sub    $0x8,%esp
80104c9a:	50                   	push   %eax
80104c9b:	6a 02                	push   $0x2
80104c9d:	e8 ae fb ff ff       	call   80104850 <argint>
80104ca2:	83 c4 10             	add    $0x10,%esp
80104ca5:	85 c0                	test   %eax,%eax
80104ca7:	78 37                	js     80104ce0 <sys_write+0x60>
80104ca9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cac:	83 ec 04             	sub    $0x4,%esp
80104caf:	ff 75 f0             	pushl  -0x10(%ebp)
80104cb2:	50                   	push   %eax
80104cb3:	6a 01                	push   $0x1
80104cb5:	e8 e6 fb ff ff       	call   801048a0 <argptr>
80104cba:	83 c4 10             	add    $0x10,%esp
80104cbd:	85 c0                	test   %eax,%eax
80104cbf:	78 1f                	js     80104ce0 <sys_write+0x60>
    return -1;
  return filewrite(f, p, n);
80104cc1:	83 ec 04             	sub    $0x4,%esp
80104cc4:	ff 75 f0             	pushl  -0x10(%ebp)
80104cc7:	ff 75 f4             	pushl  -0xc(%ebp)
80104cca:	ff 75 ec             	pushl  -0x14(%ebp)
80104ccd:	e8 0e c3 ff ff       	call   80100fe0 <filewrite>
80104cd2:	83 c4 10             	add    $0x10,%esp
}
80104cd5:	c9                   	leave  
80104cd6:	c3                   	ret    
80104cd7:	89 f6                	mov    %esi,%esi
80104cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104ce0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filewrite(f, p, n);
}
80104ce5:	c9                   	leave  
80104ce6:	c3                   	ret    
80104ce7:	89 f6                	mov    %esi,%esi
80104ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cf0 <sys_close>:

int
sys_close(void)
{
80104cf0:	55                   	push   %ebp
80104cf1:	89 e5                	mov    %esp,%ebp
80104cf3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80104cf6:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104cf9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104cfc:	e8 3f fe ff ff       	call   80104b40 <argfd.constprop.0>
80104d01:	85 c0                	test   %eax,%eax
80104d03:	78 2b                	js     80104d30 <sys_close+0x40>
    return -1;
  myproc()->ofile[fd] = 0;
80104d05:	e8 76 ea ff ff       	call   80103780 <myproc>
80104d0a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
80104d0d:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  myproc()->ofile[fd] = 0;
80104d10:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104d17:	00 
  fileclose(f);
80104d18:	ff 75 f4             	pushl  -0xc(%ebp)
80104d1b:	e8 10 c1 ff ff       	call   80100e30 <fileclose>
  return 0;
80104d20:	83 c4 10             	add    $0x10,%esp
80104d23:	31 c0                	xor    %eax,%eax
}
80104d25:	c9                   	leave  
80104d26:	c3                   	ret    
80104d27:	89 f6                	mov    %esi,%esi
80104d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
80104d30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  myproc()->ofile[fd] = 0;
  fileclose(f);
  return 0;
}
80104d35:	c9                   	leave  
80104d36:	c3                   	ret    
80104d37:	89 f6                	mov    %esi,%esi
80104d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d40 <sys_fstat>:

int
sys_fstat(void)
{
80104d40:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104d41:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80104d43:	89 e5                	mov    %esp,%ebp
80104d45:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104d48:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104d4b:	e8 f0 fd ff ff       	call   80104b40 <argfd.constprop.0>
80104d50:	85 c0                	test   %eax,%eax
80104d52:	78 2c                	js     80104d80 <sys_fstat+0x40>
80104d54:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d57:	83 ec 04             	sub    $0x4,%esp
80104d5a:	6a 14                	push   $0x14
80104d5c:	50                   	push   %eax
80104d5d:	6a 01                	push   $0x1
80104d5f:	e8 3c fb ff ff       	call   801048a0 <argptr>
80104d64:	83 c4 10             	add    $0x10,%esp
80104d67:	85 c0                	test   %eax,%eax
80104d69:	78 15                	js     80104d80 <sys_fstat+0x40>
    return -1;
  return filestat(f, st);
80104d6b:	83 ec 08             	sub    $0x8,%esp
80104d6e:	ff 75 f4             	pushl  -0xc(%ebp)
80104d71:	ff 75 f0             	pushl  -0x10(%ebp)
80104d74:	e8 87 c1 ff ff       	call   80100f00 <filestat>
80104d79:	83 c4 10             	add    $0x10,%esp
}
80104d7c:	c9                   	leave  
80104d7d:	c3                   	ret    
80104d7e:	66 90                	xchg   %ax,%ax
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80104d80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filestat(f, st);
}
80104d85:	c9                   	leave  
80104d86:	c3                   	ret    
80104d87:	89 f6                	mov    %esi,%esi
80104d89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d90 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104d90:	55                   	push   %ebp
80104d91:	89 e5                	mov    %esp,%ebp
80104d93:	57                   	push   %edi
80104d94:	56                   	push   %esi
80104d95:	53                   	push   %ebx
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104d96:	8d 45 d4             	lea    -0x2c(%ebp),%eax
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104d99:	83 ec 34             	sub    $0x34,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104d9c:	50                   	push   %eax
80104d9d:	6a 00                	push   $0x0
80104d9f:	e8 5c fb ff ff       	call   80104900 <argstr>
80104da4:	83 c4 10             	add    $0x10,%esp
80104da7:	85 c0                	test   %eax,%eax
80104da9:	0f 88 fb 00 00 00    	js     80104eaa <sys_link+0x11a>
80104daf:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104db2:	83 ec 08             	sub    $0x8,%esp
80104db5:	50                   	push   %eax
80104db6:	6a 01                	push   $0x1
80104db8:	e8 43 fb ff ff       	call   80104900 <argstr>
80104dbd:	83 c4 10             	add    $0x10,%esp
80104dc0:	85 c0                	test   %eax,%eax
80104dc2:	0f 88 e2 00 00 00    	js     80104eaa <sys_link+0x11a>
    return -1;

  begin_op();
80104dc8:	e8 83 dd ff ff       	call   80102b50 <begin_op>
  if((ip = namei(old)) == 0){
80104dcd:	83 ec 0c             	sub    $0xc,%esp
80104dd0:	ff 75 d4             	pushl  -0x2c(%ebp)
80104dd3:	e8 e8 d0 ff ff       	call   80101ec0 <namei>
80104dd8:	83 c4 10             	add    $0x10,%esp
80104ddb:	85 c0                	test   %eax,%eax
80104ddd:	89 c3                	mov    %eax,%ebx
80104ddf:	0f 84 f3 00 00 00    	je     80104ed8 <sys_link+0x148>
    end_op();
    return -1;
  }

  ilock(ip);
80104de5:	83 ec 0c             	sub    $0xc,%esp
80104de8:	50                   	push   %eax
80104de9:	e8 82 c8 ff ff       	call   80101670 <ilock>
  if(ip->type == T_DIR){
80104dee:	83 c4 10             	add    $0x10,%esp
80104df1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104df6:	0f 84 c4 00 00 00    	je     80104ec0 <sys_link+0x130>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
80104dfc:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104e01:	83 ec 0c             	sub    $0xc,%esp
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80104e04:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80104e07:	53                   	push   %ebx
80104e08:	e8 b3 c7 ff ff       	call   801015c0 <iupdate>
  iunlock(ip);
80104e0d:	89 1c 24             	mov    %ebx,(%esp)
80104e10:	e8 3b c9 ff ff       	call   80101750 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80104e15:	58                   	pop    %eax
80104e16:	5a                   	pop    %edx
80104e17:	57                   	push   %edi
80104e18:	ff 75 d0             	pushl  -0x30(%ebp)
80104e1b:	e8 c0 d0 ff ff       	call   80101ee0 <nameiparent>
80104e20:	83 c4 10             	add    $0x10,%esp
80104e23:	85 c0                	test   %eax,%eax
80104e25:	89 c6                	mov    %eax,%esi
80104e27:	74 5b                	je     80104e84 <sys_link+0xf4>
    goto bad;
  ilock(dp);
80104e29:	83 ec 0c             	sub    $0xc,%esp
80104e2c:	50                   	push   %eax
80104e2d:	e8 3e c8 ff ff       	call   80101670 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104e32:	83 c4 10             	add    $0x10,%esp
80104e35:	8b 03                	mov    (%ebx),%eax
80104e37:	39 06                	cmp    %eax,(%esi)
80104e39:	75 3d                	jne    80104e78 <sys_link+0xe8>
80104e3b:	83 ec 04             	sub    $0x4,%esp
80104e3e:	ff 73 04             	pushl  0x4(%ebx)
80104e41:	57                   	push   %edi
80104e42:	56                   	push   %esi
80104e43:	e8 b8 cf ff ff       	call   80101e00 <dirlink>
80104e48:	83 c4 10             	add    $0x10,%esp
80104e4b:	85 c0                	test   %eax,%eax
80104e4d:	78 29                	js     80104e78 <sys_link+0xe8>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
80104e4f:	83 ec 0c             	sub    $0xc,%esp
80104e52:	56                   	push   %esi
80104e53:	e8 a8 ca ff ff       	call   80101900 <iunlockput>
  iput(ip);
80104e58:	89 1c 24             	mov    %ebx,(%esp)
80104e5b:	e8 40 c9 ff ff       	call   801017a0 <iput>

  end_op();
80104e60:	e8 5b dd ff ff       	call   80102bc0 <end_op>

  return 0;
80104e65:	83 c4 10             	add    $0x10,%esp
80104e68:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104e6a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e6d:	5b                   	pop    %ebx
80104e6e:	5e                   	pop    %esi
80104e6f:	5f                   	pop    %edi
80104e70:	5d                   	pop    %ebp
80104e71:	c3                   	ret    
80104e72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
80104e78:	83 ec 0c             	sub    $0xc,%esp
80104e7b:	56                   	push   %esi
80104e7c:	e8 7f ca ff ff       	call   80101900 <iunlockput>
    goto bad;
80104e81:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  ilock(ip);
80104e84:	83 ec 0c             	sub    $0xc,%esp
80104e87:	53                   	push   %ebx
80104e88:	e8 e3 c7 ff ff       	call   80101670 <ilock>
  ip->nlink--;
80104e8d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104e92:	89 1c 24             	mov    %ebx,(%esp)
80104e95:	e8 26 c7 ff ff       	call   801015c0 <iupdate>
  iunlockput(ip);
80104e9a:	89 1c 24             	mov    %ebx,(%esp)
80104e9d:	e8 5e ca ff ff       	call   80101900 <iunlockput>
  end_op();
80104ea2:	e8 19 dd ff ff       	call   80102bc0 <end_op>
  return -1;
80104ea7:	83 c4 10             	add    $0x10,%esp
}
80104eaa:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
80104ead:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104eb2:	5b                   	pop    %ebx
80104eb3:	5e                   	pop    %esi
80104eb4:	5f                   	pop    %edi
80104eb5:	5d                   	pop    %ebp
80104eb6:	c3                   	ret    
80104eb7:	89 f6                	mov    %esi,%esi
80104eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
80104ec0:	83 ec 0c             	sub    $0xc,%esp
80104ec3:	53                   	push   %ebx
80104ec4:	e8 37 ca ff ff       	call   80101900 <iunlockput>
    end_op();
80104ec9:	e8 f2 dc ff ff       	call   80102bc0 <end_op>
    return -1;
80104ece:	83 c4 10             	add    $0x10,%esp
80104ed1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ed6:	eb 92                	jmp    80104e6a <sys_link+0xda>
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
    return -1;

  begin_op();
  if((ip = namei(old)) == 0){
    end_op();
80104ed8:	e8 e3 dc ff ff       	call   80102bc0 <end_op>
    return -1;
80104edd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ee2:	eb 86                	jmp    80104e6a <sys_link+0xda>
80104ee4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104eea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104ef0 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104ef0:	55                   	push   %ebp
80104ef1:	89 e5                	mov    %esp,%ebp
80104ef3:	57                   	push   %edi
80104ef4:	56                   	push   %esi
80104ef5:	53                   	push   %ebx
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104ef6:	8d 45 c0             	lea    -0x40(%ebp),%eax
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104ef9:	83 ec 54             	sub    $0x54,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104efc:	50                   	push   %eax
80104efd:	6a 00                	push   $0x0
80104eff:	e8 fc f9 ff ff       	call   80104900 <argstr>
80104f04:	83 c4 10             	add    $0x10,%esp
80104f07:	85 c0                	test   %eax,%eax
80104f09:	0f 88 82 01 00 00    	js     80105091 <sys_unlink+0x1a1>
    return -1;

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
80104f0f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  uint off;

  if(argstr(0, &path) < 0)
    return -1;

  begin_op();
80104f12:	e8 39 dc ff ff       	call   80102b50 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104f17:	83 ec 08             	sub    $0x8,%esp
80104f1a:	53                   	push   %ebx
80104f1b:	ff 75 c0             	pushl  -0x40(%ebp)
80104f1e:	e8 bd cf ff ff       	call   80101ee0 <nameiparent>
80104f23:	83 c4 10             	add    $0x10,%esp
80104f26:	85 c0                	test   %eax,%eax
80104f28:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104f2b:	0f 84 6a 01 00 00    	je     8010509b <sys_unlink+0x1ab>
    end_op();
    return -1;
  }

  ilock(dp);
80104f31:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104f34:	83 ec 0c             	sub    $0xc,%esp
80104f37:	56                   	push   %esi
80104f38:	e8 33 c7 ff ff       	call   80101670 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104f3d:	58                   	pop    %eax
80104f3e:	5a                   	pop    %edx
80104f3f:	68 78 78 10 80       	push   $0x80107878
80104f44:	53                   	push   %ebx
80104f45:	e8 36 cc ff ff       	call   80101b80 <namecmp>
80104f4a:	83 c4 10             	add    $0x10,%esp
80104f4d:	85 c0                	test   %eax,%eax
80104f4f:	0f 84 fc 00 00 00    	je     80105051 <sys_unlink+0x161>
80104f55:	83 ec 08             	sub    $0x8,%esp
80104f58:	68 77 78 10 80       	push   $0x80107877
80104f5d:	53                   	push   %ebx
80104f5e:	e8 1d cc ff ff       	call   80101b80 <namecmp>
80104f63:	83 c4 10             	add    $0x10,%esp
80104f66:	85 c0                	test   %eax,%eax
80104f68:	0f 84 e3 00 00 00    	je     80105051 <sys_unlink+0x161>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
80104f6e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104f71:	83 ec 04             	sub    $0x4,%esp
80104f74:	50                   	push   %eax
80104f75:	53                   	push   %ebx
80104f76:	56                   	push   %esi
80104f77:	e8 24 cc ff ff       	call   80101ba0 <dirlookup>
80104f7c:	83 c4 10             	add    $0x10,%esp
80104f7f:	85 c0                	test   %eax,%eax
80104f81:	89 c3                	mov    %eax,%ebx
80104f83:	0f 84 c8 00 00 00    	je     80105051 <sys_unlink+0x161>
    goto bad;
  ilock(ip);
80104f89:	83 ec 0c             	sub    $0xc,%esp
80104f8c:	50                   	push   %eax
80104f8d:	e8 de c6 ff ff       	call   80101670 <ilock>

  if(ip->nlink < 1)
80104f92:	83 c4 10             	add    $0x10,%esp
80104f95:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104f9a:	0f 8e 24 01 00 00    	jle    801050c4 <sys_unlink+0x1d4>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
80104fa0:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104fa5:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104fa8:	74 66                	je     80105010 <sys_unlink+0x120>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
80104faa:	83 ec 04             	sub    $0x4,%esp
80104fad:	6a 10                	push   $0x10
80104faf:	6a 00                	push   $0x0
80104fb1:	56                   	push   %esi
80104fb2:	e8 89 f5 ff ff       	call   80104540 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104fb7:	6a 10                	push   $0x10
80104fb9:	ff 75 c4             	pushl  -0x3c(%ebp)
80104fbc:	56                   	push   %esi
80104fbd:	ff 75 b4             	pushl  -0x4c(%ebp)
80104fc0:	e8 8b ca ff ff       	call   80101a50 <writei>
80104fc5:	83 c4 20             	add    $0x20,%esp
80104fc8:	83 f8 10             	cmp    $0x10,%eax
80104fcb:	0f 85 e6 00 00 00    	jne    801050b7 <sys_unlink+0x1c7>
    panic("unlink: writei");
  if(ip->type == T_DIR){
80104fd1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104fd6:	0f 84 9c 00 00 00    	je     80105078 <sys_unlink+0x188>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
80104fdc:	83 ec 0c             	sub    $0xc,%esp
80104fdf:	ff 75 b4             	pushl  -0x4c(%ebp)
80104fe2:	e8 19 c9 ff ff       	call   80101900 <iunlockput>

  ip->nlink--;
80104fe7:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104fec:	89 1c 24             	mov    %ebx,(%esp)
80104fef:	e8 cc c5 ff ff       	call   801015c0 <iupdate>
  iunlockput(ip);
80104ff4:	89 1c 24             	mov    %ebx,(%esp)
80104ff7:	e8 04 c9 ff ff       	call   80101900 <iunlockput>

  end_op();
80104ffc:	e8 bf db ff ff       	call   80102bc0 <end_op>

  return 0;
80105001:	83 c4 10             	add    $0x10,%esp
80105004:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80105006:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105009:	5b                   	pop    %ebx
8010500a:	5e                   	pop    %esi
8010500b:	5f                   	pop    %edi
8010500c:	5d                   	pop    %ebp
8010500d:	c3                   	ret    
8010500e:	66 90                	xchg   %ax,%ax
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105010:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105014:	76 94                	jbe    80104faa <sys_unlink+0xba>
80105016:	bf 20 00 00 00       	mov    $0x20,%edi
8010501b:	eb 0f                	jmp    8010502c <sys_unlink+0x13c>
8010501d:	8d 76 00             	lea    0x0(%esi),%esi
80105020:	83 c7 10             	add    $0x10,%edi
80105023:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105026:	0f 83 7e ff ff ff    	jae    80104faa <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010502c:	6a 10                	push   $0x10
8010502e:	57                   	push   %edi
8010502f:	56                   	push   %esi
80105030:	53                   	push   %ebx
80105031:	e8 1a c9 ff ff       	call   80101950 <readi>
80105036:	83 c4 10             	add    $0x10,%esp
80105039:	83 f8 10             	cmp    $0x10,%eax
8010503c:	75 6c                	jne    801050aa <sys_unlink+0x1ba>
      panic("isdirempty: readi");
    if(de.inum != 0)
8010503e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105043:	74 db                	je     80105020 <sys_unlink+0x130>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80105045:	83 ec 0c             	sub    $0xc,%esp
80105048:	53                   	push   %ebx
80105049:	e8 b2 c8 ff ff       	call   80101900 <iunlockput>
    goto bad;
8010504e:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  iunlockput(dp);
80105051:	83 ec 0c             	sub    $0xc,%esp
80105054:	ff 75 b4             	pushl  -0x4c(%ebp)
80105057:	e8 a4 c8 ff ff       	call   80101900 <iunlockput>
  end_op();
8010505c:	e8 5f db ff ff       	call   80102bc0 <end_op>
  return -1;
80105061:	83 c4 10             	add    $0x10,%esp
}
80105064:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
80105067:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010506c:	5b                   	pop    %ebx
8010506d:	5e                   	pop    %esi
8010506e:	5f                   	pop    %edi
8010506f:	5d                   	pop    %ebp
80105070:	c3                   	ret    
80105071:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80105078:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
8010507b:	83 ec 0c             	sub    $0xc,%esp

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
8010507e:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80105083:	50                   	push   %eax
80105084:	e8 37 c5 ff ff       	call   801015c0 <iupdate>
80105089:	83 c4 10             	add    $0x10,%esp
8010508c:	e9 4b ff ff ff       	jmp    80104fdc <sys_unlink+0xec>
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;
80105091:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105096:	e9 6b ff ff ff       	jmp    80105006 <sys_unlink+0x116>

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
    end_op();
8010509b:	e8 20 db ff ff       	call   80102bc0 <end_op>
    return -1;
801050a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050a5:	e9 5c ff ff ff       	jmp    80105006 <sys_unlink+0x116>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
801050aa:	83 ec 0c             	sub    $0xc,%esp
801050ad:	68 9c 78 10 80       	push   $0x8010789c
801050b2:	e8 b9 b2 ff ff       	call   80100370 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
801050b7:	83 ec 0c             	sub    $0xc,%esp
801050ba:	68 ae 78 10 80       	push   $0x801078ae
801050bf:	e8 ac b2 ff ff       	call   80100370 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
801050c4:	83 ec 0c             	sub    $0xc,%esp
801050c7:	68 8a 78 10 80       	push   $0x8010788a
801050cc:	e8 9f b2 ff ff       	call   80100370 <panic>
801050d1:	eb 0d                	jmp    801050e0 <sys_open>
801050d3:	90                   	nop
801050d4:	90                   	nop
801050d5:	90                   	nop
801050d6:	90                   	nop
801050d7:	90                   	nop
801050d8:	90                   	nop
801050d9:	90                   	nop
801050da:	90                   	nop
801050db:	90                   	nop
801050dc:	90                   	nop
801050dd:	90                   	nop
801050de:	90                   	nop
801050df:	90                   	nop

801050e0 <sys_open>:
  return ip;
}

int
sys_open(void)
{
801050e0:	55                   	push   %ebp
801050e1:	89 e5                	mov    %esp,%ebp
801050e3:	57                   	push   %edi
801050e4:	56                   	push   %esi
801050e5:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
801050e6:	8d 45 e0             	lea    -0x20(%ebp),%eax
  return ip;
}

int
sys_open(void)
{
801050e9:	83 ec 24             	sub    $0x24,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
801050ec:	50                   	push   %eax
801050ed:	6a 00                	push   $0x0
801050ef:	e8 0c f8 ff ff       	call   80104900 <argstr>
801050f4:	83 c4 10             	add    $0x10,%esp
801050f7:	85 c0                	test   %eax,%eax
801050f9:	0f 88 9e 00 00 00    	js     8010519d <sys_open+0xbd>
801050ff:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105102:	83 ec 08             	sub    $0x8,%esp
80105105:	50                   	push   %eax
80105106:	6a 01                	push   $0x1
80105108:	e8 43 f7 ff ff       	call   80104850 <argint>
8010510d:	83 c4 10             	add    $0x10,%esp
80105110:	85 c0                	test   %eax,%eax
80105112:	0f 88 85 00 00 00    	js     8010519d <sys_open+0xbd>
    return -1;

  begin_op();
80105118:	e8 33 da ff ff       	call   80102b50 <begin_op>

  if(omode & O_CREATE){
8010511d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105121:	0f 85 89 00 00 00    	jne    801051b0 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105127:	83 ec 0c             	sub    $0xc,%esp
8010512a:	ff 75 e0             	pushl  -0x20(%ebp)
8010512d:	e8 8e cd ff ff       	call   80101ec0 <namei>
80105132:	83 c4 10             	add    $0x10,%esp
80105135:	85 c0                	test   %eax,%eax
80105137:	89 c6                	mov    %eax,%esi
80105139:	0f 84 8e 00 00 00    	je     801051cd <sys_open+0xed>
      end_op();
      return -1;
    }
    ilock(ip);
8010513f:	83 ec 0c             	sub    $0xc,%esp
80105142:	50                   	push   %eax
80105143:	e8 28 c5 ff ff       	call   80101670 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105148:	83 c4 10             	add    $0x10,%esp
8010514b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105150:	0f 84 d2 00 00 00    	je     80105228 <sys_open+0x148>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105156:	e8 15 bc ff ff       	call   80100d70 <filealloc>
8010515b:	85 c0                	test   %eax,%eax
8010515d:	89 c7                	mov    %eax,%edi
8010515f:	74 2b                	je     8010518c <sys_open+0xac>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105161:	31 db                	xor    %ebx,%ebx
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80105163:	e8 18 e6 ff ff       	call   80103780 <myproc>
80105168:	90                   	nop
80105169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
80105170:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105174:	85 d2                	test   %edx,%edx
80105176:	74 68                	je     801051e0 <sys_open+0x100>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105178:	83 c3 01             	add    $0x1,%ebx
8010517b:	83 fb 10             	cmp    $0x10,%ebx
8010517e:	75 f0                	jne    80105170 <sys_open+0x90>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
80105180:	83 ec 0c             	sub    $0xc,%esp
80105183:	57                   	push   %edi
80105184:	e8 a7 bc ff ff       	call   80100e30 <fileclose>
80105189:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
8010518c:	83 ec 0c             	sub    $0xc,%esp
8010518f:	56                   	push   %esi
80105190:	e8 6b c7 ff ff       	call   80101900 <iunlockput>
    end_op();
80105195:	e8 26 da ff ff       	call   80102bc0 <end_op>
    return -1;
8010519a:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
8010519d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
801051a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
801051a5:	5b                   	pop    %ebx
801051a6:	5e                   	pop    %esi
801051a7:	5f                   	pop    %edi
801051a8:	5d                   	pop    %ebp
801051a9:	c3                   	ret    
801051aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
801051b0:	83 ec 0c             	sub    $0xc,%esp
801051b3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801051b6:	31 c9                	xor    %ecx,%ecx
801051b8:	6a 00                	push   $0x0
801051ba:	ba 02 00 00 00       	mov    $0x2,%edx
801051bf:	e8 dc f7 ff ff       	call   801049a0 <create>
    if(ip == 0){
801051c4:	83 c4 10             	add    $0x10,%esp
801051c7:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
801051c9:	89 c6                	mov    %eax,%esi
    if(ip == 0){
801051cb:	75 89                	jne    80105156 <sys_open+0x76>
      end_op();
801051cd:	e8 ee d9 ff ff       	call   80102bc0 <end_op>
      return -1;
801051d2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051d7:	eb 43                	jmp    8010521c <sys_open+0x13c>
801051d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801051e0:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
801051e3:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801051e7:	56                   	push   %esi
801051e8:	e8 63 c5 ff ff       	call   80101750 <iunlock>
  end_op();
801051ed:	e8 ce d9 ff ff       	call   80102bc0 <end_op>

  f->type = FD_INODE;
801051f2:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
801051f8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801051fb:	83 c4 10             	add    $0x10,%esp
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
801051fe:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
80105201:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
80105208:	89 d0                	mov    %edx,%eax
8010520a:	83 e0 01             	and    $0x1,%eax
8010520d:	83 f0 01             	xor    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105210:	83 e2 03             	and    $0x3,%edx
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105213:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105216:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
8010521a:	89 d8                	mov    %ebx,%eax
}
8010521c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010521f:	5b                   	pop    %ebx
80105220:	5e                   	pop    %esi
80105221:	5f                   	pop    %edi
80105222:	5d                   	pop    %ebp
80105223:	c3                   	ret    
80105224:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
80105228:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010522b:	85 c9                	test   %ecx,%ecx
8010522d:	0f 84 23 ff ff ff    	je     80105156 <sys_open+0x76>
80105233:	e9 54 ff ff ff       	jmp    8010518c <sys_open+0xac>
80105238:	90                   	nop
80105239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105240 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
80105240:	55                   	push   %ebp
80105241:	89 e5                	mov    %esp,%ebp
80105243:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105246:	e8 05 d9 ff ff       	call   80102b50 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010524b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010524e:	83 ec 08             	sub    $0x8,%esp
80105251:	50                   	push   %eax
80105252:	6a 00                	push   $0x0
80105254:	e8 a7 f6 ff ff       	call   80104900 <argstr>
80105259:	83 c4 10             	add    $0x10,%esp
8010525c:	85 c0                	test   %eax,%eax
8010525e:	78 30                	js     80105290 <sys_mkdir+0x50>
80105260:	83 ec 0c             	sub    $0xc,%esp
80105263:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105266:	31 c9                	xor    %ecx,%ecx
80105268:	6a 00                	push   $0x0
8010526a:	ba 01 00 00 00       	mov    $0x1,%edx
8010526f:	e8 2c f7 ff ff       	call   801049a0 <create>
80105274:	83 c4 10             	add    $0x10,%esp
80105277:	85 c0                	test   %eax,%eax
80105279:	74 15                	je     80105290 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010527b:	83 ec 0c             	sub    $0xc,%esp
8010527e:	50                   	push   %eax
8010527f:	e8 7c c6 ff ff       	call   80101900 <iunlockput>
  end_op();
80105284:	e8 37 d9 ff ff       	call   80102bc0 <end_op>
  return 0;
80105289:	83 c4 10             	add    $0x10,%esp
8010528c:	31 c0                	xor    %eax,%eax
}
8010528e:	c9                   	leave  
8010528f:	c3                   	ret    
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
80105290:	e8 2b d9 ff ff       	call   80102bc0 <end_op>
    return -1;
80105295:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010529a:	c9                   	leave  
8010529b:	c3                   	ret    
8010529c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801052a0 <sys_mknod>:

int
sys_mknod(void)
{
801052a0:	55                   	push   %ebp
801052a1:	89 e5                	mov    %esp,%ebp
801052a3:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
801052a6:	e8 a5 d8 ff ff       	call   80102b50 <begin_op>
  if((argstr(0, &path)) < 0 ||
801052ab:	8d 45 ec             	lea    -0x14(%ebp),%eax
801052ae:	83 ec 08             	sub    $0x8,%esp
801052b1:	50                   	push   %eax
801052b2:	6a 00                	push   $0x0
801052b4:	e8 47 f6 ff ff       	call   80104900 <argstr>
801052b9:	83 c4 10             	add    $0x10,%esp
801052bc:	85 c0                	test   %eax,%eax
801052be:	78 60                	js     80105320 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
801052c0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801052c3:	83 ec 08             	sub    $0x8,%esp
801052c6:	50                   	push   %eax
801052c7:	6a 01                	push   $0x1
801052c9:	e8 82 f5 ff ff       	call   80104850 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
801052ce:	83 c4 10             	add    $0x10,%esp
801052d1:	85 c0                	test   %eax,%eax
801052d3:	78 4b                	js     80105320 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
801052d5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052d8:	83 ec 08             	sub    $0x8,%esp
801052db:	50                   	push   %eax
801052dc:	6a 02                	push   $0x2
801052de:	e8 6d f5 ff ff       	call   80104850 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
801052e3:	83 c4 10             	add    $0x10,%esp
801052e6:	85 c0                	test   %eax,%eax
801052e8:	78 36                	js     80105320 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
801052ea:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801052ee:	83 ec 0c             	sub    $0xc,%esp
801052f1:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801052f5:	ba 03 00 00 00       	mov    $0x3,%edx
801052fa:	50                   	push   %eax
801052fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
801052fe:	e8 9d f6 ff ff       	call   801049a0 <create>
80105303:	83 c4 10             	add    $0x10,%esp
80105306:	85 c0                	test   %eax,%eax
80105308:	74 16                	je     80105320 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
8010530a:	83 ec 0c             	sub    $0xc,%esp
8010530d:	50                   	push   %eax
8010530e:	e8 ed c5 ff ff       	call   80101900 <iunlockput>
  end_op();
80105313:	e8 a8 d8 ff ff       	call   80102bc0 <end_op>
  return 0;
80105318:	83 c4 10             	add    $0x10,%esp
8010531b:	31 c0                	xor    %eax,%eax
}
8010531d:	c9                   	leave  
8010531e:	c3                   	ret    
8010531f:	90                   	nop
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
80105320:	e8 9b d8 ff ff       	call   80102bc0 <end_op>
    return -1;
80105325:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010532a:	c9                   	leave  
8010532b:	c3                   	ret    
8010532c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105330 <sys_chdir>:

int
sys_chdir(void)
{
80105330:	55                   	push   %ebp
80105331:	89 e5                	mov    %esp,%ebp
80105333:	56                   	push   %esi
80105334:	53                   	push   %ebx
80105335:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80105338:	e8 43 e4 ff ff       	call   80103780 <myproc>
8010533d:	89 c6                	mov    %eax,%esi
  
  begin_op();
8010533f:	e8 0c d8 ff ff       	call   80102b50 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80105344:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105347:	83 ec 08             	sub    $0x8,%esp
8010534a:	50                   	push   %eax
8010534b:	6a 00                	push   $0x0
8010534d:	e8 ae f5 ff ff       	call   80104900 <argstr>
80105352:	83 c4 10             	add    $0x10,%esp
80105355:	85 c0                	test   %eax,%eax
80105357:	78 77                	js     801053d0 <sys_chdir+0xa0>
80105359:	83 ec 0c             	sub    $0xc,%esp
8010535c:	ff 75 f4             	pushl  -0xc(%ebp)
8010535f:	e8 5c cb ff ff       	call   80101ec0 <namei>
80105364:	83 c4 10             	add    $0x10,%esp
80105367:	85 c0                	test   %eax,%eax
80105369:	89 c3                	mov    %eax,%ebx
8010536b:	74 63                	je     801053d0 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
8010536d:	83 ec 0c             	sub    $0xc,%esp
80105370:	50                   	push   %eax
80105371:	e8 fa c2 ff ff       	call   80101670 <ilock>
  if(ip->type != T_DIR){
80105376:	83 c4 10             	add    $0x10,%esp
80105379:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010537e:	75 30                	jne    801053b0 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105380:	83 ec 0c             	sub    $0xc,%esp
80105383:	53                   	push   %ebx
80105384:	e8 c7 c3 ff ff       	call   80101750 <iunlock>
  iput(curproc->cwd);
80105389:	58                   	pop    %eax
8010538a:	ff 76 68             	pushl  0x68(%esi)
8010538d:	e8 0e c4 ff ff       	call   801017a0 <iput>
  end_op();
80105392:	e8 29 d8 ff ff       	call   80102bc0 <end_op>
  curproc->cwd = ip;
80105397:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
8010539a:	83 c4 10             	add    $0x10,%esp
8010539d:	31 c0                	xor    %eax,%eax
}
8010539f:	8d 65 f8             	lea    -0x8(%ebp),%esp
801053a2:	5b                   	pop    %ebx
801053a3:	5e                   	pop    %esi
801053a4:	5d                   	pop    %ebp
801053a5:	c3                   	ret    
801053a6:	8d 76 00             	lea    0x0(%esi),%esi
801053a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
801053b0:	83 ec 0c             	sub    $0xc,%esp
801053b3:	53                   	push   %ebx
801053b4:	e8 47 c5 ff ff       	call   80101900 <iunlockput>
    end_op();
801053b9:	e8 02 d8 ff ff       	call   80102bc0 <end_op>
    return -1;
801053be:	83 c4 10             	add    $0x10,%esp
801053c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053c6:	eb d7                	jmp    8010539f <sys_chdir+0x6f>
801053c8:	90                   	nop
801053c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct inode *ip;
  struct proc *curproc = myproc();
  
  begin_op();
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
801053d0:	e8 eb d7 ff ff       	call   80102bc0 <end_op>
    return -1;
801053d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053da:	eb c3                	jmp    8010539f <sys_chdir+0x6f>
801053dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053e0 <sys_exec>:
  return 0;
}

int
sys_exec(void)
{
801053e0:	55                   	push   %ebp
801053e1:	89 e5                	mov    %esp,%ebp
801053e3:	57                   	push   %edi
801053e4:	56                   	push   %esi
801053e5:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801053e6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
  return 0;
}

int
sys_exec(void)
{
801053ec:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801053f2:	50                   	push   %eax
801053f3:	6a 00                	push   $0x0
801053f5:	e8 06 f5 ff ff       	call   80104900 <argstr>
801053fa:	83 c4 10             	add    $0x10,%esp
801053fd:	85 c0                	test   %eax,%eax
801053ff:	78 7f                	js     80105480 <sys_exec+0xa0>
80105401:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105407:	83 ec 08             	sub    $0x8,%esp
8010540a:	50                   	push   %eax
8010540b:	6a 01                	push   $0x1
8010540d:	e8 3e f4 ff ff       	call   80104850 <argint>
80105412:	83 c4 10             	add    $0x10,%esp
80105415:	85 c0                	test   %eax,%eax
80105417:	78 67                	js     80105480 <sys_exec+0xa0>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105419:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010541f:	83 ec 04             	sub    $0x4,%esp
80105422:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105428:	68 80 00 00 00       	push   $0x80
8010542d:	6a 00                	push   $0x0
8010542f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105435:	50                   	push   %eax
80105436:	31 db                	xor    %ebx,%ebx
80105438:	e8 03 f1 ff ff       	call   80104540 <memset>
8010543d:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105440:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105446:	83 ec 08             	sub    $0x8,%esp
80105449:	57                   	push   %edi
8010544a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010544d:	50                   	push   %eax
8010544e:	e8 5d f3 ff ff       	call   801047b0 <fetchint>
80105453:	83 c4 10             	add    $0x10,%esp
80105456:	85 c0                	test   %eax,%eax
80105458:	78 26                	js     80105480 <sys_exec+0xa0>
      return -1;
    if(uarg == 0){
8010545a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105460:	85 c0                	test   %eax,%eax
80105462:	74 2c                	je     80105490 <sys_exec+0xb0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
80105464:	83 ec 08             	sub    $0x8,%esp
80105467:	56                   	push   %esi
80105468:	50                   	push   %eax
80105469:	e8 82 f3 ff ff       	call   801047f0 <fetchstr>
8010546e:	83 c4 10             	add    $0x10,%esp
80105471:	85 c0                	test   %eax,%eax
80105473:	78 0b                	js     80105480 <sys_exec+0xa0>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
80105475:	83 c3 01             	add    $0x1,%ebx
80105478:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
8010547b:	83 fb 20             	cmp    $0x20,%ebx
8010547e:	75 c0                	jne    80105440 <sys_exec+0x60>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
80105480:	8d 65 f4             	lea    -0xc(%ebp),%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
80105483:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
80105488:	5b                   	pop    %ebx
80105489:	5e                   	pop    %esi
8010548a:	5f                   	pop    %edi
8010548b:	5d                   	pop    %ebp
8010548c:	c3                   	ret    
8010548d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105490:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105496:	83 ec 08             	sub    $0x8,%esp
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
80105499:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801054a0:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801054a4:	50                   	push   %eax
801054a5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801054ab:	e8 40 b5 ff ff       	call   801009f0 <exec>
801054b0:	83 c4 10             	add    $0x10,%esp
}
801054b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801054b6:	5b                   	pop    %ebx
801054b7:	5e                   	pop    %esi
801054b8:	5f                   	pop    %edi
801054b9:	5d                   	pop    %ebp
801054ba:	c3                   	ret    
801054bb:	90                   	nop
801054bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054c0 <sys_pipe>:

int
sys_pipe(void)
{
801054c0:	55                   	push   %ebp
801054c1:	89 e5                	mov    %esp,%ebp
801054c3:	57                   	push   %edi
801054c4:	56                   	push   %esi
801054c5:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801054c6:	8d 45 dc             	lea    -0x24(%ebp),%eax
  return exec(path, argv);
}

int
sys_pipe(void)
{
801054c9:	83 ec 20             	sub    $0x20,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801054cc:	6a 08                	push   $0x8
801054ce:	50                   	push   %eax
801054cf:	6a 00                	push   $0x0
801054d1:	e8 ca f3 ff ff       	call   801048a0 <argptr>
801054d6:	83 c4 10             	add    $0x10,%esp
801054d9:	85 c0                	test   %eax,%eax
801054db:	78 4a                	js     80105527 <sys_pipe+0x67>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
801054dd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801054e0:	83 ec 08             	sub    $0x8,%esp
801054e3:	50                   	push   %eax
801054e4:	8d 45 e0             	lea    -0x20(%ebp),%eax
801054e7:	50                   	push   %eax
801054e8:	e8 03 dd ff ff       	call   801031f0 <pipealloc>
801054ed:	83 c4 10             	add    $0x10,%esp
801054f0:	85 c0                	test   %eax,%eax
801054f2:	78 33                	js     80105527 <sys_pipe+0x67>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801054f4:	31 db                	xor    %ebx,%ebx
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801054f6:	8b 7d e0             	mov    -0x20(%ebp),%edi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
801054f9:	e8 82 e2 ff ff       	call   80103780 <myproc>
801054fe:	66 90                	xchg   %ax,%ax

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
80105500:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
80105504:	85 f6                	test   %esi,%esi
80105506:	74 30                	je     80105538 <sys_pipe+0x78>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105508:	83 c3 01             	add    $0x1,%ebx
8010550b:	83 fb 10             	cmp    $0x10,%ebx
8010550e:	75 f0                	jne    80105500 <sys_pipe+0x40>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
80105510:	83 ec 0c             	sub    $0xc,%esp
80105513:	ff 75 e0             	pushl  -0x20(%ebp)
80105516:	e8 15 b9 ff ff       	call   80100e30 <fileclose>
    fileclose(wf);
8010551b:	58                   	pop    %eax
8010551c:	ff 75 e4             	pushl  -0x1c(%ebp)
8010551f:	e8 0c b9 ff ff       	call   80100e30 <fileclose>
    return -1;
80105524:	83 c4 10             	add    $0x10,%esp
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
80105527:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
8010552a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
8010552f:	5b                   	pop    %ebx
80105530:	5e                   	pop    %esi
80105531:	5f                   	pop    %edi
80105532:	5d                   	pop    %ebp
80105533:	c3                   	ret    
80105534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80105538:	8d 73 08             	lea    0x8(%ebx),%esi
8010553b:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010553f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80105542:	e8 39 e2 ff ff       	call   80103780 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
80105547:	31 d2                	xor    %edx,%edx
80105549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[fd] == 0){
80105550:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105554:	85 c9                	test   %ecx,%ecx
80105556:	74 18                	je     80105570 <sys_pipe+0xb0>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105558:	83 c2 01             	add    $0x1,%edx
8010555b:	83 fa 10             	cmp    $0x10,%edx
8010555e:	75 f0                	jne    80105550 <sys_pipe+0x90>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
80105560:	e8 1b e2 ff ff       	call   80103780 <myproc>
80105565:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
8010556c:	00 
8010556d:	eb a1                	jmp    80105510 <sys_pipe+0x50>
8010556f:	90                   	nop
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80105570:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
80105574:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105577:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
80105579:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010557c:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
}
8010557f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
80105582:	31 c0                	xor    %eax,%eax
}
80105584:	5b                   	pop    %ebx
80105585:	5e                   	pop    %esi
80105586:	5f                   	pop    %edi
80105587:	5d                   	pop    %ebp
80105588:	c3                   	ret    
80105589:	66 90                	xchg   %ax,%ax
8010558b:	66 90                	xchg   %ax,%ax
8010558d:	66 90                	xchg   %ax,%ax
8010558f:	90                   	nop

80105590 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
80105590:	55                   	push   %ebp
80105591:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105593:	5d                   	pop    %ebp
#include "proc.h"

int
sys_fork(void)
{
  return fork();
80105594:	e9 87 e3 ff ff       	jmp    80103920 <fork>
80105599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801055a0 <sys_exit>:
}

int
sys_exit(void)
{
801055a0:	55                   	push   %ebp
801055a1:	89 e5                	mov    %esp,%ebp
801055a3:	83 ec 08             	sub    $0x8,%esp
  exit();
801055a6:	e8 05 e6 ff ff       	call   80103bb0 <exit>
  return 0;  // not reached
}
801055ab:	31 c0                	xor    %eax,%eax
801055ad:	c9                   	leave  
801055ae:	c3                   	ret    
801055af:	90                   	nop

801055b0 <sys_wait>:

int
sys_wait(void)
{
801055b0:	55                   	push   %ebp
801055b1:	89 e5                	mov    %esp,%ebp
  return wait();
}
801055b3:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
801055b4:	e9 37 e8 ff ff       	jmp    80103df0 <wait>
801055b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801055c0 <sys_kill>:
}

int
sys_kill(void)
{
801055c0:	55                   	push   %ebp
801055c1:	89 e5                	mov    %esp,%ebp
801055c3:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
801055c6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801055c9:	50                   	push   %eax
801055ca:	6a 00                	push   $0x0
801055cc:	e8 7f f2 ff ff       	call   80104850 <argint>
801055d1:	83 c4 10             	add    $0x10,%esp
801055d4:	85 c0                	test   %eax,%eax
801055d6:	78 18                	js     801055f0 <sys_kill+0x30>
    return -1;
  return kill(pid);
801055d8:	83 ec 0c             	sub    $0xc,%esp
801055db:	ff 75 f4             	pushl  -0xc(%ebp)
801055de:	e8 5d e9 ff ff       	call   80103f40 <kill>
801055e3:	83 c4 10             	add    $0x10,%esp
}
801055e6:	c9                   	leave  
801055e7:	c3                   	ret    
801055e8:	90                   	nop
801055e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
801055f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
801055f5:	c9                   	leave  
801055f6:	c3                   	ret    
801055f7:	89 f6                	mov    %esi,%esi
801055f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105600 <sys_getpid>:

int
sys_getpid(void)
{
80105600:	55                   	push   %ebp
80105601:	89 e5                	mov    %esp,%ebp
80105603:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105606:	e8 75 e1 ff ff       	call   80103780 <myproc>
8010560b:	8b 40 10             	mov    0x10(%eax),%eax
}
8010560e:	c9                   	leave  
8010560f:	c3                   	ret    

80105610 <sys_sbrk>:

int
sys_sbrk(void)
{
80105610:	55                   	push   %ebp
80105611:	89 e5                	mov    %esp,%ebp
80105613:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105614:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return myproc()->pid;
}

int
sys_sbrk(void)
{
80105617:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
8010561a:	50                   	push   %eax
8010561b:	6a 00                	push   $0x0
8010561d:	e8 2e f2 ff ff       	call   80104850 <argint>
80105622:	83 c4 10             	add    $0x10,%esp
80105625:	85 c0                	test   %eax,%eax
80105627:	78 27                	js     80105650 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
80105629:	e8 52 e1 ff ff       	call   80103780 <myproc>
  if(growproc(n) < 0)
8010562e:	83 ec 0c             	sub    $0xc,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
80105631:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105633:	ff 75 f4             	pushl  -0xc(%ebp)
80105636:	e8 65 e2 ff ff       	call   801038a0 <growproc>
8010563b:	83 c4 10             	add    $0x10,%esp
8010563e:	85 c0                	test   %eax,%eax
80105640:	78 0e                	js     80105650 <sys_sbrk+0x40>
    return -1;
  return addr;
80105642:	89 d8                	mov    %ebx,%eax
}
80105644:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105647:	c9                   	leave  
80105648:	c3                   	ret    
80105649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
80105650:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105655:	eb ed                	jmp    80105644 <sys_sbrk+0x34>
80105657:	89 f6                	mov    %esi,%esi
80105659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105660 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
80105660:	55                   	push   %ebp
80105661:	89 e5                	mov    %esp,%ebp
80105663:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105664:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return addr;
}

int
sys_sleep(void)
{
80105667:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
8010566a:	50                   	push   %eax
8010566b:	6a 00                	push   $0x0
8010566d:	e8 de f1 ff ff       	call   80104850 <argint>
80105672:	83 c4 10             	add    $0x10,%esp
80105675:	85 c0                	test   %eax,%eax
80105677:	0f 88 8a 00 00 00    	js     80105707 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
8010567d:	83 ec 0c             	sub    $0xc,%esp
80105680:	68 60 4c 11 80       	push   $0x80114c60
80105685:	e8 b6 ed ff ff       	call   80104440 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
8010568a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010568d:	83 c4 10             	add    $0x10,%esp
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
80105690:	8b 1d a0 54 11 80    	mov    0x801154a0,%ebx
  while(ticks - ticks0 < n){
80105696:	85 d2                	test   %edx,%edx
80105698:	75 27                	jne    801056c1 <sys_sleep+0x61>
8010569a:	eb 54                	jmp    801056f0 <sys_sleep+0x90>
8010569c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
801056a0:	83 ec 08             	sub    $0x8,%esp
801056a3:	68 60 4c 11 80       	push   $0x80114c60
801056a8:	68 a0 54 11 80       	push   $0x801154a0
801056ad:	e8 7e e6 ff ff       	call   80103d30 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801056b2:	a1 a0 54 11 80       	mov    0x801154a0,%eax
801056b7:	83 c4 10             	add    $0x10,%esp
801056ba:	29 d8                	sub    %ebx,%eax
801056bc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801056bf:	73 2f                	jae    801056f0 <sys_sleep+0x90>
    if(myproc()->killed){
801056c1:	e8 ba e0 ff ff       	call   80103780 <myproc>
801056c6:	8b 40 24             	mov    0x24(%eax),%eax
801056c9:	85 c0                	test   %eax,%eax
801056cb:	74 d3                	je     801056a0 <sys_sleep+0x40>
      release(&tickslock);
801056cd:	83 ec 0c             	sub    $0xc,%esp
801056d0:	68 60 4c 11 80       	push   $0x80114c60
801056d5:	e8 16 ee ff ff       	call   801044f0 <release>
      return -1;
801056da:	83 c4 10             	add    $0x10,%esp
801056dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
801056e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801056e5:	c9                   	leave  
801056e6:	c3                   	ret    
801056e7:	89 f6                	mov    %esi,%esi
801056e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
801056f0:	83 ec 0c             	sub    $0xc,%esp
801056f3:	68 60 4c 11 80       	push   $0x80114c60
801056f8:	e8 f3 ed ff ff       	call   801044f0 <release>
  return 0;
801056fd:	83 c4 10             	add    $0x10,%esp
80105700:	31 c0                	xor    %eax,%eax
}
80105702:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105705:	c9                   	leave  
80105706:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
80105707:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010570c:	eb d4                	jmp    801056e2 <sys_sleep+0x82>
8010570e:	66 90                	xchg   %ax,%ax

80105710 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105710:	55                   	push   %ebp
80105711:	89 e5                	mov    %esp,%ebp
80105713:	53                   	push   %ebx
80105714:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105717:	68 60 4c 11 80       	push   $0x80114c60
8010571c:	e8 1f ed ff ff       	call   80104440 <acquire>
  xticks = ticks;
80105721:	8b 1d a0 54 11 80    	mov    0x801154a0,%ebx
  release(&tickslock);
80105727:	c7 04 24 60 4c 11 80 	movl   $0x80114c60,(%esp)
8010572e:	e8 bd ed ff ff       	call   801044f0 <release>
  return xticks;
}
80105733:	89 d8                	mov    %ebx,%eax
80105735:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105738:	c9                   	leave  
80105739:	c3                   	ret    
8010573a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105740 <sys_procdump>:

void
sys_procdump(void)
{
80105740:	55                   	push   %ebp
80105741:	89 e5                	mov    %esp,%ebp
   procdump();
}
80105743:	5d                   	pop    %ebp
}

void
sys_procdump(void)
{
   procdump();
80105744:	e9 87 e8 ff ff       	jmp    80103fd0 <procdump>

80105749 <alltraps>:
80105749:	1e                   	push   %ds
8010574a:	06                   	push   %es
8010574b:	0f a0                	push   %fs
8010574d:	0f a8                	push   %gs
8010574f:	60                   	pusha  
80105750:	66 b8 10 00          	mov    $0x10,%ax
80105754:	8e d8                	mov    %eax,%ds
80105756:	8e c0                	mov    %eax,%es
80105758:	54                   	push   %esp
80105759:	e8 e2 00 00 00       	call   80105840 <trap>
8010575e:	83 c4 04             	add    $0x4,%esp

80105761 <trapret>:
80105761:	61                   	popa   
80105762:	0f a9                	pop    %gs
80105764:	0f a1                	pop    %fs
80105766:	07                   	pop    %es
80105767:	1f                   	pop    %ds
80105768:	83 c4 08             	add    $0x8,%esp
8010576b:	cf                   	iret   
8010576c:	66 90                	xchg   %ax,%ax
8010576e:	66 90                	xchg   %ax,%ax

80105770 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105770:	31 c0                	xor    %eax,%eax
80105772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105778:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
8010577f:	b9 08 00 00 00       	mov    $0x8,%ecx
80105784:	c6 04 c5 a4 4c 11 80 	movb   $0x0,-0x7feeb35c(,%eax,8)
8010578b:	00 
8010578c:	66 89 0c c5 a2 4c 11 	mov    %cx,-0x7feeb35e(,%eax,8)
80105793:	80 
80105794:	c6 04 c5 a5 4c 11 80 	movb   $0x8e,-0x7feeb35b(,%eax,8)
8010579b:	8e 
8010579c:	66 89 14 c5 a0 4c 11 	mov    %dx,-0x7feeb360(,%eax,8)
801057a3:	80 
801057a4:	c1 ea 10             	shr    $0x10,%edx
801057a7:	66 89 14 c5 a6 4c 11 	mov    %dx,-0x7feeb35a(,%eax,8)
801057ae:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801057af:	83 c0 01             	add    $0x1,%eax
801057b2:	3d 00 01 00 00       	cmp    $0x100,%eax
801057b7:	75 bf                	jne    80105778 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801057b9:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801057ba:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801057bf:	89 e5                	mov    %esp,%ebp
801057c1:	83 ec 10             	sub    $0x10,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801057c4:	a1 08 a1 10 80       	mov    0x8010a108,%eax

  initlock(&tickslock, "time");
801057c9:	68 bd 78 10 80       	push   $0x801078bd
801057ce:	68 60 4c 11 80       	push   $0x80114c60
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801057d3:	66 89 15 a2 4e 11 80 	mov    %dx,0x80114ea2
801057da:	c6 05 a4 4e 11 80 00 	movb   $0x0,0x80114ea4
801057e1:	66 a3 a0 4e 11 80    	mov    %ax,0x80114ea0
801057e7:	c1 e8 10             	shr    $0x10,%eax
801057ea:	c6 05 a5 4e 11 80 ef 	movb   $0xef,0x80114ea5
801057f1:	66 a3 a6 4e 11 80    	mov    %ax,0x80114ea6

  initlock(&tickslock, "time");
801057f7:	e8 e4 ea ff ff       	call   801042e0 <initlock>
}
801057fc:	83 c4 10             	add    $0x10,%esp
801057ff:	c9                   	leave  
80105800:	c3                   	ret    
80105801:	eb 0d                	jmp    80105810 <idtinit>
80105803:	90                   	nop
80105804:	90                   	nop
80105805:	90                   	nop
80105806:	90                   	nop
80105807:	90                   	nop
80105808:	90                   	nop
80105809:	90                   	nop
8010580a:	90                   	nop
8010580b:	90                   	nop
8010580c:	90                   	nop
8010580d:	90                   	nop
8010580e:	90                   	nop
8010580f:	90                   	nop

80105810 <idtinit>:

void
idtinit(void)
{
80105810:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105811:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105816:	89 e5                	mov    %esp,%ebp
80105818:	83 ec 10             	sub    $0x10,%esp
8010581b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
8010581f:	b8 a0 4c 11 80       	mov    $0x80114ca0,%eax
80105824:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105828:	c1 e8 10             	shr    $0x10,%eax
8010582b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
8010582f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105832:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105835:	c9                   	leave  
80105836:	c3                   	ret    
80105837:	89 f6                	mov    %esi,%esi
80105839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105840 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105840:	55                   	push   %ebp
80105841:	89 e5                	mov    %esp,%ebp
80105843:	57                   	push   %edi
80105844:	56                   	push   %esi
80105845:	53                   	push   %ebx
80105846:	83 ec 1c             	sub    $0x1c,%esp
80105849:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
8010584c:	8b 47 30             	mov    0x30(%edi),%eax
8010584f:	83 f8 40             	cmp    $0x40,%eax
80105852:	0f 84 88 01 00 00    	je     801059e0 <trap+0x1a0>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105858:	83 e8 20             	sub    $0x20,%eax
8010585b:	83 f8 1f             	cmp    $0x1f,%eax
8010585e:	77 10                	ja     80105870 <trap+0x30>
80105860:	ff 24 85 64 79 10 80 	jmp    *-0x7fef869c(,%eax,4)
80105867:	89 f6                	mov    %esi,%esi
80105869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
80105870:	e8 0b df ff ff       	call   80103780 <myproc>
80105875:	85 c0                	test   %eax,%eax
80105877:	0f 84 d7 01 00 00    	je     80105a54 <trap+0x214>
8010587d:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105881:	0f 84 cd 01 00 00    	je     80105a54 <trap+0x214>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105887:	0f 20 d1             	mov    %cr2,%ecx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010588a:	8b 57 38             	mov    0x38(%edi),%edx
8010588d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105890:	89 55 dc             	mov    %edx,-0x24(%ebp)
80105893:	e8 c8 de ff ff       	call   80103760 <cpuid>
80105898:	8b 77 34             	mov    0x34(%edi),%esi
8010589b:	8b 5f 30             	mov    0x30(%edi),%ebx
8010589e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
801058a1:	e8 da de ff ff       	call   80103780 <myproc>
801058a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801058a9:	e8 d2 de ff ff       	call   80103780 <myproc>
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801058ae:	8b 4d d8             	mov    -0x28(%ebp),%ecx
801058b1:	8b 55 dc             	mov    -0x24(%ebp),%edx
801058b4:	51                   	push   %ecx
801058b5:	52                   	push   %edx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
801058b6:	8b 55 e0             	mov    -0x20(%ebp),%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801058b9:	ff 75 e4             	pushl  -0x1c(%ebp)
801058bc:	56                   	push   %esi
801058bd:	53                   	push   %ebx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
801058be:	83 c2 6c             	add    $0x6c,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801058c1:	52                   	push   %edx
801058c2:	ff 70 10             	pushl  0x10(%eax)
801058c5:	68 20 79 10 80       	push   $0x80107920
801058ca:	e8 91 ad ff ff       	call   80100660 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
801058cf:	83 c4 20             	add    $0x20,%esp
801058d2:	e8 a9 de ff ff       	call   80103780 <myproc>
801058d7:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
801058de:	66 90                	xchg   %ax,%ax
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
801058e0:	e8 9b de ff ff       	call   80103780 <myproc>
801058e5:	85 c0                	test   %eax,%eax
801058e7:	74 0c                	je     801058f5 <trap+0xb5>
801058e9:	e8 92 de ff ff       	call   80103780 <myproc>
801058ee:	8b 50 24             	mov    0x24(%eax),%edx
801058f1:	85 d2                	test   %edx,%edx
801058f3:	75 4b                	jne    80105940 <trap+0x100>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
801058f5:	e8 86 de ff ff       	call   80103780 <myproc>
801058fa:	85 c0                	test   %eax,%eax
801058fc:	74 0b                	je     80105909 <trap+0xc9>
801058fe:	e8 7d de ff ff       	call   80103780 <myproc>
80105903:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105907:	74 4f                	je     80105958 <trap+0x118>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105909:	e8 72 de ff ff       	call   80103780 <myproc>
8010590e:	85 c0                	test   %eax,%eax
80105910:	74 1d                	je     8010592f <trap+0xef>
80105912:	e8 69 de ff ff       	call   80103780 <myproc>
80105917:	8b 40 24             	mov    0x24(%eax),%eax
8010591a:	85 c0                	test   %eax,%eax
8010591c:	74 11                	je     8010592f <trap+0xef>
8010591e:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105922:	83 e0 03             	and    $0x3,%eax
80105925:	66 83 f8 03          	cmp    $0x3,%ax
80105929:	0f 84 da 00 00 00    	je     80105a09 <trap+0x1c9>
    exit();
}
8010592f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105932:	5b                   	pop    %ebx
80105933:	5e                   	pop    %esi
80105934:	5f                   	pop    %edi
80105935:	5d                   	pop    %ebp
80105936:	c3                   	ret    
80105937:	89 f6                	mov    %esi,%esi
80105939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105940:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105944:	83 e0 03             	and    $0x3,%eax
80105947:	66 83 f8 03          	cmp    $0x3,%ax
8010594b:	75 a8                	jne    801058f5 <trap+0xb5>
    exit();
8010594d:	e8 5e e2 ff ff       	call   80103bb0 <exit>
80105952:	eb a1                	jmp    801058f5 <trap+0xb5>
80105954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105958:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
8010595c:	75 ab                	jne    80105909 <trap+0xc9>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();
8010595e:	e8 7d e3 ff ff       	call   80103ce0 <yield>
80105963:	eb a4                	jmp    80105909 <trap+0xc9>
80105965:	8d 76 00             	lea    0x0(%esi),%esi
    return;
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
80105968:	e8 f3 dd ff ff       	call   80103760 <cpuid>
8010596d:	85 c0                	test   %eax,%eax
8010596f:	0f 84 ab 00 00 00    	je     80105a20 <trap+0x1e0>
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
80105975:	e8 96 cd ff ff       	call   80102710 <lapiceoi>
    break;
8010597a:	e9 61 ff ff ff       	jmp    801058e0 <trap+0xa0>
8010597f:	90                   	nop
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105980:	e8 4b cc ff ff       	call   801025d0 <kbdintr>
    lapiceoi();
80105985:	e8 86 cd ff ff       	call   80102710 <lapiceoi>
    break;
8010598a:	e9 51 ff ff ff       	jmp    801058e0 <trap+0xa0>
8010598f:	90                   	nop
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80105990:	e8 5b 02 00 00       	call   80105bf0 <uartintr>
    lapiceoi();
80105995:	e8 76 cd ff ff       	call   80102710 <lapiceoi>
    break;
8010599a:	e9 41 ff ff ff       	jmp    801058e0 <trap+0xa0>
8010599f:	90                   	nop
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
801059a0:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
801059a4:	8b 77 38             	mov    0x38(%edi),%esi
801059a7:	e8 b4 dd ff ff       	call   80103760 <cpuid>
801059ac:	56                   	push   %esi
801059ad:	53                   	push   %ebx
801059ae:	50                   	push   %eax
801059af:	68 c8 78 10 80       	push   $0x801078c8
801059b4:	e8 a7 ac ff ff       	call   80100660 <cprintf>
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
801059b9:	e8 52 cd ff ff       	call   80102710 <lapiceoi>
    break;
801059be:	83 c4 10             	add    $0x10,%esp
801059c1:	e9 1a ff ff ff       	jmp    801058e0 <trap+0xa0>
801059c6:	8d 76 00             	lea    0x0(%esi),%esi
801059c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
801059d0:	e8 7b c6 ff ff       	call   80102050 <ideintr>
801059d5:	eb 9e                	jmp    80105975 <trap+0x135>
801059d7:	89 f6                	mov    %esi,%esi
801059d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
801059e0:	e8 9b dd ff ff       	call   80103780 <myproc>
801059e5:	8b 58 24             	mov    0x24(%eax),%ebx
801059e8:	85 db                	test   %ebx,%ebx
801059ea:	75 2c                	jne    80105a18 <trap+0x1d8>
      exit();
    myproc()->tf = tf;
801059ec:	e8 8f dd ff ff       	call   80103780 <myproc>
801059f1:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
801059f4:	e8 47 ef ff ff       	call   80104940 <syscall>
    if(myproc()->killed)
801059f9:	e8 82 dd ff ff       	call   80103780 <myproc>
801059fe:	8b 48 24             	mov    0x24(%eax),%ecx
80105a01:	85 c9                	test   %ecx,%ecx
80105a03:	0f 84 26 ff ff ff    	je     8010592f <trap+0xef>
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
}
80105a09:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a0c:	5b                   	pop    %ebx
80105a0d:	5e                   	pop    %esi
80105a0e:	5f                   	pop    %edi
80105a0f:	5d                   	pop    %ebp
    if(myproc()->killed)
      exit();
    myproc()->tf = tf;
    syscall();
    if(myproc()->killed)
      exit();
80105a10:	e9 9b e1 ff ff       	jmp    80103bb0 <exit>
80105a15:	8d 76 00             	lea    0x0(%esi),%esi
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
      exit();
80105a18:	e8 93 e1 ff ff       	call   80103bb0 <exit>
80105a1d:	eb cd                	jmp    801059ec <trap+0x1ac>
80105a1f:	90                   	nop
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
80105a20:	83 ec 0c             	sub    $0xc,%esp
80105a23:	68 60 4c 11 80       	push   $0x80114c60
80105a28:	e8 13 ea ff ff       	call   80104440 <acquire>
      ticks++;
      wakeup(&ticks);
80105a2d:	c7 04 24 a0 54 11 80 	movl   $0x801154a0,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
      ticks++;
80105a34:	83 05 a0 54 11 80 01 	addl   $0x1,0x801154a0
      wakeup(&ticks);
80105a3b:	e8 a0 e4 ff ff       	call   80103ee0 <wakeup>
      release(&tickslock);
80105a40:	c7 04 24 60 4c 11 80 	movl   $0x80114c60,(%esp)
80105a47:	e8 a4 ea ff ff       	call   801044f0 <release>
80105a4c:	83 c4 10             	add    $0x10,%esp
80105a4f:	e9 21 ff ff ff       	jmp    80105975 <trap+0x135>
80105a54:	0f 20 d6             	mov    %cr2,%esi

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105a57:	8b 5f 38             	mov    0x38(%edi),%ebx
80105a5a:	e8 01 dd ff ff       	call   80103760 <cpuid>
80105a5f:	83 ec 0c             	sub    $0xc,%esp
80105a62:	56                   	push   %esi
80105a63:	53                   	push   %ebx
80105a64:	50                   	push   %eax
80105a65:	ff 77 30             	pushl  0x30(%edi)
80105a68:	68 ec 78 10 80       	push   $0x801078ec
80105a6d:	e8 ee ab ff ff       	call   80100660 <cprintf>
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
80105a72:	83 c4 14             	add    $0x14,%esp
80105a75:	68 c2 78 10 80       	push   $0x801078c2
80105a7a:	e8 f1 a8 ff ff       	call   80100370 <panic>
80105a7f:	90                   	nop

80105a80 <uartgetc>:
80105a80:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
80105a85:	55                   	push   %ebp
80105a86:	89 e5                	mov    %esp,%ebp
80105a88:	85 c0                	test   %eax,%eax
80105a8a:	74 1c                	je     80105aa8 <uartgetc+0x28>
80105a8c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105a91:	ec                   	in     (%dx),%al
80105a92:	a8 01                	test   $0x1,%al
80105a94:	74 12                	je     80105aa8 <uartgetc+0x28>
80105a96:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a9b:	ec                   	in     (%dx),%al
80105a9c:	0f b6 c0             	movzbl %al,%eax
80105a9f:	5d                   	pop    %ebp
80105aa0:	c3                   	ret    
80105aa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105aa8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105aad:	5d                   	pop    %ebp
80105aae:	c3                   	ret    
80105aaf:	90                   	nop

80105ab0 <uartputc.part.0>:
80105ab0:	55                   	push   %ebp
80105ab1:	89 e5                	mov    %esp,%ebp
80105ab3:	57                   	push   %edi
80105ab4:	56                   	push   %esi
80105ab5:	53                   	push   %ebx
80105ab6:	89 c7                	mov    %eax,%edi
80105ab8:	bb 80 00 00 00       	mov    $0x80,%ebx
80105abd:	be fd 03 00 00       	mov    $0x3fd,%esi
80105ac2:	83 ec 0c             	sub    $0xc,%esp
80105ac5:	eb 1b                	jmp    80105ae2 <uartputc.part.0+0x32>
80105ac7:	89 f6                	mov    %esi,%esi
80105ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105ad0:	83 ec 0c             	sub    $0xc,%esp
80105ad3:	6a 0a                	push   $0xa
80105ad5:	e8 56 cc ff ff       	call   80102730 <microdelay>
80105ada:	83 c4 10             	add    $0x10,%esp
80105add:	83 eb 01             	sub    $0x1,%ebx
80105ae0:	74 07                	je     80105ae9 <uartputc.part.0+0x39>
80105ae2:	89 f2                	mov    %esi,%edx
80105ae4:	ec                   	in     (%dx),%al
80105ae5:	a8 20                	test   $0x20,%al
80105ae7:	74 e7                	je     80105ad0 <uartputc.part.0+0x20>
80105ae9:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105aee:	89 f8                	mov    %edi,%eax
80105af0:	ee                   	out    %al,(%dx)
80105af1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105af4:	5b                   	pop    %ebx
80105af5:	5e                   	pop    %esi
80105af6:	5f                   	pop    %edi
80105af7:	5d                   	pop    %ebp
80105af8:	c3                   	ret    
80105af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105b00 <uartinit>:
80105b00:	55                   	push   %ebp
80105b01:	31 c9                	xor    %ecx,%ecx
80105b03:	89 c8                	mov    %ecx,%eax
80105b05:	89 e5                	mov    %esp,%ebp
80105b07:	57                   	push   %edi
80105b08:	56                   	push   %esi
80105b09:	53                   	push   %ebx
80105b0a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105b0f:	89 da                	mov    %ebx,%edx
80105b11:	83 ec 0c             	sub    $0xc,%esp
80105b14:	ee                   	out    %al,(%dx)
80105b15:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105b1a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105b1f:	89 fa                	mov    %edi,%edx
80105b21:	ee                   	out    %al,(%dx)
80105b22:	b8 0c 00 00 00       	mov    $0xc,%eax
80105b27:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b2c:	ee                   	out    %al,(%dx)
80105b2d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105b32:	89 c8                	mov    %ecx,%eax
80105b34:	89 f2                	mov    %esi,%edx
80105b36:	ee                   	out    %al,(%dx)
80105b37:	b8 03 00 00 00       	mov    $0x3,%eax
80105b3c:	89 fa                	mov    %edi,%edx
80105b3e:	ee                   	out    %al,(%dx)
80105b3f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105b44:	89 c8                	mov    %ecx,%eax
80105b46:	ee                   	out    %al,(%dx)
80105b47:	b8 01 00 00 00       	mov    $0x1,%eax
80105b4c:	89 f2                	mov    %esi,%edx
80105b4e:	ee                   	out    %al,(%dx)
80105b4f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105b54:	ec                   	in     (%dx),%al
80105b55:	3c ff                	cmp    $0xff,%al
80105b57:	74 5a                	je     80105bb3 <uartinit+0xb3>
80105b59:	c7 05 bc a5 10 80 01 	movl   $0x1,0x8010a5bc
80105b60:	00 00 00 
80105b63:	89 da                	mov    %ebx,%edx
80105b65:	ec                   	in     (%dx),%al
80105b66:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b6b:	ec                   	in     (%dx),%al
80105b6c:	83 ec 08             	sub    $0x8,%esp
80105b6f:	bb e4 79 10 80       	mov    $0x801079e4,%ebx
80105b74:	6a 00                	push   $0x0
80105b76:	6a 04                	push   $0x4
80105b78:	e8 23 c7 ff ff       	call   801022a0 <ioapicenable>
80105b7d:	83 c4 10             	add    $0x10,%esp
80105b80:	b8 78 00 00 00       	mov    $0x78,%eax
80105b85:	eb 13                	jmp    80105b9a <uartinit+0x9a>
80105b87:	89 f6                	mov    %esi,%esi
80105b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105b90:	83 c3 01             	add    $0x1,%ebx
80105b93:	0f be 03             	movsbl (%ebx),%eax
80105b96:	84 c0                	test   %al,%al
80105b98:	74 19                	je     80105bb3 <uartinit+0xb3>
80105b9a:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105ba0:	85 d2                	test   %edx,%edx
80105ba2:	74 ec                	je     80105b90 <uartinit+0x90>
80105ba4:	83 c3 01             	add    $0x1,%ebx
80105ba7:	e8 04 ff ff ff       	call   80105ab0 <uartputc.part.0>
80105bac:	0f be 03             	movsbl (%ebx),%eax
80105baf:	84 c0                	test   %al,%al
80105bb1:	75 e7                	jne    80105b9a <uartinit+0x9a>
80105bb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105bb6:	5b                   	pop    %ebx
80105bb7:	5e                   	pop    %esi
80105bb8:	5f                   	pop    %edi
80105bb9:	5d                   	pop    %ebp
80105bba:	c3                   	ret    
80105bbb:	90                   	nop
80105bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105bc0 <uartputc>:
80105bc0:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105bc6:	55                   	push   %ebp
80105bc7:	89 e5                	mov    %esp,%ebp
80105bc9:	85 d2                	test   %edx,%edx
80105bcb:	8b 45 08             	mov    0x8(%ebp),%eax
80105bce:	74 10                	je     80105be0 <uartputc+0x20>
80105bd0:	5d                   	pop    %ebp
80105bd1:	e9 da fe ff ff       	jmp    80105ab0 <uartputc.part.0>
80105bd6:	8d 76 00             	lea    0x0(%esi),%esi
80105bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105be0:	5d                   	pop    %ebp
80105be1:	c3                   	ret    
80105be2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105bf0 <uartintr>:
80105bf0:	55                   	push   %ebp
80105bf1:	89 e5                	mov    %esp,%ebp
80105bf3:	83 ec 14             	sub    $0x14,%esp
80105bf6:	68 80 5a 10 80       	push   $0x80105a80
80105bfb:	e8 f0 ab ff ff       	call   801007f0 <consoleintr>
80105c00:	83 c4 10             	add    $0x10,%esp
80105c03:	c9                   	leave  
80105c04:	c3                   	ret    

80105c05 <vector0>:
80105c05:	6a 00                	push   $0x0
80105c07:	6a 00                	push   $0x0
80105c09:	e9 3b fb ff ff       	jmp    80105749 <alltraps>

80105c0e <vector1>:
80105c0e:	6a 00                	push   $0x0
80105c10:	6a 01                	push   $0x1
80105c12:	e9 32 fb ff ff       	jmp    80105749 <alltraps>

80105c17 <vector2>:
80105c17:	6a 00                	push   $0x0
80105c19:	6a 02                	push   $0x2
80105c1b:	e9 29 fb ff ff       	jmp    80105749 <alltraps>

80105c20 <vector3>:
80105c20:	6a 00                	push   $0x0
80105c22:	6a 03                	push   $0x3
80105c24:	e9 20 fb ff ff       	jmp    80105749 <alltraps>

80105c29 <vector4>:
80105c29:	6a 00                	push   $0x0
80105c2b:	6a 04                	push   $0x4
80105c2d:	e9 17 fb ff ff       	jmp    80105749 <alltraps>

80105c32 <vector5>:
80105c32:	6a 00                	push   $0x0
80105c34:	6a 05                	push   $0x5
80105c36:	e9 0e fb ff ff       	jmp    80105749 <alltraps>

80105c3b <vector6>:
80105c3b:	6a 00                	push   $0x0
80105c3d:	6a 06                	push   $0x6
80105c3f:	e9 05 fb ff ff       	jmp    80105749 <alltraps>

80105c44 <vector7>:
80105c44:	6a 00                	push   $0x0
80105c46:	6a 07                	push   $0x7
80105c48:	e9 fc fa ff ff       	jmp    80105749 <alltraps>

80105c4d <vector8>:
80105c4d:	6a 08                	push   $0x8
80105c4f:	e9 f5 fa ff ff       	jmp    80105749 <alltraps>

80105c54 <vector9>:
80105c54:	6a 00                	push   $0x0
80105c56:	6a 09                	push   $0x9
80105c58:	e9 ec fa ff ff       	jmp    80105749 <alltraps>

80105c5d <vector10>:
80105c5d:	6a 0a                	push   $0xa
80105c5f:	e9 e5 fa ff ff       	jmp    80105749 <alltraps>

80105c64 <vector11>:
80105c64:	6a 0b                	push   $0xb
80105c66:	e9 de fa ff ff       	jmp    80105749 <alltraps>

80105c6b <vector12>:
80105c6b:	6a 0c                	push   $0xc
80105c6d:	e9 d7 fa ff ff       	jmp    80105749 <alltraps>

80105c72 <vector13>:
80105c72:	6a 0d                	push   $0xd
80105c74:	e9 d0 fa ff ff       	jmp    80105749 <alltraps>

80105c79 <vector14>:
80105c79:	6a 0e                	push   $0xe
80105c7b:	e9 c9 fa ff ff       	jmp    80105749 <alltraps>

80105c80 <vector15>:
80105c80:	6a 00                	push   $0x0
80105c82:	6a 0f                	push   $0xf
80105c84:	e9 c0 fa ff ff       	jmp    80105749 <alltraps>

80105c89 <vector16>:
80105c89:	6a 00                	push   $0x0
80105c8b:	6a 10                	push   $0x10
80105c8d:	e9 b7 fa ff ff       	jmp    80105749 <alltraps>

80105c92 <vector17>:
80105c92:	6a 11                	push   $0x11
80105c94:	e9 b0 fa ff ff       	jmp    80105749 <alltraps>

80105c99 <vector18>:
80105c99:	6a 00                	push   $0x0
80105c9b:	6a 12                	push   $0x12
80105c9d:	e9 a7 fa ff ff       	jmp    80105749 <alltraps>

80105ca2 <vector19>:
80105ca2:	6a 00                	push   $0x0
80105ca4:	6a 13                	push   $0x13
80105ca6:	e9 9e fa ff ff       	jmp    80105749 <alltraps>

80105cab <vector20>:
80105cab:	6a 00                	push   $0x0
80105cad:	6a 14                	push   $0x14
80105caf:	e9 95 fa ff ff       	jmp    80105749 <alltraps>

80105cb4 <vector21>:
80105cb4:	6a 00                	push   $0x0
80105cb6:	6a 15                	push   $0x15
80105cb8:	e9 8c fa ff ff       	jmp    80105749 <alltraps>

80105cbd <vector22>:
80105cbd:	6a 00                	push   $0x0
80105cbf:	6a 16                	push   $0x16
80105cc1:	e9 83 fa ff ff       	jmp    80105749 <alltraps>

80105cc6 <vector23>:
80105cc6:	6a 00                	push   $0x0
80105cc8:	6a 17                	push   $0x17
80105cca:	e9 7a fa ff ff       	jmp    80105749 <alltraps>

80105ccf <vector24>:
80105ccf:	6a 00                	push   $0x0
80105cd1:	6a 18                	push   $0x18
80105cd3:	e9 71 fa ff ff       	jmp    80105749 <alltraps>

80105cd8 <vector25>:
80105cd8:	6a 00                	push   $0x0
80105cda:	6a 19                	push   $0x19
80105cdc:	e9 68 fa ff ff       	jmp    80105749 <alltraps>

80105ce1 <vector26>:
80105ce1:	6a 00                	push   $0x0
80105ce3:	6a 1a                	push   $0x1a
80105ce5:	e9 5f fa ff ff       	jmp    80105749 <alltraps>

80105cea <vector27>:
80105cea:	6a 00                	push   $0x0
80105cec:	6a 1b                	push   $0x1b
80105cee:	e9 56 fa ff ff       	jmp    80105749 <alltraps>

80105cf3 <vector28>:
80105cf3:	6a 00                	push   $0x0
80105cf5:	6a 1c                	push   $0x1c
80105cf7:	e9 4d fa ff ff       	jmp    80105749 <alltraps>

80105cfc <vector29>:
80105cfc:	6a 00                	push   $0x0
80105cfe:	6a 1d                	push   $0x1d
80105d00:	e9 44 fa ff ff       	jmp    80105749 <alltraps>

80105d05 <vector30>:
80105d05:	6a 00                	push   $0x0
80105d07:	6a 1e                	push   $0x1e
80105d09:	e9 3b fa ff ff       	jmp    80105749 <alltraps>

80105d0e <vector31>:
80105d0e:	6a 00                	push   $0x0
80105d10:	6a 1f                	push   $0x1f
80105d12:	e9 32 fa ff ff       	jmp    80105749 <alltraps>

80105d17 <vector32>:
80105d17:	6a 00                	push   $0x0
80105d19:	6a 20                	push   $0x20
80105d1b:	e9 29 fa ff ff       	jmp    80105749 <alltraps>

80105d20 <vector33>:
80105d20:	6a 00                	push   $0x0
80105d22:	6a 21                	push   $0x21
80105d24:	e9 20 fa ff ff       	jmp    80105749 <alltraps>

80105d29 <vector34>:
80105d29:	6a 00                	push   $0x0
80105d2b:	6a 22                	push   $0x22
80105d2d:	e9 17 fa ff ff       	jmp    80105749 <alltraps>

80105d32 <vector35>:
80105d32:	6a 00                	push   $0x0
80105d34:	6a 23                	push   $0x23
80105d36:	e9 0e fa ff ff       	jmp    80105749 <alltraps>

80105d3b <vector36>:
80105d3b:	6a 00                	push   $0x0
80105d3d:	6a 24                	push   $0x24
80105d3f:	e9 05 fa ff ff       	jmp    80105749 <alltraps>

80105d44 <vector37>:
80105d44:	6a 00                	push   $0x0
80105d46:	6a 25                	push   $0x25
80105d48:	e9 fc f9 ff ff       	jmp    80105749 <alltraps>

80105d4d <vector38>:
80105d4d:	6a 00                	push   $0x0
80105d4f:	6a 26                	push   $0x26
80105d51:	e9 f3 f9 ff ff       	jmp    80105749 <alltraps>

80105d56 <vector39>:
80105d56:	6a 00                	push   $0x0
80105d58:	6a 27                	push   $0x27
80105d5a:	e9 ea f9 ff ff       	jmp    80105749 <alltraps>

80105d5f <vector40>:
80105d5f:	6a 00                	push   $0x0
80105d61:	6a 28                	push   $0x28
80105d63:	e9 e1 f9 ff ff       	jmp    80105749 <alltraps>

80105d68 <vector41>:
80105d68:	6a 00                	push   $0x0
80105d6a:	6a 29                	push   $0x29
80105d6c:	e9 d8 f9 ff ff       	jmp    80105749 <alltraps>

80105d71 <vector42>:
80105d71:	6a 00                	push   $0x0
80105d73:	6a 2a                	push   $0x2a
80105d75:	e9 cf f9 ff ff       	jmp    80105749 <alltraps>

80105d7a <vector43>:
80105d7a:	6a 00                	push   $0x0
80105d7c:	6a 2b                	push   $0x2b
80105d7e:	e9 c6 f9 ff ff       	jmp    80105749 <alltraps>

80105d83 <vector44>:
80105d83:	6a 00                	push   $0x0
80105d85:	6a 2c                	push   $0x2c
80105d87:	e9 bd f9 ff ff       	jmp    80105749 <alltraps>

80105d8c <vector45>:
80105d8c:	6a 00                	push   $0x0
80105d8e:	6a 2d                	push   $0x2d
80105d90:	e9 b4 f9 ff ff       	jmp    80105749 <alltraps>

80105d95 <vector46>:
80105d95:	6a 00                	push   $0x0
80105d97:	6a 2e                	push   $0x2e
80105d99:	e9 ab f9 ff ff       	jmp    80105749 <alltraps>

80105d9e <vector47>:
80105d9e:	6a 00                	push   $0x0
80105da0:	6a 2f                	push   $0x2f
80105da2:	e9 a2 f9 ff ff       	jmp    80105749 <alltraps>

80105da7 <vector48>:
80105da7:	6a 00                	push   $0x0
80105da9:	6a 30                	push   $0x30
80105dab:	e9 99 f9 ff ff       	jmp    80105749 <alltraps>

80105db0 <vector49>:
80105db0:	6a 00                	push   $0x0
80105db2:	6a 31                	push   $0x31
80105db4:	e9 90 f9 ff ff       	jmp    80105749 <alltraps>

80105db9 <vector50>:
80105db9:	6a 00                	push   $0x0
80105dbb:	6a 32                	push   $0x32
80105dbd:	e9 87 f9 ff ff       	jmp    80105749 <alltraps>

80105dc2 <vector51>:
80105dc2:	6a 00                	push   $0x0
80105dc4:	6a 33                	push   $0x33
80105dc6:	e9 7e f9 ff ff       	jmp    80105749 <alltraps>

80105dcb <vector52>:
80105dcb:	6a 00                	push   $0x0
80105dcd:	6a 34                	push   $0x34
80105dcf:	e9 75 f9 ff ff       	jmp    80105749 <alltraps>

80105dd4 <vector53>:
80105dd4:	6a 00                	push   $0x0
80105dd6:	6a 35                	push   $0x35
80105dd8:	e9 6c f9 ff ff       	jmp    80105749 <alltraps>

80105ddd <vector54>:
80105ddd:	6a 00                	push   $0x0
80105ddf:	6a 36                	push   $0x36
80105de1:	e9 63 f9 ff ff       	jmp    80105749 <alltraps>

80105de6 <vector55>:
80105de6:	6a 00                	push   $0x0
80105de8:	6a 37                	push   $0x37
80105dea:	e9 5a f9 ff ff       	jmp    80105749 <alltraps>

80105def <vector56>:
80105def:	6a 00                	push   $0x0
80105df1:	6a 38                	push   $0x38
80105df3:	e9 51 f9 ff ff       	jmp    80105749 <alltraps>

80105df8 <vector57>:
80105df8:	6a 00                	push   $0x0
80105dfa:	6a 39                	push   $0x39
80105dfc:	e9 48 f9 ff ff       	jmp    80105749 <alltraps>

80105e01 <vector58>:
80105e01:	6a 00                	push   $0x0
80105e03:	6a 3a                	push   $0x3a
80105e05:	e9 3f f9 ff ff       	jmp    80105749 <alltraps>

80105e0a <vector59>:
80105e0a:	6a 00                	push   $0x0
80105e0c:	6a 3b                	push   $0x3b
80105e0e:	e9 36 f9 ff ff       	jmp    80105749 <alltraps>

80105e13 <vector60>:
80105e13:	6a 00                	push   $0x0
80105e15:	6a 3c                	push   $0x3c
80105e17:	e9 2d f9 ff ff       	jmp    80105749 <alltraps>

80105e1c <vector61>:
80105e1c:	6a 00                	push   $0x0
80105e1e:	6a 3d                	push   $0x3d
80105e20:	e9 24 f9 ff ff       	jmp    80105749 <alltraps>

80105e25 <vector62>:
80105e25:	6a 00                	push   $0x0
80105e27:	6a 3e                	push   $0x3e
80105e29:	e9 1b f9 ff ff       	jmp    80105749 <alltraps>

80105e2e <vector63>:
80105e2e:	6a 00                	push   $0x0
80105e30:	6a 3f                	push   $0x3f
80105e32:	e9 12 f9 ff ff       	jmp    80105749 <alltraps>

80105e37 <vector64>:
80105e37:	6a 00                	push   $0x0
80105e39:	6a 40                	push   $0x40
80105e3b:	e9 09 f9 ff ff       	jmp    80105749 <alltraps>

80105e40 <vector65>:
80105e40:	6a 00                	push   $0x0
80105e42:	6a 41                	push   $0x41
80105e44:	e9 00 f9 ff ff       	jmp    80105749 <alltraps>

80105e49 <vector66>:
80105e49:	6a 00                	push   $0x0
80105e4b:	6a 42                	push   $0x42
80105e4d:	e9 f7 f8 ff ff       	jmp    80105749 <alltraps>

80105e52 <vector67>:
80105e52:	6a 00                	push   $0x0
80105e54:	6a 43                	push   $0x43
80105e56:	e9 ee f8 ff ff       	jmp    80105749 <alltraps>

80105e5b <vector68>:
80105e5b:	6a 00                	push   $0x0
80105e5d:	6a 44                	push   $0x44
80105e5f:	e9 e5 f8 ff ff       	jmp    80105749 <alltraps>

80105e64 <vector69>:
80105e64:	6a 00                	push   $0x0
80105e66:	6a 45                	push   $0x45
80105e68:	e9 dc f8 ff ff       	jmp    80105749 <alltraps>

80105e6d <vector70>:
80105e6d:	6a 00                	push   $0x0
80105e6f:	6a 46                	push   $0x46
80105e71:	e9 d3 f8 ff ff       	jmp    80105749 <alltraps>

80105e76 <vector71>:
80105e76:	6a 00                	push   $0x0
80105e78:	6a 47                	push   $0x47
80105e7a:	e9 ca f8 ff ff       	jmp    80105749 <alltraps>

80105e7f <vector72>:
80105e7f:	6a 00                	push   $0x0
80105e81:	6a 48                	push   $0x48
80105e83:	e9 c1 f8 ff ff       	jmp    80105749 <alltraps>

80105e88 <vector73>:
80105e88:	6a 00                	push   $0x0
80105e8a:	6a 49                	push   $0x49
80105e8c:	e9 b8 f8 ff ff       	jmp    80105749 <alltraps>

80105e91 <vector74>:
80105e91:	6a 00                	push   $0x0
80105e93:	6a 4a                	push   $0x4a
80105e95:	e9 af f8 ff ff       	jmp    80105749 <alltraps>

80105e9a <vector75>:
80105e9a:	6a 00                	push   $0x0
80105e9c:	6a 4b                	push   $0x4b
80105e9e:	e9 a6 f8 ff ff       	jmp    80105749 <alltraps>

80105ea3 <vector76>:
80105ea3:	6a 00                	push   $0x0
80105ea5:	6a 4c                	push   $0x4c
80105ea7:	e9 9d f8 ff ff       	jmp    80105749 <alltraps>

80105eac <vector77>:
80105eac:	6a 00                	push   $0x0
80105eae:	6a 4d                	push   $0x4d
80105eb0:	e9 94 f8 ff ff       	jmp    80105749 <alltraps>

80105eb5 <vector78>:
80105eb5:	6a 00                	push   $0x0
80105eb7:	6a 4e                	push   $0x4e
80105eb9:	e9 8b f8 ff ff       	jmp    80105749 <alltraps>

80105ebe <vector79>:
80105ebe:	6a 00                	push   $0x0
80105ec0:	6a 4f                	push   $0x4f
80105ec2:	e9 82 f8 ff ff       	jmp    80105749 <alltraps>

80105ec7 <vector80>:
80105ec7:	6a 00                	push   $0x0
80105ec9:	6a 50                	push   $0x50
80105ecb:	e9 79 f8 ff ff       	jmp    80105749 <alltraps>

80105ed0 <vector81>:
80105ed0:	6a 00                	push   $0x0
80105ed2:	6a 51                	push   $0x51
80105ed4:	e9 70 f8 ff ff       	jmp    80105749 <alltraps>

80105ed9 <vector82>:
80105ed9:	6a 00                	push   $0x0
80105edb:	6a 52                	push   $0x52
80105edd:	e9 67 f8 ff ff       	jmp    80105749 <alltraps>

80105ee2 <vector83>:
80105ee2:	6a 00                	push   $0x0
80105ee4:	6a 53                	push   $0x53
80105ee6:	e9 5e f8 ff ff       	jmp    80105749 <alltraps>

80105eeb <vector84>:
80105eeb:	6a 00                	push   $0x0
80105eed:	6a 54                	push   $0x54
80105eef:	e9 55 f8 ff ff       	jmp    80105749 <alltraps>

80105ef4 <vector85>:
80105ef4:	6a 00                	push   $0x0
80105ef6:	6a 55                	push   $0x55
80105ef8:	e9 4c f8 ff ff       	jmp    80105749 <alltraps>

80105efd <vector86>:
80105efd:	6a 00                	push   $0x0
80105eff:	6a 56                	push   $0x56
80105f01:	e9 43 f8 ff ff       	jmp    80105749 <alltraps>

80105f06 <vector87>:
80105f06:	6a 00                	push   $0x0
80105f08:	6a 57                	push   $0x57
80105f0a:	e9 3a f8 ff ff       	jmp    80105749 <alltraps>

80105f0f <vector88>:
80105f0f:	6a 00                	push   $0x0
80105f11:	6a 58                	push   $0x58
80105f13:	e9 31 f8 ff ff       	jmp    80105749 <alltraps>

80105f18 <vector89>:
80105f18:	6a 00                	push   $0x0
80105f1a:	6a 59                	push   $0x59
80105f1c:	e9 28 f8 ff ff       	jmp    80105749 <alltraps>

80105f21 <vector90>:
80105f21:	6a 00                	push   $0x0
80105f23:	6a 5a                	push   $0x5a
80105f25:	e9 1f f8 ff ff       	jmp    80105749 <alltraps>

80105f2a <vector91>:
80105f2a:	6a 00                	push   $0x0
80105f2c:	6a 5b                	push   $0x5b
80105f2e:	e9 16 f8 ff ff       	jmp    80105749 <alltraps>

80105f33 <vector92>:
80105f33:	6a 00                	push   $0x0
80105f35:	6a 5c                	push   $0x5c
80105f37:	e9 0d f8 ff ff       	jmp    80105749 <alltraps>

80105f3c <vector93>:
80105f3c:	6a 00                	push   $0x0
80105f3e:	6a 5d                	push   $0x5d
80105f40:	e9 04 f8 ff ff       	jmp    80105749 <alltraps>

80105f45 <vector94>:
80105f45:	6a 00                	push   $0x0
80105f47:	6a 5e                	push   $0x5e
80105f49:	e9 fb f7 ff ff       	jmp    80105749 <alltraps>

80105f4e <vector95>:
80105f4e:	6a 00                	push   $0x0
80105f50:	6a 5f                	push   $0x5f
80105f52:	e9 f2 f7 ff ff       	jmp    80105749 <alltraps>

80105f57 <vector96>:
80105f57:	6a 00                	push   $0x0
80105f59:	6a 60                	push   $0x60
80105f5b:	e9 e9 f7 ff ff       	jmp    80105749 <alltraps>

80105f60 <vector97>:
80105f60:	6a 00                	push   $0x0
80105f62:	6a 61                	push   $0x61
80105f64:	e9 e0 f7 ff ff       	jmp    80105749 <alltraps>

80105f69 <vector98>:
80105f69:	6a 00                	push   $0x0
80105f6b:	6a 62                	push   $0x62
80105f6d:	e9 d7 f7 ff ff       	jmp    80105749 <alltraps>

80105f72 <vector99>:
80105f72:	6a 00                	push   $0x0
80105f74:	6a 63                	push   $0x63
80105f76:	e9 ce f7 ff ff       	jmp    80105749 <alltraps>

80105f7b <vector100>:
80105f7b:	6a 00                	push   $0x0
80105f7d:	6a 64                	push   $0x64
80105f7f:	e9 c5 f7 ff ff       	jmp    80105749 <alltraps>

80105f84 <vector101>:
80105f84:	6a 00                	push   $0x0
80105f86:	6a 65                	push   $0x65
80105f88:	e9 bc f7 ff ff       	jmp    80105749 <alltraps>

80105f8d <vector102>:
80105f8d:	6a 00                	push   $0x0
80105f8f:	6a 66                	push   $0x66
80105f91:	e9 b3 f7 ff ff       	jmp    80105749 <alltraps>

80105f96 <vector103>:
80105f96:	6a 00                	push   $0x0
80105f98:	6a 67                	push   $0x67
80105f9a:	e9 aa f7 ff ff       	jmp    80105749 <alltraps>

80105f9f <vector104>:
80105f9f:	6a 00                	push   $0x0
80105fa1:	6a 68                	push   $0x68
80105fa3:	e9 a1 f7 ff ff       	jmp    80105749 <alltraps>

80105fa8 <vector105>:
80105fa8:	6a 00                	push   $0x0
80105faa:	6a 69                	push   $0x69
80105fac:	e9 98 f7 ff ff       	jmp    80105749 <alltraps>

80105fb1 <vector106>:
80105fb1:	6a 00                	push   $0x0
80105fb3:	6a 6a                	push   $0x6a
80105fb5:	e9 8f f7 ff ff       	jmp    80105749 <alltraps>

80105fba <vector107>:
80105fba:	6a 00                	push   $0x0
80105fbc:	6a 6b                	push   $0x6b
80105fbe:	e9 86 f7 ff ff       	jmp    80105749 <alltraps>

80105fc3 <vector108>:
80105fc3:	6a 00                	push   $0x0
80105fc5:	6a 6c                	push   $0x6c
80105fc7:	e9 7d f7 ff ff       	jmp    80105749 <alltraps>

80105fcc <vector109>:
80105fcc:	6a 00                	push   $0x0
80105fce:	6a 6d                	push   $0x6d
80105fd0:	e9 74 f7 ff ff       	jmp    80105749 <alltraps>

80105fd5 <vector110>:
80105fd5:	6a 00                	push   $0x0
80105fd7:	6a 6e                	push   $0x6e
80105fd9:	e9 6b f7 ff ff       	jmp    80105749 <alltraps>

80105fde <vector111>:
80105fde:	6a 00                	push   $0x0
80105fe0:	6a 6f                	push   $0x6f
80105fe2:	e9 62 f7 ff ff       	jmp    80105749 <alltraps>

80105fe7 <vector112>:
80105fe7:	6a 00                	push   $0x0
80105fe9:	6a 70                	push   $0x70
80105feb:	e9 59 f7 ff ff       	jmp    80105749 <alltraps>

80105ff0 <vector113>:
80105ff0:	6a 00                	push   $0x0
80105ff2:	6a 71                	push   $0x71
80105ff4:	e9 50 f7 ff ff       	jmp    80105749 <alltraps>

80105ff9 <vector114>:
80105ff9:	6a 00                	push   $0x0
80105ffb:	6a 72                	push   $0x72
80105ffd:	e9 47 f7 ff ff       	jmp    80105749 <alltraps>

80106002 <vector115>:
80106002:	6a 00                	push   $0x0
80106004:	6a 73                	push   $0x73
80106006:	e9 3e f7 ff ff       	jmp    80105749 <alltraps>

8010600b <vector116>:
8010600b:	6a 00                	push   $0x0
8010600d:	6a 74                	push   $0x74
8010600f:	e9 35 f7 ff ff       	jmp    80105749 <alltraps>

80106014 <vector117>:
80106014:	6a 00                	push   $0x0
80106016:	6a 75                	push   $0x75
80106018:	e9 2c f7 ff ff       	jmp    80105749 <alltraps>

8010601d <vector118>:
8010601d:	6a 00                	push   $0x0
8010601f:	6a 76                	push   $0x76
80106021:	e9 23 f7 ff ff       	jmp    80105749 <alltraps>

80106026 <vector119>:
80106026:	6a 00                	push   $0x0
80106028:	6a 77                	push   $0x77
8010602a:	e9 1a f7 ff ff       	jmp    80105749 <alltraps>

8010602f <vector120>:
8010602f:	6a 00                	push   $0x0
80106031:	6a 78                	push   $0x78
80106033:	e9 11 f7 ff ff       	jmp    80105749 <alltraps>

80106038 <vector121>:
80106038:	6a 00                	push   $0x0
8010603a:	6a 79                	push   $0x79
8010603c:	e9 08 f7 ff ff       	jmp    80105749 <alltraps>

80106041 <vector122>:
80106041:	6a 00                	push   $0x0
80106043:	6a 7a                	push   $0x7a
80106045:	e9 ff f6 ff ff       	jmp    80105749 <alltraps>

8010604a <vector123>:
8010604a:	6a 00                	push   $0x0
8010604c:	6a 7b                	push   $0x7b
8010604e:	e9 f6 f6 ff ff       	jmp    80105749 <alltraps>

80106053 <vector124>:
80106053:	6a 00                	push   $0x0
80106055:	6a 7c                	push   $0x7c
80106057:	e9 ed f6 ff ff       	jmp    80105749 <alltraps>

8010605c <vector125>:
8010605c:	6a 00                	push   $0x0
8010605e:	6a 7d                	push   $0x7d
80106060:	e9 e4 f6 ff ff       	jmp    80105749 <alltraps>

80106065 <vector126>:
80106065:	6a 00                	push   $0x0
80106067:	6a 7e                	push   $0x7e
80106069:	e9 db f6 ff ff       	jmp    80105749 <alltraps>

8010606e <vector127>:
8010606e:	6a 00                	push   $0x0
80106070:	6a 7f                	push   $0x7f
80106072:	e9 d2 f6 ff ff       	jmp    80105749 <alltraps>

80106077 <vector128>:
80106077:	6a 00                	push   $0x0
80106079:	68 80 00 00 00       	push   $0x80
8010607e:	e9 c6 f6 ff ff       	jmp    80105749 <alltraps>

80106083 <vector129>:
80106083:	6a 00                	push   $0x0
80106085:	68 81 00 00 00       	push   $0x81
8010608a:	e9 ba f6 ff ff       	jmp    80105749 <alltraps>

8010608f <vector130>:
8010608f:	6a 00                	push   $0x0
80106091:	68 82 00 00 00       	push   $0x82
80106096:	e9 ae f6 ff ff       	jmp    80105749 <alltraps>

8010609b <vector131>:
8010609b:	6a 00                	push   $0x0
8010609d:	68 83 00 00 00       	push   $0x83
801060a2:	e9 a2 f6 ff ff       	jmp    80105749 <alltraps>

801060a7 <vector132>:
801060a7:	6a 00                	push   $0x0
801060a9:	68 84 00 00 00       	push   $0x84
801060ae:	e9 96 f6 ff ff       	jmp    80105749 <alltraps>

801060b3 <vector133>:
801060b3:	6a 00                	push   $0x0
801060b5:	68 85 00 00 00       	push   $0x85
801060ba:	e9 8a f6 ff ff       	jmp    80105749 <alltraps>

801060bf <vector134>:
801060bf:	6a 00                	push   $0x0
801060c1:	68 86 00 00 00       	push   $0x86
801060c6:	e9 7e f6 ff ff       	jmp    80105749 <alltraps>

801060cb <vector135>:
801060cb:	6a 00                	push   $0x0
801060cd:	68 87 00 00 00       	push   $0x87
801060d2:	e9 72 f6 ff ff       	jmp    80105749 <alltraps>

801060d7 <vector136>:
801060d7:	6a 00                	push   $0x0
801060d9:	68 88 00 00 00       	push   $0x88
801060de:	e9 66 f6 ff ff       	jmp    80105749 <alltraps>

801060e3 <vector137>:
801060e3:	6a 00                	push   $0x0
801060e5:	68 89 00 00 00       	push   $0x89
801060ea:	e9 5a f6 ff ff       	jmp    80105749 <alltraps>

801060ef <vector138>:
801060ef:	6a 00                	push   $0x0
801060f1:	68 8a 00 00 00       	push   $0x8a
801060f6:	e9 4e f6 ff ff       	jmp    80105749 <alltraps>

801060fb <vector139>:
801060fb:	6a 00                	push   $0x0
801060fd:	68 8b 00 00 00       	push   $0x8b
80106102:	e9 42 f6 ff ff       	jmp    80105749 <alltraps>

80106107 <vector140>:
80106107:	6a 00                	push   $0x0
80106109:	68 8c 00 00 00       	push   $0x8c
8010610e:	e9 36 f6 ff ff       	jmp    80105749 <alltraps>

80106113 <vector141>:
80106113:	6a 00                	push   $0x0
80106115:	68 8d 00 00 00       	push   $0x8d
8010611a:	e9 2a f6 ff ff       	jmp    80105749 <alltraps>

8010611f <vector142>:
8010611f:	6a 00                	push   $0x0
80106121:	68 8e 00 00 00       	push   $0x8e
80106126:	e9 1e f6 ff ff       	jmp    80105749 <alltraps>

8010612b <vector143>:
8010612b:	6a 00                	push   $0x0
8010612d:	68 8f 00 00 00       	push   $0x8f
80106132:	e9 12 f6 ff ff       	jmp    80105749 <alltraps>

80106137 <vector144>:
80106137:	6a 00                	push   $0x0
80106139:	68 90 00 00 00       	push   $0x90
8010613e:	e9 06 f6 ff ff       	jmp    80105749 <alltraps>

80106143 <vector145>:
80106143:	6a 00                	push   $0x0
80106145:	68 91 00 00 00       	push   $0x91
8010614a:	e9 fa f5 ff ff       	jmp    80105749 <alltraps>

8010614f <vector146>:
8010614f:	6a 00                	push   $0x0
80106151:	68 92 00 00 00       	push   $0x92
80106156:	e9 ee f5 ff ff       	jmp    80105749 <alltraps>

8010615b <vector147>:
8010615b:	6a 00                	push   $0x0
8010615d:	68 93 00 00 00       	push   $0x93
80106162:	e9 e2 f5 ff ff       	jmp    80105749 <alltraps>

80106167 <vector148>:
80106167:	6a 00                	push   $0x0
80106169:	68 94 00 00 00       	push   $0x94
8010616e:	e9 d6 f5 ff ff       	jmp    80105749 <alltraps>

80106173 <vector149>:
80106173:	6a 00                	push   $0x0
80106175:	68 95 00 00 00       	push   $0x95
8010617a:	e9 ca f5 ff ff       	jmp    80105749 <alltraps>

8010617f <vector150>:
8010617f:	6a 00                	push   $0x0
80106181:	68 96 00 00 00       	push   $0x96
80106186:	e9 be f5 ff ff       	jmp    80105749 <alltraps>

8010618b <vector151>:
8010618b:	6a 00                	push   $0x0
8010618d:	68 97 00 00 00       	push   $0x97
80106192:	e9 b2 f5 ff ff       	jmp    80105749 <alltraps>

80106197 <vector152>:
80106197:	6a 00                	push   $0x0
80106199:	68 98 00 00 00       	push   $0x98
8010619e:	e9 a6 f5 ff ff       	jmp    80105749 <alltraps>

801061a3 <vector153>:
801061a3:	6a 00                	push   $0x0
801061a5:	68 99 00 00 00       	push   $0x99
801061aa:	e9 9a f5 ff ff       	jmp    80105749 <alltraps>

801061af <vector154>:
801061af:	6a 00                	push   $0x0
801061b1:	68 9a 00 00 00       	push   $0x9a
801061b6:	e9 8e f5 ff ff       	jmp    80105749 <alltraps>

801061bb <vector155>:
801061bb:	6a 00                	push   $0x0
801061bd:	68 9b 00 00 00       	push   $0x9b
801061c2:	e9 82 f5 ff ff       	jmp    80105749 <alltraps>

801061c7 <vector156>:
801061c7:	6a 00                	push   $0x0
801061c9:	68 9c 00 00 00       	push   $0x9c
801061ce:	e9 76 f5 ff ff       	jmp    80105749 <alltraps>

801061d3 <vector157>:
801061d3:	6a 00                	push   $0x0
801061d5:	68 9d 00 00 00       	push   $0x9d
801061da:	e9 6a f5 ff ff       	jmp    80105749 <alltraps>

801061df <vector158>:
801061df:	6a 00                	push   $0x0
801061e1:	68 9e 00 00 00       	push   $0x9e
801061e6:	e9 5e f5 ff ff       	jmp    80105749 <alltraps>

801061eb <vector159>:
801061eb:	6a 00                	push   $0x0
801061ed:	68 9f 00 00 00       	push   $0x9f
801061f2:	e9 52 f5 ff ff       	jmp    80105749 <alltraps>

801061f7 <vector160>:
801061f7:	6a 00                	push   $0x0
801061f9:	68 a0 00 00 00       	push   $0xa0
801061fe:	e9 46 f5 ff ff       	jmp    80105749 <alltraps>

80106203 <vector161>:
80106203:	6a 00                	push   $0x0
80106205:	68 a1 00 00 00       	push   $0xa1
8010620a:	e9 3a f5 ff ff       	jmp    80105749 <alltraps>

8010620f <vector162>:
8010620f:	6a 00                	push   $0x0
80106211:	68 a2 00 00 00       	push   $0xa2
80106216:	e9 2e f5 ff ff       	jmp    80105749 <alltraps>

8010621b <vector163>:
8010621b:	6a 00                	push   $0x0
8010621d:	68 a3 00 00 00       	push   $0xa3
80106222:	e9 22 f5 ff ff       	jmp    80105749 <alltraps>

80106227 <vector164>:
80106227:	6a 00                	push   $0x0
80106229:	68 a4 00 00 00       	push   $0xa4
8010622e:	e9 16 f5 ff ff       	jmp    80105749 <alltraps>

80106233 <vector165>:
80106233:	6a 00                	push   $0x0
80106235:	68 a5 00 00 00       	push   $0xa5
8010623a:	e9 0a f5 ff ff       	jmp    80105749 <alltraps>

8010623f <vector166>:
8010623f:	6a 00                	push   $0x0
80106241:	68 a6 00 00 00       	push   $0xa6
80106246:	e9 fe f4 ff ff       	jmp    80105749 <alltraps>

8010624b <vector167>:
8010624b:	6a 00                	push   $0x0
8010624d:	68 a7 00 00 00       	push   $0xa7
80106252:	e9 f2 f4 ff ff       	jmp    80105749 <alltraps>

80106257 <vector168>:
80106257:	6a 00                	push   $0x0
80106259:	68 a8 00 00 00       	push   $0xa8
8010625e:	e9 e6 f4 ff ff       	jmp    80105749 <alltraps>

80106263 <vector169>:
80106263:	6a 00                	push   $0x0
80106265:	68 a9 00 00 00       	push   $0xa9
8010626a:	e9 da f4 ff ff       	jmp    80105749 <alltraps>

8010626f <vector170>:
8010626f:	6a 00                	push   $0x0
80106271:	68 aa 00 00 00       	push   $0xaa
80106276:	e9 ce f4 ff ff       	jmp    80105749 <alltraps>

8010627b <vector171>:
8010627b:	6a 00                	push   $0x0
8010627d:	68 ab 00 00 00       	push   $0xab
80106282:	e9 c2 f4 ff ff       	jmp    80105749 <alltraps>

80106287 <vector172>:
80106287:	6a 00                	push   $0x0
80106289:	68 ac 00 00 00       	push   $0xac
8010628e:	e9 b6 f4 ff ff       	jmp    80105749 <alltraps>

80106293 <vector173>:
80106293:	6a 00                	push   $0x0
80106295:	68 ad 00 00 00       	push   $0xad
8010629a:	e9 aa f4 ff ff       	jmp    80105749 <alltraps>

8010629f <vector174>:
8010629f:	6a 00                	push   $0x0
801062a1:	68 ae 00 00 00       	push   $0xae
801062a6:	e9 9e f4 ff ff       	jmp    80105749 <alltraps>

801062ab <vector175>:
801062ab:	6a 00                	push   $0x0
801062ad:	68 af 00 00 00       	push   $0xaf
801062b2:	e9 92 f4 ff ff       	jmp    80105749 <alltraps>

801062b7 <vector176>:
801062b7:	6a 00                	push   $0x0
801062b9:	68 b0 00 00 00       	push   $0xb0
801062be:	e9 86 f4 ff ff       	jmp    80105749 <alltraps>

801062c3 <vector177>:
801062c3:	6a 00                	push   $0x0
801062c5:	68 b1 00 00 00       	push   $0xb1
801062ca:	e9 7a f4 ff ff       	jmp    80105749 <alltraps>

801062cf <vector178>:
801062cf:	6a 00                	push   $0x0
801062d1:	68 b2 00 00 00       	push   $0xb2
801062d6:	e9 6e f4 ff ff       	jmp    80105749 <alltraps>

801062db <vector179>:
801062db:	6a 00                	push   $0x0
801062dd:	68 b3 00 00 00       	push   $0xb3
801062e2:	e9 62 f4 ff ff       	jmp    80105749 <alltraps>

801062e7 <vector180>:
801062e7:	6a 00                	push   $0x0
801062e9:	68 b4 00 00 00       	push   $0xb4
801062ee:	e9 56 f4 ff ff       	jmp    80105749 <alltraps>

801062f3 <vector181>:
801062f3:	6a 00                	push   $0x0
801062f5:	68 b5 00 00 00       	push   $0xb5
801062fa:	e9 4a f4 ff ff       	jmp    80105749 <alltraps>

801062ff <vector182>:
801062ff:	6a 00                	push   $0x0
80106301:	68 b6 00 00 00       	push   $0xb6
80106306:	e9 3e f4 ff ff       	jmp    80105749 <alltraps>

8010630b <vector183>:
8010630b:	6a 00                	push   $0x0
8010630d:	68 b7 00 00 00       	push   $0xb7
80106312:	e9 32 f4 ff ff       	jmp    80105749 <alltraps>

80106317 <vector184>:
80106317:	6a 00                	push   $0x0
80106319:	68 b8 00 00 00       	push   $0xb8
8010631e:	e9 26 f4 ff ff       	jmp    80105749 <alltraps>

80106323 <vector185>:
80106323:	6a 00                	push   $0x0
80106325:	68 b9 00 00 00       	push   $0xb9
8010632a:	e9 1a f4 ff ff       	jmp    80105749 <alltraps>

8010632f <vector186>:
8010632f:	6a 00                	push   $0x0
80106331:	68 ba 00 00 00       	push   $0xba
80106336:	e9 0e f4 ff ff       	jmp    80105749 <alltraps>

8010633b <vector187>:
8010633b:	6a 00                	push   $0x0
8010633d:	68 bb 00 00 00       	push   $0xbb
80106342:	e9 02 f4 ff ff       	jmp    80105749 <alltraps>

80106347 <vector188>:
80106347:	6a 00                	push   $0x0
80106349:	68 bc 00 00 00       	push   $0xbc
8010634e:	e9 f6 f3 ff ff       	jmp    80105749 <alltraps>

80106353 <vector189>:
80106353:	6a 00                	push   $0x0
80106355:	68 bd 00 00 00       	push   $0xbd
8010635a:	e9 ea f3 ff ff       	jmp    80105749 <alltraps>

8010635f <vector190>:
8010635f:	6a 00                	push   $0x0
80106361:	68 be 00 00 00       	push   $0xbe
80106366:	e9 de f3 ff ff       	jmp    80105749 <alltraps>

8010636b <vector191>:
8010636b:	6a 00                	push   $0x0
8010636d:	68 bf 00 00 00       	push   $0xbf
80106372:	e9 d2 f3 ff ff       	jmp    80105749 <alltraps>

80106377 <vector192>:
80106377:	6a 00                	push   $0x0
80106379:	68 c0 00 00 00       	push   $0xc0
8010637e:	e9 c6 f3 ff ff       	jmp    80105749 <alltraps>

80106383 <vector193>:
80106383:	6a 00                	push   $0x0
80106385:	68 c1 00 00 00       	push   $0xc1
8010638a:	e9 ba f3 ff ff       	jmp    80105749 <alltraps>

8010638f <vector194>:
8010638f:	6a 00                	push   $0x0
80106391:	68 c2 00 00 00       	push   $0xc2
80106396:	e9 ae f3 ff ff       	jmp    80105749 <alltraps>

8010639b <vector195>:
8010639b:	6a 00                	push   $0x0
8010639d:	68 c3 00 00 00       	push   $0xc3
801063a2:	e9 a2 f3 ff ff       	jmp    80105749 <alltraps>

801063a7 <vector196>:
801063a7:	6a 00                	push   $0x0
801063a9:	68 c4 00 00 00       	push   $0xc4
801063ae:	e9 96 f3 ff ff       	jmp    80105749 <alltraps>

801063b3 <vector197>:
801063b3:	6a 00                	push   $0x0
801063b5:	68 c5 00 00 00       	push   $0xc5
801063ba:	e9 8a f3 ff ff       	jmp    80105749 <alltraps>

801063bf <vector198>:
801063bf:	6a 00                	push   $0x0
801063c1:	68 c6 00 00 00       	push   $0xc6
801063c6:	e9 7e f3 ff ff       	jmp    80105749 <alltraps>

801063cb <vector199>:
801063cb:	6a 00                	push   $0x0
801063cd:	68 c7 00 00 00       	push   $0xc7
801063d2:	e9 72 f3 ff ff       	jmp    80105749 <alltraps>

801063d7 <vector200>:
801063d7:	6a 00                	push   $0x0
801063d9:	68 c8 00 00 00       	push   $0xc8
801063de:	e9 66 f3 ff ff       	jmp    80105749 <alltraps>

801063e3 <vector201>:
801063e3:	6a 00                	push   $0x0
801063e5:	68 c9 00 00 00       	push   $0xc9
801063ea:	e9 5a f3 ff ff       	jmp    80105749 <alltraps>

801063ef <vector202>:
801063ef:	6a 00                	push   $0x0
801063f1:	68 ca 00 00 00       	push   $0xca
801063f6:	e9 4e f3 ff ff       	jmp    80105749 <alltraps>

801063fb <vector203>:
801063fb:	6a 00                	push   $0x0
801063fd:	68 cb 00 00 00       	push   $0xcb
80106402:	e9 42 f3 ff ff       	jmp    80105749 <alltraps>

80106407 <vector204>:
80106407:	6a 00                	push   $0x0
80106409:	68 cc 00 00 00       	push   $0xcc
8010640e:	e9 36 f3 ff ff       	jmp    80105749 <alltraps>

80106413 <vector205>:
80106413:	6a 00                	push   $0x0
80106415:	68 cd 00 00 00       	push   $0xcd
8010641a:	e9 2a f3 ff ff       	jmp    80105749 <alltraps>

8010641f <vector206>:
8010641f:	6a 00                	push   $0x0
80106421:	68 ce 00 00 00       	push   $0xce
80106426:	e9 1e f3 ff ff       	jmp    80105749 <alltraps>

8010642b <vector207>:
8010642b:	6a 00                	push   $0x0
8010642d:	68 cf 00 00 00       	push   $0xcf
80106432:	e9 12 f3 ff ff       	jmp    80105749 <alltraps>

80106437 <vector208>:
80106437:	6a 00                	push   $0x0
80106439:	68 d0 00 00 00       	push   $0xd0
8010643e:	e9 06 f3 ff ff       	jmp    80105749 <alltraps>

80106443 <vector209>:
80106443:	6a 00                	push   $0x0
80106445:	68 d1 00 00 00       	push   $0xd1
8010644a:	e9 fa f2 ff ff       	jmp    80105749 <alltraps>

8010644f <vector210>:
8010644f:	6a 00                	push   $0x0
80106451:	68 d2 00 00 00       	push   $0xd2
80106456:	e9 ee f2 ff ff       	jmp    80105749 <alltraps>

8010645b <vector211>:
8010645b:	6a 00                	push   $0x0
8010645d:	68 d3 00 00 00       	push   $0xd3
80106462:	e9 e2 f2 ff ff       	jmp    80105749 <alltraps>

80106467 <vector212>:
80106467:	6a 00                	push   $0x0
80106469:	68 d4 00 00 00       	push   $0xd4
8010646e:	e9 d6 f2 ff ff       	jmp    80105749 <alltraps>

80106473 <vector213>:
80106473:	6a 00                	push   $0x0
80106475:	68 d5 00 00 00       	push   $0xd5
8010647a:	e9 ca f2 ff ff       	jmp    80105749 <alltraps>

8010647f <vector214>:
8010647f:	6a 00                	push   $0x0
80106481:	68 d6 00 00 00       	push   $0xd6
80106486:	e9 be f2 ff ff       	jmp    80105749 <alltraps>

8010648b <vector215>:
8010648b:	6a 00                	push   $0x0
8010648d:	68 d7 00 00 00       	push   $0xd7
80106492:	e9 b2 f2 ff ff       	jmp    80105749 <alltraps>

80106497 <vector216>:
80106497:	6a 00                	push   $0x0
80106499:	68 d8 00 00 00       	push   $0xd8
8010649e:	e9 a6 f2 ff ff       	jmp    80105749 <alltraps>

801064a3 <vector217>:
801064a3:	6a 00                	push   $0x0
801064a5:	68 d9 00 00 00       	push   $0xd9
801064aa:	e9 9a f2 ff ff       	jmp    80105749 <alltraps>

801064af <vector218>:
801064af:	6a 00                	push   $0x0
801064b1:	68 da 00 00 00       	push   $0xda
801064b6:	e9 8e f2 ff ff       	jmp    80105749 <alltraps>

801064bb <vector219>:
801064bb:	6a 00                	push   $0x0
801064bd:	68 db 00 00 00       	push   $0xdb
801064c2:	e9 82 f2 ff ff       	jmp    80105749 <alltraps>

801064c7 <vector220>:
801064c7:	6a 00                	push   $0x0
801064c9:	68 dc 00 00 00       	push   $0xdc
801064ce:	e9 76 f2 ff ff       	jmp    80105749 <alltraps>

801064d3 <vector221>:
801064d3:	6a 00                	push   $0x0
801064d5:	68 dd 00 00 00       	push   $0xdd
801064da:	e9 6a f2 ff ff       	jmp    80105749 <alltraps>

801064df <vector222>:
801064df:	6a 00                	push   $0x0
801064e1:	68 de 00 00 00       	push   $0xde
801064e6:	e9 5e f2 ff ff       	jmp    80105749 <alltraps>

801064eb <vector223>:
801064eb:	6a 00                	push   $0x0
801064ed:	68 df 00 00 00       	push   $0xdf
801064f2:	e9 52 f2 ff ff       	jmp    80105749 <alltraps>

801064f7 <vector224>:
801064f7:	6a 00                	push   $0x0
801064f9:	68 e0 00 00 00       	push   $0xe0
801064fe:	e9 46 f2 ff ff       	jmp    80105749 <alltraps>

80106503 <vector225>:
80106503:	6a 00                	push   $0x0
80106505:	68 e1 00 00 00       	push   $0xe1
8010650a:	e9 3a f2 ff ff       	jmp    80105749 <alltraps>

8010650f <vector226>:
8010650f:	6a 00                	push   $0x0
80106511:	68 e2 00 00 00       	push   $0xe2
80106516:	e9 2e f2 ff ff       	jmp    80105749 <alltraps>

8010651b <vector227>:
8010651b:	6a 00                	push   $0x0
8010651d:	68 e3 00 00 00       	push   $0xe3
80106522:	e9 22 f2 ff ff       	jmp    80105749 <alltraps>

80106527 <vector228>:
80106527:	6a 00                	push   $0x0
80106529:	68 e4 00 00 00       	push   $0xe4
8010652e:	e9 16 f2 ff ff       	jmp    80105749 <alltraps>

80106533 <vector229>:
80106533:	6a 00                	push   $0x0
80106535:	68 e5 00 00 00       	push   $0xe5
8010653a:	e9 0a f2 ff ff       	jmp    80105749 <alltraps>

8010653f <vector230>:
8010653f:	6a 00                	push   $0x0
80106541:	68 e6 00 00 00       	push   $0xe6
80106546:	e9 fe f1 ff ff       	jmp    80105749 <alltraps>

8010654b <vector231>:
8010654b:	6a 00                	push   $0x0
8010654d:	68 e7 00 00 00       	push   $0xe7
80106552:	e9 f2 f1 ff ff       	jmp    80105749 <alltraps>

80106557 <vector232>:
80106557:	6a 00                	push   $0x0
80106559:	68 e8 00 00 00       	push   $0xe8
8010655e:	e9 e6 f1 ff ff       	jmp    80105749 <alltraps>

80106563 <vector233>:
80106563:	6a 00                	push   $0x0
80106565:	68 e9 00 00 00       	push   $0xe9
8010656a:	e9 da f1 ff ff       	jmp    80105749 <alltraps>

8010656f <vector234>:
8010656f:	6a 00                	push   $0x0
80106571:	68 ea 00 00 00       	push   $0xea
80106576:	e9 ce f1 ff ff       	jmp    80105749 <alltraps>

8010657b <vector235>:
8010657b:	6a 00                	push   $0x0
8010657d:	68 eb 00 00 00       	push   $0xeb
80106582:	e9 c2 f1 ff ff       	jmp    80105749 <alltraps>

80106587 <vector236>:
80106587:	6a 00                	push   $0x0
80106589:	68 ec 00 00 00       	push   $0xec
8010658e:	e9 b6 f1 ff ff       	jmp    80105749 <alltraps>

80106593 <vector237>:
80106593:	6a 00                	push   $0x0
80106595:	68 ed 00 00 00       	push   $0xed
8010659a:	e9 aa f1 ff ff       	jmp    80105749 <alltraps>

8010659f <vector238>:
8010659f:	6a 00                	push   $0x0
801065a1:	68 ee 00 00 00       	push   $0xee
801065a6:	e9 9e f1 ff ff       	jmp    80105749 <alltraps>

801065ab <vector239>:
801065ab:	6a 00                	push   $0x0
801065ad:	68 ef 00 00 00       	push   $0xef
801065b2:	e9 92 f1 ff ff       	jmp    80105749 <alltraps>

801065b7 <vector240>:
801065b7:	6a 00                	push   $0x0
801065b9:	68 f0 00 00 00       	push   $0xf0
801065be:	e9 86 f1 ff ff       	jmp    80105749 <alltraps>

801065c3 <vector241>:
801065c3:	6a 00                	push   $0x0
801065c5:	68 f1 00 00 00       	push   $0xf1
801065ca:	e9 7a f1 ff ff       	jmp    80105749 <alltraps>

801065cf <vector242>:
801065cf:	6a 00                	push   $0x0
801065d1:	68 f2 00 00 00       	push   $0xf2
801065d6:	e9 6e f1 ff ff       	jmp    80105749 <alltraps>

801065db <vector243>:
801065db:	6a 00                	push   $0x0
801065dd:	68 f3 00 00 00       	push   $0xf3
801065e2:	e9 62 f1 ff ff       	jmp    80105749 <alltraps>

801065e7 <vector244>:
801065e7:	6a 00                	push   $0x0
801065e9:	68 f4 00 00 00       	push   $0xf4
801065ee:	e9 56 f1 ff ff       	jmp    80105749 <alltraps>

801065f3 <vector245>:
801065f3:	6a 00                	push   $0x0
801065f5:	68 f5 00 00 00       	push   $0xf5
801065fa:	e9 4a f1 ff ff       	jmp    80105749 <alltraps>

801065ff <vector246>:
801065ff:	6a 00                	push   $0x0
80106601:	68 f6 00 00 00       	push   $0xf6
80106606:	e9 3e f1 ff ff       	jmp    80105749 <alltraps>

8010660b <vector247>:
8010660b:	6a 00                	push   $0x0
8010660d:	68 f7 00 00 00       	push   $0xf7
80106612:	e9 32 f1 ff ff       	jmp    80105749 <alltraps>

80106617 <vector248>:
80106617:	6a 00                	push   $0x0
80106619:	68 f8 00 00 00       	push   $0xf8
8010661e:	e9 26 f1 ff ff       	jmp    80105749 <alltraps>

80106623 <vector249>:
80106623:	6a 00                	push   $0x0
80106625:	68 f9 00 00 00       	push   $0xf9
8010662a:	e9 1a f1 ff ff       	jmp    80105749 <alltraps>

8010662f <vector250>:
8010662f:	6a 00                	push   $0x0
80106631:	68 fa 00 00 00       	push   $0xfa
80106636:	e9 0e f1 ff ff       	jmp    80105749 <alltraps>

8010663b <vector251>:
8010663b:	6a 00                	push   $0x0
8010663d:	68 fb 00 00 00       	push   $0xfb
80106642:	e9 02 f1 ff ff       	jmp    80105749 <alltraps>

80106647 <vector252>:
80106647:	6a 00                	push   $0x0
80106649:	68 fc 00 00 00       	push   $0xfc
8010664e:	e9 f6 f0 ff ff       	jmp    80105749 <alltraps>

80106653 <vector253>:
80106653:	6a 00                	push   $0x0
80106655:	68 fd 00 00 00       	push   $0xfd
8010665a:	e9 ea f0 ff ff       	jmp    80105749 <alltraps>

8010665f <vector254>:
8010665f:	6a 00                	push   $0x0
80106661:	68 fe 00 00 00       	push   $0xfe
80106666:	e9 de f0 ff ff       	jmp    80105749 <alltraps>

8010666b <vector255>:
8010666b:	6a 00                	push   $0x0
8010666d:	68 ff 00 00 00       	push   $0xff
80106672:	e9 d2 f0 ff ff       	jmp    80105749 <alltraps>
80106677:	66 90                	xchg   %ax,%ax
80106679:	66 90                	xchg   %ax,%ax
8010667b:	66 90                	xchg   %ax,%ax
8010667d:	66 90                	xchg   %ax,%ax
8010667f:	90                   	nop

80106680 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106680:	55                   	push   %ebp
80106681:	89 e5                	mov    %esp,%ebp
80106683:	57                   	push   %edi
80106684:	56                   	push   %esi
80106685:	53                   	push   %ebx
80106686:	89 d3                	mov    %edx,%ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106688:	c1 ea 16             	shr    $0x16,%edx
8010668b:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
8010668e:	83 ec 0c             	sub    $0xc,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
80106691:	8b 07                	mov    (%edi),%eax
80106693:	a8 01                	test   $0x1,%al
80106695:	74 29                	je     801066c0 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106697:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010669c:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
801066a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
801066a5:	c1 eb 0a             	shr    $0xa,%ebx
801066a8:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
801066ae:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
}
801066b1:	5b                   	pop    %ebx
801066b2:	5e                   	pop    %esi
801066b3:	5f                   	pop    %edi
801066b4:	5d                   	pop    %ebp
801066b5:	c3                   	ret    
801066b6:	8d 76 00             	lea    0x0(%esi),%esi
801066b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
801066c0:	85 c9                	test   %ecx,%ecx
801066c2:	74 2c                	je     801066f0 <walkpgdir+0x70>
801066c4:	e8 c7 bd ff ff       	call   80102490 <kalloc>
801066c9:	85 c0                	test   %eax,%eax
801066cb:	89 c6                	mov    %eax,%esi
801066cd:	74 21                	je     801066f0 <walkpgdir+0x70>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
801066cf:	83 ec 04             	sub    $0x4,%esp
801066d2:	68 00 10 00 00       	push   $0x1000
801066d7:	6a 00                	push   $0x0
801066d9:	50                   	push   %eax
801066da:	e8 61 de ff ff       	call   80104540 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
801066df:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801066e5:	83 c4 10             	add    $0x10,%esp
801066e8:	83 c8 07             	or     $0x7,%eax
801066eb:	89 07                	mov    %eax,(%edi)
801066ed:	eb b3                	jmp    801066a2 <walkpgdir+0x22>
801066ef:	90                   	nop
  }
  return &pgtab[PTX(va)];
}
801066f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
801066f3:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
801066f5:	5b                   	pop    %ebx
801066f6:	5e                   	pop    %esi
801066f7:	5f                   	pop    %edi
801066f8:	5d                   	pop    %ebp
801066f9:	c3                   	ret    
801066fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106700 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106700:	55                   	push   %ebp
80106701:	89 e5                	mov    %esp,%ebp
80106703:	57                   	push   %edi
80106704:	56                   	push   %esi
80106705:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106706:	89 d3                	mov    %edx,%ebx
80106708:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
8010670e:	83 ec 1c             	sub    $0x1c,%esp
80106711:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106714:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106718:	8b 7d 08             	mov    0x8(%ebp),%edi
8010671b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106720:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106723:	8b 45 0c             	mov    0xc(%ebp),%eax
80106726:	29 df                	sub    %ebx,%edi
80106728:	83 c8 01             	or     $0x1,%eax
8010672b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010672e:	eb 15                	jmp    80106745 <mappages+0x45>
  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
80106730:	f6 00 01             	testb  $0x1,(%eax)
80106733:	75 45                	jne    8010677a <mappages+0x7a>
      panic("remap");
    *pte = pa | perm | PTE_P;
80106735:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106738:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
8010673b:	89 30                	mov    %esi,(%eax)
    if(a == last)
8010673d:	74 31                	je     80106770 <mappages+0x70>
      break;
    a += PGSIZE;
8010673f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106745:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106748:	b9 01 00 00 00       	mov    $0x1,%ecx
8010674d:	89 da                	mov    %ebx,%edx
8010674f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106752:	e8 29 ff ff ff       	call   80106680 <walkpgdir>
80106757:	85 c0                	test   %eax,%eax
80106759:	75 d5                	jne    80106730 <mappages+0x30>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
8010675b:	8d 65 f4             	lea    -0xc(%ebp),%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
8010675e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
80106763:	5b                   	pop    %ebx
80106764:	5e                   	pop    %esi
80106765:	5f                   	pop    %edi
80106766:	5d                   	pop    %ebp
80106767:	c3                   	ret    
80106768:	90                   	nop
80106769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106770:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
80106773:	31 c0                	xor    %eax,%eax
}
80106775:	5b                   	pop    %ebx
80106776:	5e                   	pop    %esi
80106777:	5f                   	pop    %edi
80106778:	5d                   	pop    %ebp
80106779:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
8010677a:	83 ec 0c             	sub    $0xc,%esp
8010677d:	68 ec 79 10 80       	push   $0x801079ec
80106782:	e8 e9 9b ff ff       	call   80100370 <panic>
80106787:	89 f6                	mov    %esi,%esi
80106789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106790 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106790:	55                   	push   %ebp
80106791:	89 e5                	mov    %esp,%ebp
80106793:	57                   	push   %edi
80106794:	56                   	push   %esi
80106795:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106796:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
8010679c:	89 c7                	mov    %eax,%edi
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
8010679e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801067a4:	83 ec 1c             	sub    $0x1c,%esp
801067a7:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801067aa:	39 d3                	cmp    %edx,%ebx
801067ac:	73 66                	jae    80106814 <deallocuvm.part.0+0x84>
801067ae:	89 d6                	mov    %edx,%esi
801067b0:	eb 3d                	jmp    801067ef <deallocuvm.part.0+0x5f>
801067b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
801067b8:	8b 10                	mov    (%eax),%edx
801067ba:	f6 c2 01             	test   $0x1,%dl
801067bd:	74 26                	je     801067e5 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
801067bf:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801067c5:	74 58                	je     8010681f <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
801067c7:	83 ec 0c             	sub    $0xc,%esp
801067ca:	81 c2 00 00 00 80    	add    $0x80000000,%edx
801067d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801067d3:	52                   	push   %edx
801067d4:	e8 07 bb ff ff       	call   801022e0 <kfree>
      *pte = 0;
801067d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801067dc:	83 c4 10             	add    $0x10,%esp
801067df:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801067e5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801067eb:	39 f3                	cmp    %esi,%ebx
801067ed:	73 25                	jae    80106814 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
801067ef:	31 c9                	xor    %ecx,%ecx
801067f1:	89 da                	mov    %ebx,%edx
801067f3:	89 f8                	mov    %edi,%eax
801067f5:	e8 86 fe ff ff       	call   80106680 <walkpgdir>
    if(!pte)
801067fa:	85 c0                	test   %eax,%eax
801067fc:	75 ba                	jne    801067b8 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
801067fe:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106804:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
8010680a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106810:	39 f3                	cmp    %esi,%ebx
80106812:	72 db                	jb     801067ef <deallocuvm.part.0+0x5f>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106814:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106817:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010681a:	5b                   	pop    %ebx
8010681b:	5e                   	pop    %esi
8010681c:	5f                   	pop    %edi
8010681d:	5d                   	pop    %ebp
8010681e:	c3                   	ret    
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
8010681f:	83 ec 0c             	sub    $0xc,%esp
80106822:	68 26 73 10 80       	push   $0x80107326
80106827:	e8 44 9b ff ff       	call   80100370 <panic>
8010682c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106830 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106830:	55                   	push   %ebp
80106831:	89 e5                	mov    %esp,%ebp
80106833:	83 ec 18             	sub    $0x18,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
80106836:	e8 25 cf ff ff       	call   80103760 <cpuid>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010683b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106841:	31 c9                	xor    %ecx,%ecx
80106843:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106848:	66 89 90 f8 27 11 80 	mov    %dx,-0x7feed808(%eax)
8010684f:	66 89 88 fa 27 11 80 	mov    %cx,-0x7feed806(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106856:	ba ff ff ff ff       	mov    $0xffffffff,%edx
8010685b:	31 c9                	xor    %ecx,%ecx
8010685d:	66 89 90 00 28 11 80 	mov    %dx,-0x7feed800(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106864:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106869:	66 89 88 02 28 11 80 	mov    %cx,-0x7feed7fe(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106870:	31 c9                	xor    %ecx,%ecx
80106872:	66 89 90 08 28 11 80 	mov    %dx,-0x7feed7f8(%eax)
80106879:	66 89 88 0a 28 11 80 	mov    %cx,-0x7feed7f6(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106880:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106885:	31 c9                	xor    %ecx,%ecx
80106887:	66 89 90 10 28 11 80 	mov    %dx,-0x7feed7f0(%eax)
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010688e:	c6 80 fc 27 11 80 00 	movb   $0x0,-0x7feed804(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80106895:	ba 2f 00 00 00       	mov    $0x2f,%edx
8010689a:	c6 80 fd 27 11 80 9a 	movb   $0x9a,-0x7feed803(%eax)
801068a1:	c6 80 fe 27 11 80 cf 	movb   $0xcf,-0x7feed802(%eax)
801068a8:	c6 80 ff 27 11 80 00 	movb   $0x0,-0x7feed801(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801068af:	c6 80 04 28 11 80 00 	movb   $0x0,-0x7feed7fc(%eax)
801068b6:	c6 80 05 28 11 80 92 	movb   $0x92,-0x7feed7fb(%eax)
801068bd:	c6 80 06 28 11 80 cf 	movb   $0xcf,-0x7feed7fa(%eax)
801068c4:	c6 80 07 28 11 80 00 	movb   $0x0,-0x7feed7f9(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801068cb:	c6 80 0c 28 11 80 00 	movb   $0x0,-0x7feed7f4(%eax)
801068d2:	c6 80 0d 28 11 80 fa 	movb   $0xfa,-0x7feed7f3(%eax)
801068d9:	c6 80 0e 28 11 80 cf 	movb   $0xcf,-0x7feed7f2(%eax)
801068e0:	c6 80 0f 28 11 80 00 	movb   $0x0,-0x7feed7f1(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801068e7:	66 89 88 12 28 11 80 	mov    %cx,-0x7feed7ee(%eax)
801068ee:	c6 80 14 28 11 80 00 	movb   $0x0,-0x7feed7ec(%eax)
801068f5:	c6 80 15 28 11 80 f2 	movb   $0xf2,-0x7feed7eb(%eax)
801068fc:	c6 80 16 28 11 80 cf 	movb   $0xcf,-0x7feed7ea(%eax)
80106903:	c6 80 17 28 11 80 00 	movb   $0x0,-0x7feed7e9(%eax)
  lgdt(c->gdt, sizeof(c->gdt));
8010690a:	05 f0 27 11 80       	add    $0x801127f0,%eax
8010690f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  pd[1] = (uint)p;
80106913:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106917:	c1 e8 10             	shr    $0x10,%eax
8010691a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
8010691e:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106921:	0f 01 10             	lgdtl  (%eax)
}
80106924:	c9                   	leave  
80106925:	c3                   	ret    
80106926:	8d 76 00             	lea    0x0(%esi),%esi
80106929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106930 <switchkvm>:
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106930:	a1 a4 54 11 80       	mov    0x801154a4,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106935:	55                   	push   %ebp
80106936:	89 e5                	mov    %esp,%ebp
80106938:	05 00 00 00 80       	add    $0x80000000,%eax
8010693d:	0f 22 d8             	mov    %eax,%cr3
  lcr3(V2P(kpgdir));   // switch to the kernel page table
}
80106940:	5d                   	pop    %ebp
80106941:	c3                   	ret    
80106942:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106950 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80106950:	55                   	push   %ebp
80106951:	89 e5                	mov    %esp,%ebp
80106953:	57                   	push   %edi
80106954:	56                   	push   %esi
80106955:	53                   	push   %ebx
80106956:	83 ec 1c             	sub    $0x1c,%esp
80106959:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
8010695c:	85 f6                	test   %esi,%esi
8010695e:	0f 84 cd 00 00 00    	je     80106a31 <switchuvm+0xe1>
    panic("switchuvm: no process");
  if(p->kstack == 0)
80106964:	8b 46 08             	mov    0x8(%esi),%eax
80106967:	85 c0                	test   %eax,%eax
80106969:	0f 84 dc 00 00 00    	je     80106a4b <switchuvm+0xfb>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
8010696f:	8b 7e 04             	mov    0x4(%esi),%edi
80106972:	85 ff                	test   %edi,%edi
80106974:	0f 84 c4 00 00 00    	je     80106a3e <switchuvm+0xee>
    panic("switchuvm: no pgdir");

  pushcli();
8010697a:	e8 e1 d9 ff ff       	call   80104360 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
8010697f:	e8 5c cd ff ff       	call   801036e0 <mycpu>
80106984:	89 c3                	mov    %eax,%ebx
80106986:	e8 55 cd ff ff       	call   801036e0 <mycpu>
8010698b:	89 c7                	mov    %eax,%edi
8010698d:	e8 4e cd ff ff       	call   801036e0 <mycpu>
80106992:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106995:	83 c7 08             	add    $0x8,%edi
80106998:	e8 43 cd ff ff       	call   801036e0 <mycpu>
8010699d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801069a0:	83 c0 08             	add    $0x8,%eax
801069a3:	ba 67 00 00 00       	mov    $0x67,%edx
801069a8:	c1 e8 18             	shr    $0x18,%eax
801069ab:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
801069b2:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
801069b9:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
801069c0:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
801069c7:	83 c1 08             	add    $0x8,%ecx
801069ca:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
801069d0:	c1 e9 10             	shr    $0x10,%ecx
801069d3:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
  mycpu()->gdt[SEG_TSS].s = 0;
  mycpu()->ts.ss0 = SEG_KDATA << 3;
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
801069d9:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    panic("switchuvm: no pgdir");

  pushcli();
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
                                sizeof(mycpu()->ts)-1, 0);
  mycpu()->gdt[SEG_TSS].s = 0;
801069de:	e8 fd cc ff ff       	call   801036e0 <mycpu>
801069e3:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
801069ea:	e8 f1 cc ff ff       	call   801036e0 <mycpu>
801069ef:	b9 10 00 00 00       	mov    $0x10,%ecx
801069f4:	66 89 48 10          	mov    %cx,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
801069f8:	e8 e3 cc ff ff       	call   801036e0 <mycpu>
801069fd:	8b 56 08             	mov    0x8(%esi),%edx
80106a00:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
80106a06:	89 48 0c             	mov    %ecx,0xc(%eax)
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106a09:	e8 d2 cc ff ff       	call   801036e0 <mycpu>
80106a0e:	66 89 58 6e          	mov    %bx,0x6e(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
80106a12:	b8 28 00 00 00       	mov    $0x28,%eax
80106a17:	0f 00 d8             	ltr    %ax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106a1a:	8b 46 04             	mov    0x4(%esi),%eax
80106a1d:	05 00 00 00 80       	add    $0x80000000,%eax
80106a22:	0f 22 d8             	mov    %eax,%cr3
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
}
80106a25:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a28:	5b                   	pop    %ebx
80106a29:	5e                   	pop    %esi
80106a2a:	5f                   	pop    %edi
80106a2b:	5d                   	pop    %ebp
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
80106a2c:	e9 6f d9 ff ff       	jmp    801043a0 <popcli>
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
80106a31:	83 ec 0c             	sub    $0xc,%esp
80106a34:	68 f2 79 10 80       	push   $0x801079f2
80106a39:	e8 32 99 ff ff       	call   80100370 <panic>
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
80106a3e:	83 ec 0c             	sub    $0xc,%esp
80106a41:	68 1d 7a 10 80       	push   $0x80107a1d
80106a46:	e8 25 99 ff ff       	call   80100370 <panic>
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
80106a4b:	83 ec 0c             	sub    $0xc,%esp
80106a4e:	68 08 7a 10 80       	push   $0x80107a08
80106a53:	e8 18 99 ff ff       	call   80100370 <panic>
80106a58:	90                   	nop
80106a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106a60 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106a60:	55                   	push   %ebp
80106a61:	89 e5                	mov    %esp,%ebp
80106a63:	57                   	push   %edi
80106a64:	56                   	push   %esi
80106a65:	53                   	push   %ebx
80106a66:	83 ec 1c             	sub    $0x1c,%esp
80106a69:	8b 75 10             	mov    0x10(%ebp),%esi
80106a6c:	8b 45 08             	mov    0x8(%ebp),%eax
80106a6f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
80106a72:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106a78:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
80106a7b:	77 49                	ja     80106ac6 <inituvm+0x66>
    panic("inituvm: more than a page");
  mem = kalloc();
80106a7d:	e8 0e ba ff ff       	call   80102490 <kalloc>
  memset(mem, 0, PGSIZE);
80106a82:	83 ec 04             	sub    $0x4,%esp
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
80106a85:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106a87:	68 00 10 00 00       	push   $0x1000
80106a8c:	6a 00                	push   $0x0
80106a8e:	50                   	push   %eax
80106a8f:	e8 ac da ff ff       	call   80104540 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106a94:	58                   	pop    %eax
80106a95:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106a9b:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106aa0:	5a                   	pop    %edx
80106aa1:	6a 06                	push   $0x6
80106aa3:	50                   	push   %eax
80106aa4:	31 d2                	xor    %edx,%edx
80106aa6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106aa9:	e8 52 fc ff ff       	call   80106700 <mappages>
  memmove(mem, init, sz);
80106aae:	89 75 10             	mov    %esi,0x10(%ebp)
80106ab1:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106ab4:	83 c4 10             	add    $0x10,%esp
80106ab7:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106aba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106abd:	5b                   	pop    %ebx
80106abe:	5e                   	pop    %esi
80106abf:	5f                   	pop    %edi
80106ac0:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80106ac1:	e9 2a db ff ff       	jmp    801045f0 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80106ac6:	83 ec 0c             	sub    $0xc,%esp
80106ac9:	68 31 7a 10 80       	push   $0x80107a31
80106ace:	e8 9d 98 ff ff       	call   80100370 <panic>
80106ad3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106ae0 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80106ae0:	55                   	push   %ebp
80106ae1:	89 e5                	mov    %esp,%ebp
80106ae3:	57                   	push   %edi
80106ae4:	56                   	push   %esi
80106ae5:	53                   	push   %ebx
80106ae6:	83 ec 0c             	sub    $0xc,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80106ae9:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106af0:	0f 85 91 00 00 00    	jne    80106b87 <loaduvm+0xa7>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80106af6:	8b 75 18             	mov    0x18(%ebp),%esi
80106af9:	31 db                	xor    %ebx,%ebx
80106afb:	85 f6                	test   %esi,%esi
80106afd:	75 1a                	jne    80106b19 <loaduvm+0x39>
80106aff:	eb 6f                	jmp    80106b70 <loaduvm+0x90>
80106b01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b08:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b0e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106b14:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106b17:	76 57                	jbe    80106b70 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106b19:	8b 55 0c             	mov    0xc(%ebp),%edx
80106b1c:	8b 45 08             	mov    0x8(%ebp),%eax
80106b1f:	31 c9                	xor    %ecx,%ecx
80106b21:	01 da                	add    %ebx,%edx
80106b23:	e8 58 fb ff ff       	call   80106680 <walkpgdir>
80106b28:	85 c0                	test   %eax,%eax
80106b2a:	74 4e                	je     80106b7a <loaduvm+0x9a>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106b2c:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106b2e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
80106b31:	bf 00 10 00 00       	mov    $0x1000,%edi
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106b36:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106b3b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106b41:	0f 46 fe             	cmovbe %esi,%edi
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106b44:	01 d9                	add    %ebx,%ecx
80106b46:	05 00 00 00 80       	add    $0x80000000,%eax
80106b4b:	57                   	push   %edi
80106b4c:	51                   	push   %ecx
80106b4d:	50                   	push   %eax
80106b4e:	ff 75 10             	pushl  0x10(%ebp)
80106b51:	e8 fa ad ff ff       	call   80101950 <readi>
80106b56:	83 c4 10             	add    $0x10,%esp
80106b59:	39 c7                	cmp    %eax,%edi
80106b5b:	74 ab                	je     80106b08 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
80106b5d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
80106b60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80106b65:	5b                   	pop    %ebx
80106b66:	5e                   	pop    %esi
80106b67:	5f                   	pop    %edi
80106b68:	5d                   	pop    %ebp
80106b69:	c3                   	ret    
80106b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b70:	8d 65 f4             	lea    -0xc(%ebp),%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80106b73:	31 c0                	xor    %eax,%eax
}
80106b75:	5b                   	pop    %ebx
80106b76:	5e                   	pop    %esi
80106b77:	5f                   	pop    %edi
80106b78:	5d                   	pop    %ebp
80106b79:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
80106b7a:	83 ec 0c             	sub    $0xc,%esp
80106b7d:	68 4b 7a 10 80       	push   $0x80107a4b
80106b82:	e8 e9 97 ff ff       	call   80100370 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
80106b87:	83 ec 0c             	sub    $0xc,%esp
80106b8a:	68 b8 7a 10 80       	push   $0x80107ab8
80106b8f:	e8 dc 97 ff ff       	call   80100370 <panic>
80106b94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106ba0 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106ba0:	55                   	push   %ebp
80106ba1:	89 e5                	mov    %esp,%ebp
80106ba3:	57                   	push   %edi
80106ba4:	56                   	push   %esi
80106ba5:	53                   	push   %ebx
80106ba6:	83 ec 0c             	sub    $0xc,%esp
80106ba9:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
80106bac:	85 ff                	test   %edi,%edi
80106bae:	0f 88 ca 00 00 00    	js     80106c7e <allocuvm+0xde>
    return 0;
  if(newsz < oldsz)
80106bb4:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106bb7:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
80106bba:	0f 82 82 00 00 00    	jb     80106c42 <allocuvm+0xa2>
    return oldsz;

  a = PGROUNDUP(oldsz);
80106bc0:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106bc6:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106bcc:	39 df                	cmp    %ebx,%edi
80106bce:	77 43                	ja     80106c13 <allocuvm+0x73>
80106bd0:	e9 bb 00 00 00       	jmp    80106c90 <allocuvm+0xf0>
80106bd5:	8d 76 00             	lea    0x0(%esi),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80106bd8:	83 ec 04             	sub    $0x4,%esp
80106bdb:	68 00 10 00 00       	push   $0x1000
80106be0:	6a 00                	push   $0x0
80106be2:	50                   	push   %eax
80106be3:	e8 58 d9 ff ff       	call   80104540 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106be8:	58                   	pop    %eax
80106be9:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106bef:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106bf4:	5a                   	pop    %edx
80106bf5:	6a 06                	push   $0x6
80106bf7:	50                   	push   %eax
80106bf8:	89 da                	mov    %ebx,%edx
80106bfa:	8b 45 08             	mov    0x8(%ebp),%eax
80106bfd:	e8 fe fa ff ff       	call   80106700 <mappages>
80106c02:	83 c4 10             	add    $0x10,%esp
80106c05:	85 c0                	test   %eax,%eax
80106c07:	78 47                	js     80106c50 <allocuvm+0xb0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106c09:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c0f:	39 df                	cmp    %ebx,%edi
80106c11:	76 7d                	jbe    80106c90 <allocuvm+0xf0>
    mem = kalloc();
80106c13:	e8 78 b8 ff ff       	call   80102490 <kalloc>
    if(mem == 0){
80106c18:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80106c1a:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106c1c:	75 ba                	jne    80106bd8 <allocuvm+0x38>
      cprintf("allocuvm out of memory\n");
80106c1e:	83 ec 0c             	sub    $0xc,%esp
80106c21:	68 69 7a 10 80       	push   $0x80107a69
80106c26:	e8 35 9a ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106c2b:	83 c4 10             	add    $0x10,%esp
80106c2e:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106c31:	76 4b                	jbe    80106c7e <allocuvm+0xde>
80106c33:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106c36:	8b 45 08             	mov    0x8(%ebp),%eax
80106c39:	89 fa                	mov    %edi,%edx
80106c3b:	e8 50 fb ff ff       	call   80106790 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
80106c40:	31 c0                	xor    %eax,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106c42:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c45:	5b                   	pop    %ebx
80106c46:	5e                   	pop    %esi
80106c47:	5f                   	pop    %edi
80106c48:	5d                   	pop    %ebp
80106c49:	c3                   	ret    
80106c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80106c50:	83 ec 0c             	sub    $0xc,%esp
80106c53:	68 81 7a 10 80       	push   $0x80107a81
80106c58:	e8 03 9a ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106c5d:	83 c4 10             	add    $0x10,%esp
80106c60:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106c63:	76 0d                	jbe    80106c72 <allocuvm+0xd2>
80106c65:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106c68:	8b 45 08             	mov    0x8(%ebp),%eax
80106c6b:	89 fa                	mov    %edi,%edx
80106c6d:	e8 1e fb ff ff       	call   80106790 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
80106c72:	83 ec 0c             	sub    $0xc,%esp
80106c75:	56                   	push   %esi
80106c76:	e8 65 b6 ff ff       	call   801022e0 <kfree>
      return 0;
80106c7b:	83 c4 10             	add    $0x10,%esp
    }
  }
  return newsz;
}
80106c7e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
80106c81:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
80106c83:	5b                   	pop    %ebx
80106c84:	5e                   	pop    %esi
80106c85:	5f                   	pop    %edi
80106c86:	5d                   	pop    %ebp
80106c87:	c3                   	ret    
80106c88:	90                   	nop
80106c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c90:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106c93:	89 f8                	mov    %edi,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106c95:	5b                   	pop    %ebx
80106c96:	5e                   	pop    %esi
80106c97:	5f                   	pop    %edi
80106c98:	5d                   	pop    %ebp
80106c99:	c3                   	ret    
80106c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106ca0 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106ca0:	55                   	push   %ebp
80106ca1:	89 e5                	mov    %esp,%ebp
80106ca3:	8b 55 0c             	mov    0xc(%ebp),%edx
80106ca6:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106ca9:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106cac:	39 d1                	cmp    %edx,%ecx
80106cae:	73 10                	jae    80106cc0 <deallocuvm+0x20>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106cb0:	5d                   	pop    %ebp
80106cb1:	e9 da fa ff ff       	jmp    80106790 <deallocuvm.part.0>
80106cb6:	8d 76 00             	lea    0x0(%esi),%esi
80106cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106cc0:	89 d0                	mov    %edx,%eax
80106cc2:	5d                   	pop    %ebp
80106cc3:	c3                   	ret    
80106cc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106cca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106cd0 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106cd0:	55                   	push   %ebp
80106cd1:	89 e5                	mov    %esp,%ebp
80106cd3:	57                   	push   %edi
80106cd4:	56                   	push   %esi
80106cd5:	53                   	push   %ebx
80106cd6:	83 ec 0c             	sub    $0xc,%esp
80106cd9:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106cdc:	85 f6                	test   %esi,%esi
80106cde:	74 59                	je     80106d39 <freevm+0x69>
80106ce0:	31 c9                	xor    %ecx,%ecx
80106ce2:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106ce7:	89 f0                	mov    %esi,%eax
80106ce9:	e8 a2 fa ff ff       	call   80106790 <deallocuvm.part.0>
80106cee:	89 f3                	mov    %esi,%ebx
80106cf0:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106cf6:	eb 0f                	jmp    80106d07 <freevm+0x37>
80106cf8:	90                   	nop
80106cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d00:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106d03:	39 fb                	cmp    %edi,%ebx
80106d05:	74 23                	je     80106d2a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106d07:	8b 03                	mov    (%ebx),%eax
80106d09:	a8 01                	test   $0x1,%al
80106d0b:	74 f3                	je     80106d00 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
80106d0d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106d12:	83 ec 0c             	sub    $0xc,%esp
80106d15:	83 c3 04             	add    $0x4,%ebx
80106d18:	05 00 00 00 80       	add    $0x80000000,%eax
80106d1d:	50                   	push   %eax
80106d1e:	e8 bd b5 ff ff       	call   801022e0 <kfree>
80106d23:	83 c4 10             	add    $0x10,%esp
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106d26:	39 fb                	cmp    %edi,%ebx
80106d28:	75 dd                	jne    80106d07 <freevm+0x37>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106d2a:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106d2d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d30:	5b                   	pop    %ebx
80106d31:	5e                   	pop    %esi
80106d32:	5f                   	pop    %edi
80106d33:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106d34:	e9 a7 b5 ff ff       	jmp    801022e0 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
80106d39:	83 ec 0c             	sub    $0xc,%esp
80106d3c:	68 9d 7a 10 80       	push   $0x80107a9d
80106d41:	e8 2a 96 ff ff       	call   80100370 <panic>
80106d46:	8d 76 00             	lea    0x0(%esi),%esi
80106d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d50 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106d50:	55                   	push   %ebp
80106d51:	89 e5                	mov    %esp,%ebp
80106d53:	56                   	push   %esi
80106d54:	53                   	push   %ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106d55:	e8 36 b7 ff ff       	call   80102490 <kalloc>
80106d5a:	85 c0                	test   %eax,%eax
80106d5c:	74 6a                	je     80106dc8 <setupkvm+0x78>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106d5e:	83 ec 04             	sub    $0x4,%esp
80106d61:	89 c6                	mov    %eax,%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106d63:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106d68:	68 00 10 00 00       	push   $0x1000
80106d6d:	6a 00                	push   $0x0
80106d6f:	50                   	push   %eax
80106d70:	e8 cb d7 ff ff       	call   80104540 <memset>
80106d75:	83 c4 10             	add    $0x10,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106d78:	8b 43 04             	mov    0x4(%ebx),%eax
80106d7b:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106d7e:	83 ec 08             	sub    $0x8,%esp
80106d81:	8b 13                	mov    (%ebx),%edx
80106d83:	ff 73 0c             	pushl  0xc(%ebx)
80106d86:	50                   	push   %eax
80106d87:	29 c1                	sub    %eax,%ecx
80106d89:	89 f0                	mov    %esi,%eax
80106d8b:	e8 70 f9 ff ff       	call   80106700 <mappages>
80106d90:	83 c4 10             	add    $0x10,%esp
80106d93:	85 c0                	test   %eax,%eax
80106d95:	78 19                	js     80106db0 <setupkvm+0x60>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106d97:	83 c3 10             	add    $0x10,%ebx
80106d9a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106da0:	75 d6                	jne    80106d78 <setupkvm+0x28>
80106da2:	89 f0                	mov    %esi,%eax
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
    }
  return pgdir;
}
80106da4:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106da7:	5b                   	pop    %ebx
80106da8:	5e                   	pop    %esi
80106da9:	5d                   	pop    %ebp
80106daa:	c3                   	ret    
80106dab:	90                   	nop
80106dac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
80106db0:	83 ec 0c             	sub    $0xc,%esp
80106db3:	56                   	push   %esi
80106db4:	e8 17 ff ff ff       	call   80106cd0 <freevm>
      return 0;
80106db9:	83 c4 10             	add    $0x10,%esp
    }
  return pgdir;
}
80106dbc:	8d 65 f8             	lea    -0x8(%ebp),%esp
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
80106dbf:	31 c0                	xor    %eax,%eax
    }
  return pgdir;
}
80106dc1:	5b                   	pop    %ebx
80106dc2:	5e                   	pop    %esi
80106dc3:	5d                   	pop    %ebp
80106dc4:	c3                   	ret    
80106dc5:	8d 76 00             	lea    0x0(%esi),%esi
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
80106dc8:	31 c0                	xor    %eax,%eax
80106dca:	eb d8                	jmp    80106da4 <setupkvm+0x54>
80106dcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106dd0 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80106dd0:	55                   	push   %ebp
80106dd1:	89 e5                	mov    %esp,%ebp
80106dd3:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106dd6:	e8 75 ff ff ff       	call   80106d50 <setupkvm>
80106ddb:	a3 a4 54 11 80       	mov    %eax,0x801154a4
80106de0:	05 00 00 00 80       	add    $0x80000000,%eax
80106de5:	0f 22 d8             	mov    %eax,%cr3
  switchkvm();
}
80106de8:	c9                   	leave  
80106de9:	c3                   	ret    
80106dea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106df0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106df0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106df1:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106df3:	89 e5                	mov    %esp,%ebp
80106df5:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106df8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106dfb:	8b 45 08             	mov    0x8(%ebp),%eax
80106dfe:	e8 7d f8 ff ff       	call   80106680 <walkpgdir>
  if(pte == 0)
80106e03:	85 c0                	test   %eax,%eax
80106e05:	74 05                	je     80106e0c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106e07:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106e0a:	c9                   	leave  
80106e0b:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
80106e0c:	83 ec 0c             	sub    $0xc,%esp
80106e0f:	68 ae 7a 10 80       	push   $0x80107aae
80106e14:	e8 57 95 ff ff       	call   80100370 <panic>
80106e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106e20 <copyuvm_cow>:



pde_t*
copyuvm_cow(pde_t* pgdir, uint sz)
{
80106e20:	55                   	push   %ebp
80106e21:	89 e5                	mov    %esp,%ebp
80106e23:	57                   	push   %edi
80106e24:	56                   	push   %esi
80106e25:	53                   	push   %ebx
80106e26:	83 ec 0c             	sub    $0xc,%esp
80106e29:	8b 7d 0c             	mov    0xc(%ebp),%edi
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  // char *mem;

  if((d = setupkvm()) == 0)
80106e2c:	e8 1f ff ff ff       	call   80106d50 <setupkvm>
80106e31:	85 c0                	test   %eax,%eax
80106e33:	74 7d                	je     80106eb2 <copyuvm_cow+0x92>
    return 0;

  
  //  d = pgdir;

  for(i = 0; i < sz; i += PGSIZE){
80106e35:	85 ff                	test   %edi,%edi
80106e37:	89 c6                	mov    %eax,%esi
80106e39:	74 6d                	je     80106ea8 <copyuvm_cow+0x88>
80106e3b:	31 db                	xor    %ebx,%ebx
80106e3d:	eb 0b                	jmp    80106e4a <copyuvm_cow+0x2a>
80106e3f:	90                   	nop
80106e40:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106e46:	39 df                	cmp    %ebx,%edi
80106e48:	76 5e                	jbe    80106ea8 <copyuvm_cow+0x88>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106e4a:	8b 45 08             	mov    0x8(%ebp),%eax
80106e4d:	31 c9                	xor    %ecx,%ecx
80106e4f:	89 da                	mov    %ebx,%edx
80106e51:	e8 2a f8 ff ff       	call   80106680 <walkpgdir>
80106e56:	85 c0                	test   %eax,%eax
80106e58:	74 69                	je     80106ec3 <copyuvm_cow+0xa3>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106e5a:	8b 00                	mov    (%eax),%eax
80106e5c:	a8 01                	test   $0x1,%al
80106e5e:	74 56                	je     80106eb6 <copyuvm_cow+0x96>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106e60:	89 c2                	mov    %eax,%edx
    // if((mem = kalloc()) == 0)
    //   goto bad;
    // memmove(mem, (char*)P2V(pa), PGSIZE);
    
    //Point child page dir to parent page dir
    if(mappages(d, (void*)i, PGSIZE, pa, flags) < 0) {
80106e62:	83 ec 08             	sub    $0x8,%esp
80106e65:	25 fd 0f 00 00       	and    $0xffd,%eax
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106e6a:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
    // if((mem = kalloc()) == 0)
    //   goto bad;
    // memmove(mem, (char*)P2V(pa), PGSIZE);
    
    //Point child page dir to parent page dir
    if(mappages(d, (void*)i, PGSIZE, pa, flags) < 0) {
80106e70:	50                   	push   %eax
80106e71:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106e76:	89 d0                	mov    %edx,%eax
80106e78:	89 da                	mov    %ebx,%edx
80106e7a:	80 cc 08             	or     $0x8,%ah
80106e7d:	50                   	push   %eax
80106e7e:	89 f0                	mov    %esi,%eax
80106e80:	e8 7b f8 ff ff       	call   80106700 <mappages>
80106e85:	83 c4 10             	add    $0x10,%esp
80106e88:	85 c0                	test   %eax,%eax
80106e8a:	79 b4                	jns    80106e40 <copyuvm_cow+0x20>

  }
  return d;

bad:
  freevm(d);
80106e8c:	83 ec 0c             	sub    $0xc,%esp
80106e8f:	56                   	push   %esi
80106e90:	e8 3b fe ff ff       	call   80106cd0 <freevm>
  return 0;
80106e95:	83 c4 10             	add    $0x10,%esp
80106e98:	31 c0                	xor    %eax,%eax
}
80106e9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e9d:	5b                   	pop    %ebx
80106e9e:	5e                   	pop    %esi
80106e9f:	5f                   	pop    %edi
80106ea0:	5d                   	pop    %ebp
80106ea1:	c3                   	ret    
80106ea2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ea8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;

  
  //  d = pgdir;

  for(i = 0; i < sz; i += PGSIZE){
80106eab:	89 f0                	mov    %esi,%eax
  return d;

bad:
  freevm(d);
  return 0;
}
80106ead:	5b                   	pop    %ebx
80106eae:	5e                   	pop    %esi
80106eaf:	5f                   	pop    %edi
80106eb0:	5d                   	pop    %ebp
80106eb1:	c3                   	ret    
  pte_t *pte;
  uint pa, i, flags;
  // char *mem;

  if((d = setupkvm()) == 0)
    return 0;
80106eb2:	31 c0                	xor    %eax,%eax
80106eb4:	eb e4                	jmp    80106e9a <copyuvm_cow+0x7a>

  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
80106eb6:	83 ec 0c             	sub    $0xc,%esp
80106eb9:	68 ee 76 10 80       	push   $0x801076ee
80106ebe:	e8 ad 94 ff ff       	call   80100370 <panic>
  
  //  d = pgdir;

  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
80106ec3:	83 ec 0c             	sub    $0xc,%esp
80106ec6:	68 d4 76 10 80       	push   $0x801076d4
80106ecb:	e8 a0 94 ff ff       	call   80100370 <panic>

80106ed0 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80106ed0:	55                   	push   %ebp
80106ed1:	89 e5                	mov    %esp,%ebp
80106ed3:	57                   	push   %edi
80106ed4:	56                   	push   %esi
80106ed5:	53                   	push   %ebx
80106ed6:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106ed9:	e8 72 fe ff ff       	call   80106d50 <setupkvm>
80106ede:	85 c0                	test   %eax,%eax
80106ee0:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106ee3:	0f 84 c5 00 00 00    	je     80106fae <copyuvm+0xde>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106ee9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106eec:	85 c9                	test   %ecx,%ecx
80106eee:	0f 84 9c 00 00 00    	je     80106f90 <copyuvm+0xc0>
80106ef4:	31 ff                	xor    %edi,%edi
80106ef6:	eb 4a                	jmp    80106f42 <copyuvm+0x72>
80106ef8:	90                   	nop
80106ef9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);

    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106f00:	83 ec 04             	sub    $0x4,%esp
80106f03:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80106f09:	68 00 10 00 00       	push   $0x1000
80106f0e:	53                   	push   %ebx
80106f0f:	50                   	push   %eax
80106f10:	e8 db d6 ff ff       	call   801045f0 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80106f15:	58                   	pop    %eax
80106f16:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106f1c:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106f21:	5a                   	pop    %edx
80106f22:	ff 75 e4             	pushl  -0x1c(%ebp)
80106f25:	50                   	push   %eax
80106f26:	89 fa                	mov    %edi,%edx
80106f28:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106f2b:	e8 d0 f7 ff ff       	call   80106700 <mappages>
80106f30:	83 c4 10             	add    $0x10,%esp
80106f33:	85 c0                	test   %eax,%eax
80106f35:	78 69                	js     80106fa0 <copyuvm+0xd0>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106f37:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106f3d:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80106f40:	76 4e                	jbe    80106f90 <copyuvm+0xc0>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106f42:	8b 45 08             	mov    0x8(%ebp),%eax
80106f45:	31 c9                	xor    %ecx,%ecx
80106f47:	89 fa                	mov    %edi,%edx
80106f49:	e8 32 f7 ff ff       	call   80106680 <walkpgdir>
80106f4e:	85 c0                	test   %eax,%eax
80106f50:	74 6d                	je     80106fbf <copyuvm+0xef>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106f52:	8b 00                	mov    (%eax),%eax
80106f54:	a8 01                	test   $0x1,%al
80106f56:	74 5a                	je     80106fb2 <copyuvm+0xe2>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106f58:	89 c3                	mov    %eax,%ebx
    flags = PTE_FLAGS(*pte);
80106f5a:	25 ff 0f 00 00       	and    $0xfff,%eax
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106f5f:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    flags = PTE_FLAGS(*pte);
80106f65:	89 45 e4             	mov    %eax,-0x1c(%ebp)

    if((mem = kalloc()) == 0)
80106f68:	e8 23 b5 ff ff       	call   80102490 <kalloc>
80106f6d:	85 c0                	test   %eax,%eax
80106f6f:	89 c6                	mov    %eax,%esi
80106f71:	75 8d                	jne    80106f00 <copyuvm+0x30>
    }
  }
  return d;

bad:
  freevm(d);
80106f73:	83 ec 0c             	sub    $0xc,%esp
80106f76:	ff 75 e0             	pushl  -0x20(%ebp)
80106f79:	e8 52 fd ff ff       	call   80106cd0 <freevm>
  return 0;
80106f7e:	83 c4 10             	add    $0x10,%esp
80106f81:	31 c0                	xor    %eax,%eax
}
80106f83:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f86:	5b                   	pop    %ebx
80106f87:	5e                   	pop    %esi
80106f88:	5f                   	pop    %edi
80106f89:	5d                   	pop    %ebp
80106f8a:	c3                   	ret    
80106f8b:	90                   	nop
80106f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106f90:	8b 45 e0             	mov    -0x20(%ebp),%eax
  return d;

bad:
  freevm(d);
  return 0;
}
80106f93:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f96:	5b                   	pop    %ebx
80106f97:	5e                   	pop    %esi
80106f98:	5f                   	pop    %edi
80106f99:	5d                   	pop    %ebp
80106f9a:	c3                   	ret    
80106f9b:	90                   	nop
80106f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
      kfree(mem);
80106fa0:	83 ec 0c             	sub    $0xc,%esp
80106fa3:	56                   	push   %esi
80106fa4:	e8 37 b3 ff ff       	call   801022e0 <kfree>
      goto bad;
80106fa9:	83 c4 10             	add    $0x10,%esp
80106fac:	eb c5                	jmp    80106f73 <copyuvm+0xa3>
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
80106fae:	31 c0                	xor    %eax,%eax
80106fb0:	eb d1                	jmp    80106f83 <copyuvm+0xb3>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
80106fb2:	83 ec 0c             	sub    $0xc,%esp
80106fb5:	68 ee 76 10 80       	push   $0x801076ee
80106fba:	e8 b1 93 ff ff       	call   80100370 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
80106fbf:	83 ec 0c             	sub    $0xc,%esp
80106fc2:	68 d4 76 10 80       	push   $0x801076d4
80106fc7:	e8 a4 93 ff ff       	call   80100370 <panic>
80106fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106fd0 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106fd0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106fd1:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106fd3:	89 e5                	mov    %esp,%ebp
80106fd5:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106fd8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106fdb:	8b 45 08             	mov    0x8(%ebp),%eax
80106fde:	e8 9d f6 ff ff       	call   80106680 <walkpgdir>
  if((*pte & PTE_P) == 0)
80106fe3:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
80106fe5:	89 c2                	mov    %eax,%edx
80106fe7:	83 e2 05             	and    $0x5,%edx
80106fea:	83 fa 05             	cmp    $0x5,%edx
80106fed:	75 11                	jne    80107000 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106fef:	25 00 f0 ff ff       	and    $0xfffff000,%eax
}
80106ff4:	c9                   	leave  
  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106ff5:	05 00 00 00 80       	add    $0x80000000,%eax
}
80106ffa:	c3                   	ret    
80106ffb:	90                   	nop
80106ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
80107000:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
80107002:	c9                   	leave  
80107003:	c3                   	ret    
80107004:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010700a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107010 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107010:	55                   	push   %ebp
80107011:	89 e5                	mov    %esp,%ebp
80107013:	57                   	push   %edi
80107014:	56                   	push   %esi
80107015:	53                   	push   %ebx
80107016:	83 ec 1c             	sub    $0x1c,%esp
80107019:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010701c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010701f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107022:	85 db                	test   %ebx,%ebx
80107024:	75 40                	jne    80107066 <copyout+0x56>
80107026:	eb 70                	jmp    80107098 <copyout+0x88>
80107028:	90                   	nop
80107029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107030:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107033:	89 f1                	mov    %esi,%ecx
80107035:	29 d1                	sub    %edx,%ecx
80107037:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010703d:	39 d9                	cmp    %ebx,%ecx
8010703f:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80107042:	29 f2                	sub    %esi,%edx
80107044:	83 ec 04             	sub    $0x4,%esp
80107047:	01 d0                	add    %edx,%eax
80107049:	51                   	push   %ecx
8010704a:	57                   	push   %edi
8010704b:	50                   	push   %eax
8010704c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010704f:	e8 9c d5 ff ff       	call   801045f0 <memmove>
    len -= n;
    buf += n;
80107054:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107057:	83 c4 10             	add    $0x10,%esp
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
8010705a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
80107060:	01 cf                	add    %ecx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107062:	29 cb                	sub    %ecx,%ebx
80107064:	74 32                	je     80107098 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80107066:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107068:	83 ec 08             	sub    $0x8,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
8010706b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010706e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107074:	56                   	push   %esi
80107075:	ff 75 08             	pushl  0x8(%ebp)
80107078:	e8 53 ff ff ff       	call   80106fd0 <uva2ka>
    if(pa0 == 0)
8010707d:	83 c4 10             	add    $0x10,%esp
80107080:	85 c0                	test   %eax,%eax
80107082:	75 ac                	jne    80107030 <copyout+0x20>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80107084:	8d 65 f4             	lea    -0xc(%ebp),%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
80107087:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
8010708c:	5b                   	pop    %ebx
8010708d:	5e                   	pop    %esi
8010708e:	5f                   	pop    %edi
8010708f:	5d                   	pop    %ebp
80107090:	c3                   	ret    
80107091:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107098:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
8010709b:	31 c0                	xor    %eax,%eax
}
8010709d:	5b                   	pop    %ebx
8010709e:	5e                   	pop    %esi
8010709f:	5f                   	pop    %edi
801070a0:	5d                   	pop    %ebp
801070a1:	c3                   	ret    
