
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
8010002d:	b8 b0 2e 10 80       	mov    $0x80102eb0,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb f4 b5 10 80       	mov    $0x8010b5f4,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 00 71 10 80       	push   $0x80107100
80100051:	68 c0 b5 10 80       	push   $0x8010b5c0
80100056:	e8 e5 42 00 00       	call   80104340 <initlock>
8010005b:	c7 05 0c fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd0c
80100062:	fc 10 80 
80100065:	c7 05 10 fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd10
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba bc fc 10 80       	mov    $0x8010fcbc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
80100092:	68 07 71 10 80       	push   $0x80107107
80100097:	50                   	push   %eax
80100098:	e8 73 41 00 00       	call   80104210 <initsleeplock>
8010009d:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
801000b6:	3d bc fc 10 80       	cmp    $0x8010fcbc,%eax
801000bb:	72 c3                	jb     80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 c0 b5 10 80       	push   $0x8010b5c0
801000e4:	e8 97 43 00 00       	call   80104480 <acquire>
801000e9:	8b 1d 10 fd 10 80    	mov    0x8010fd10,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d 0c fd 10 80    	mov    0x8010fd0c,%ebx
80100126:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 c0 b5 10 80       	push   $0x8010b5c0
80100162:	e8 d9 43 00 00       	call   80104540 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 de 40 00 00       	call   80104250 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 ad 1f 00 00       	call   80102130 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 0e 71 10 80       	push   $0x8010710e
80100198:	e8 f3 01 00 00       	call   80100390 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 3d 41 00 00       	call   801042f0 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 67 1f 00 00       	jmp    80102130 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 1f 71 10 80       	push   $0x8010711f
801001d1:	e8 ba 01 00 00       	call   80100390 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 fc 40 00 00       	call   801042f0 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 ac 40 00 00       	call   801042b0 <releasesleep>
80100204:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
8010020b:	e8 70 42 00 00       	call   80104480 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100237:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
8010024f:	c7 45 08 c0 b5 10 80 	movl   $0x8010b5c0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 df 42 00 00       	jmp    80104540 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 26 71 10 80       	push   $0x80107126
80100269:	e8 22 01 00 00       	call   80100390 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010027f:	57                   	push   %edi
80100280:	e8 eb 14 00 00       	call   80101770 <iunlock>
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 ef 41 00 00       	call   80104480 <acquire>
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e a1 00 00 00    	jle    80100342 <consoleread+0xd2>
801002a1:	8b 15 a0 ff 10 80    	mov    0x8010ffa0,%edx
801002a7:	39 15 a4 ff 10 80    	cmp    %edx,0x8010ffa4
801002ad:	74 2c                	je     801002db <consoleread+0x6b>
801002af:	eb 5f                	jmp    80100310 <consoleread+0xa0>
801002b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801002b8:	83 ec 08             	sub    $0x8,%esp
801002bb:	68 20 a5 10 80       	push   $0x8010a520
801002c0:	68 a0 ff 10 80       	push   $0x8010ffa0
801002c5:	e8 c6 3a 00 00       	call   80103d90 <sleep>
801002ca:	8b 15 a0 ff 10 80    	mov    0x8010ffa0,%edx
801002d0:	83 c4 10             	add    $0x10,%esp
801002d3:	3b 15 a4 ff 10 80    	cmp    0x8010ffa4,%edx
801002d9:	75 35                	jne    80100310 <consoleread+0xa0>
801002db:	e8 00 35 00 00       	call   801037e0 <myproc>
801002e0:	8b 40 24             	mov    0x24(%eax),%eax
801002e3:	85 c0                	test   %eax,%eax
801002e5:	74 d1                	je     801002b8 <consoleread+0x48>
801002e7:	83 ec 0c             	sub    $0xc,%esp
801002ea:	68 20 a5 10 80       	push   $0x8010a520
801002ef:	e8 4c 42 00 00       	call   80104540 <release>
801002f4:	89 3c 24             	mov    %edi,(%esp)
801002f7:	e8 94 13 00 00       	call   80101690 <ilock>
801002fc:	83 c4 10             	add    $0x10,%esp
801002ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100302:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100307:	5b                   	pop    %ebx
80100308:	5e                   	pop    %esi
80100309:	5f                   	pop    %edi
8010030a:	5d                   	pop    %ebp
8010030b:	c3                   	ret    
8010030c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100310:	8d 42 01             	lea    0x1(%edx),%eax
80100313:	a3 a0 ff 10 80       	mov    %eax,0x8010ffa0
80100318:	89 d0                	mov    %edx,%eax
8010031a:	83 e0 7f             	and    $0x7f,%eax
8010031d:	0f be 80 20 ff 10 80 	movsbl -0x7fef00e0(%eax),%eax
80100324:	83 f8 04             	cmp    $0x4,%eax
80100327:	74 3f                	je     80100368 <consoleread+0xf8>
80100329:	83 c6 01             	add    $0x1,%esi
8010032c:	83 eb 01             	sub    $0x1,%ebx
8010032f:	83 f8 0a             	cmp    $0xa,%eax
80100332:	88 46 ff             	mov    %al,-0x1(%esi)
80100335:	74 43                	je     8010037a <consoleread+0x10a>
80100337:	85 db                	test   %ebx,%ebx
80100339:	0f 85 62 ff ff ff    	jne    801002a1 <consoleread+0x31>
8010033f:	8b 45 10             	mov    0x10(%ebp),%eax
80100342:	83 ec 0c             	sub    $0xc,%esp
80100345:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100348:	68 20 a5 10 80       	push   $0x8010a520
8010034d:	e8 ee 41 00 00       	call   80104540 <release>
80100352:	89 3c 24             	mov    %edi,(%esp)
80100355:	e8 36 13 00 00       	call   80101690 <ilock>
8010035a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010035d:	83 c4 10             	add    $0x10,%esp
80100360:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100363:	5b                   	pop    %ebx
80100364:	5e                   	pop    %esi
80100365:	5f                   	pop    %edi
80100366:	5d                   	pop    %ebp
80100367:	c3                   	ret    
80100368:	8b 45 10             	mov    0x10(%ebp),%eax
8010036b:	29 d8                	sub    %ebx,%eax
8010036d:	3b 5d 10             	cmp    0x10(%ebp),%ebx
80100370:	73 d0                	jae    80100342 <consoleread+0xd2>
80100372:	89 15 a0 ff 10 80    	mov    %edx,0x8010ffa0
80100378:	eb c8                	jmp    80100342 <consoleread+0xd2>
8010037a:	8b 45 10             	mov    0x10(%ebp),%eax
8010037d:	29 d8                	sub    %ebx,%eax
8010037f:	eb c1                	jmp    80100342 <consoleread+0xd2>
80100381:	eb 0d                	jmp    80100390 <panic>
80100383:	90                   	nop
80100384:	90                   	nop
80100385:	90                   	nop
80100386:	90                   	nop
80100387:	90                   	nop
80100388:	90                   	nop
80100389:	90                   	nop
8010038a:	90                   	nop
8010038b:	90                   	nop
8010038c:	90                   	nop
8010038d:	90                   	nop
8010038e:	90                   	nop
8010038f:	90                   	nop

80100390 <panic>:
80100390:	55                   	push   %ebp
80100391:	89 e5                	mov    %esp,%ebp
80100393:	56                   	push   %esi
80100394:	53                   	push   %ebx
80100395:	83 ec 30             	sub    $0x30,%esp
80100398:	fa                   	cli    
80100399:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
801003a0:	00 00 00 
801003a3:	8d 5d d0             	lea    -0x30(%ebp),%ebx
801003a6:	8d 75 f8             	lea    -0x8(%ebp),%esi
801003a9:	e8 92 23 00 00       	call   80102740 <lapicid>
801003ae:	83 ec 08             	sub    $0x8,%esp
801003b1:	50                   	push   %eax
801003b2:	68 2d 71 10 80       	push   $0x8010712d
801003b7:	e8 a4 02 00 00       	call   80100660 <cprintf>
801003bc:	58                   	pop    %eax
801003bd:	ff 75 08             	pushl  0x8(%ebp)
801003c0:	e8 9b 02 00 00       	call   80100660 <cprintf>
801003c5:	c7 04 24 db 7a 10 80 	movl   $0x80107adb,(%esp)
801003cc:	e8 8f 02 00 00       	call   80100660 <cprintf>
801003d1:	5a                   	pop    %edx
801003d2:	8d 45 08             	lea    0x8(%ebp),%eax
801003d5:	59                   	pop    %ecx
801003d6:	53                   	push   %ebx
801003d7:	50                   	push   %eax
801003d8:	e8 83 3f 00 00       	call   80104360 <getcallerpcs>
801003dd:	83 c4 10             	add    $0x10,%esp
801003e0:	83 ec 08             	sub    $0x8,%esp
801003e3:	ff 33                	pushl  (%ebx)
801003e5:	83 c3 04             	add    $0x4,%ebx
801003e8:	68 41 71 10 80       	push   $0x80107141
801003ed:	e8 6e 02 00 00       	call   80100660 <cprintf>
801003f2:	83 c4 10             	add    $0x10,%esp
801003f5:	39 f3                	cmp    %esi,%ebx
801003f7:	75 e7                	jne    801003e0 <panic+0x50>
801003f9:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
80100400:	00 00 00 
80100403:	eb fe                	jmp    80100403 <panic+0x73>
80100405:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100410 <consputc>:
80100410:	8b 0d 58 a5 10 80    	mov    0x8010a558,%ecx
80100416:	85 c9                	test   %ecx,%ecx
80100418:	74 06                	je     80100420 <consputc+0x10>
8010041a:	fa                   	cli    
8010041b:	eb fe                	jmp    8010041b <consputc+0xb>
8010041d:	8d 76 00             	lea    0x0(%esi),%esi
80100420:	55                   	push   %ebp
80100421:	89 e5                	mov    %esp,%ebp
80100423:	57                   	push   %edi
80100424:	56                   	push   %esi
80100425:	53                   	push   %ebx
80100426:	89 c6                	mov    %eax,%esi
80100428:	83 ec 0c             	sub    $0xc,%esp
8010042b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100430:	0f 84 b1 00 00 00    	je     801004e7 <consputc+0xd7>
80100436:	83 ec 0c             	sub    $0xc,%esp
80100439:	50                   	push   %eax
8010043a:	e8 d1 57 00 00       	call   80105c10 <uartputc>
8010043f:	83 c4 10             	add    $0x10,%esp
80100442:	bb d4 03 00 00       	mov    $0x3d4,%ebx
80100447:	b8 0e 00 00 00       	mov    $0xe,%eax
8010044c:	89 da                	mov    %ebx,%edx
8010044e:	ee                   	out    %al,(%dx)
8010044f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100454:	89 ca                	mov    %ecx,%edx
80100456:	ec                   	in     (%dx),%al
80100457:	0f b6 c0             	movzbl %al,%eax
8010045a:	89 da                	mov    %ebx,%edx
8010045c:	c1 e0 08             	shl    $0x8,%eax
8010045f:	89 c7                	mov    %eax,%edi
80100461:	b8 0f 00 00 00       	mov    $0xf,%eax
80100466:	ee                   	out    %al,(%dx)
80100467:	89 ca                	mov    %ecx,%edx
80100469:	ec                   	in     (%dx),%al
8010046a:	0f b6 d8             	movzbl %al,%ebx
8010046d:	09 fb                	or     %edi,%ebx
8010046f:	83 fe 0a             	cmp    $0xa,%esi
80100472:	0f 84 f3 00 00 00    	je     8010056b <consputc+0x15b>
80100478:	81 fe 00 01 00 00    	cmp    $0x100,%esi
8010047e:	0f 84 d7 00 00 00    	je     8010055b <consputc+0x14b>
80100484:	89 f0                	mov    %esi,%eax
80100486:	0f b6 c0             	movzbl %al,%eax
80100489:	80 cc 07             	or     $0x7,%ah
8010048c:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
80100493:	80 
80100494:	83 c3 01             	add    $0x1,%ebx
80100497:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
8010049d:	0f 8f ab 00 00 00    	jg     8010054e <consputc+0x13e>
801004a3:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
801004a9:	7f 66                	jg     80100511 <consputc+0x101>
801004ab:	be d4 03 00 00       	mov    $0x3d4,%esi
801004b0:	b8 0e 00 00 00       	mov    $0xe,%eax
801004b5:	89 f2                	mov    %esi,%edx
801004b7:	ee                   	out    %al,(%dx)
801004b8:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
801004bd:	89 d8                	mov    %ebx,%eax
801004bf:	c1 f8 08             	sar    $0x8,%eax
801004c2:	89 ca                	mov    %ecx,%edx
801004c4:	ee                   	out    %al,(%dx)
801004c5:	b8 0f 00 00 00       	mov    $0xf,%eax
801004ca:	89 f2                	mov    %esi,%edx
801004cc:	ee                   	out    %al,(%dx)
801004cd:	89 d8                	mov    %ebx,%eax
801004cf:	89 ca                	mov    %ecx,%edx
801004d1:	ee                   	out    %al,(%dx)
801004d2:	b8 20 07 00 00       	mov    $0x720,%eax
801004d7:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
801004de:	80 
801004df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004e2:	5b                   	pop    %ebx
801004e3:	5e                   	pop    %esi
801004e4:	5f                   	pop    %edi
801004e5:	5d                   	pop    %ebp
801004e6:	c3                   	ret    
801004e7:	83 ec 0c             	sub    $0xc,%esp
801004ea:	6a 08                	push   $0x8
801004ec:	e8 1f 57 00 00       	call   80105c10 <uartputc>
801004f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f8:	e8 13 57 00 00       	call   80105c10 <uartputc>
801004fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100504:	e8 07 57 00 00       	call   80105c10 <uartputc>
80100509:	83 c4 10             	add    $0x10,%esp
8010050c:	e9 31 ff ff ff       	jmp    80100442 <consputc+0x32>
80100511:	52                   	push   %edx
80100512:	68 60 0e 00 00       	push   $0xe60
80100517:	83 eb 50             	sub    $0x50,%ebx
8010051a:	68 a0 80 0b 80       	push   $0x800b80a0
8010051f:	68 00 80 0b 80       	push   $0x800b8000
80100524:	e8 17 41 00 00       	call   80104640 <memmove>
80100529:	b8 80 07 00 00       	mov    $0x780,%eax
8010052e:	83 c4 0c             	add    $0xc,%esp
80100531:	29 d8                	sub    %ebx,%eax
80100533:	01 c0                	add    %eax,%eax
80100535:	50                   	push   %eax
80100536:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
80100539:	6a 00                	push   $0x0
8010053b:	2d 00 80 f4 7f       	sub    $0x7ff48000,%eax
80100540:	50                   	push   %eax
80100541:	e8 4a 40 00 00       	call   80104590 <memset>
80100546:	83 c4 10             	add    $0x10,%esp
80100549:	e9 5d ff ff ff       	jmp    801004ab <consputc+0x9b>
8010054e:	83 ec 0c             	sub    $0xc,%esp
80100551:	68 45 71 10 80       	push   $0x80107145
80100556:	e8 35 fe ff ff       	call   80100390 <panic>
8010055b:	85 db                	test   %ebx,%ebx
8010055d:	0f 84 48 ff ff ff    	je     801004ab <consputc+0x9b>
80100563:	83 eb 01             	sub    $0x1,%ebx
80100566:	e9 2c ff ff ff       	jmp    80100497 <consputc+0x87>
8010056b:	89 d8                	mov    %ebx,%eax
8010056d:	b9 50 00 00 00       	mov    $0x50,%ecx
80100572:	99                   	cltd   
80100573:	f7 f9                	idiv   %ecx
80100575:	29 d1                	sub    %edx,%ecx
80100577:	01 cb                	add    %ecx,%ebx
80100579:	e9 19 ff ff ff       	jmp    80100497 <consputc+0x87>
8010057e:	66 90                	xchg   %ax,%ax

80100580 <printint>:
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d3                	mov    %edx,%ebx
80100588:	83 ec 2c             	sub    $0x2c,%esp
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80100590:	74 04                	je     80100596 <printint+0x16>
80100592:	85 c0                	test   %eax,%eax
80100594:	78 5a                	js     801005f0 <printint+0x70>
80100596:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
8010059d:	31 c9                	xor    %ecx,%ecx
8010059f:	8d 75 d7             	lea    -0x29(%ebp),%esi
801005a2:	eb 06                	jmp    801005aa <printint+0x2a>
801005a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801005a8:	89 f9                	mov    %edi,%ecx
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 79 01             	lea    0x1(%ecx),%edi
801005af:	f7 f3                	div    %ebx
801005b1:	0f b6 92 70 71 10 80 	movzbl -0x7fef8e90(%edx),%edx
801005b8:	85 c0                	test   %eax,%eax
801005ba:	88 14 3e             	mov    %dl,(%esi,%edi,1)
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
801005c6:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
801005cb:	8d 79 02             	lea    0x2(%ecx),%edi
801005ce:	8d 5c 3d d7          	lea    -0x29(%ebp,%edi,1),%ebx
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005d8:	0f be 03             	movsbl (%ebx),%eax
801005db:	83 eb 01             	sub    $0x1,%ebx
801005de:	e8 2d fe ff ff       	call   80100410 <consputc>
801005e3:	39 f3                	cmp    %esi,%ebx
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	90                   	nop
801005f0:	f7 d8                	neg    %eax
801005f2:	eb a9                	jmp    8010059d <printint+0x1d>
801005f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100600 <consolewrite>:
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	8b 75 10             	mov    0x10(%ebp),%esi
8010060c:	ff 75 08             	pushl  0x8(%ebp)
8010060f:	e8 5c 11 00 00       	call   80101770 <iunlock>
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 60 3e 00 00       	call   80104480 <acquire>
80100620:	83 c4 10             	add    $0x10,%esp
80100623:	85 f6                	test   %esi,%esi
80100625:	7e 18                	jle    8010063f <consolewrite+0x3f>
80100627:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010062a:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 d5 fd ff ff       	call   80100410 <consputc>
8010063b:	39 fb                	cmp    %edi,%ebx
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 f4 3e 00 00       	call   80104540 <release>
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 3b 10 00 00       	call   80101690 <ilock>
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
8010066e:	85 c0                	test   %eax,%eax
80100670:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100673:	0f 85 6f 01 00 00    	jne    801007e8 <cprintf+0x188>
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c7                	mov    %eax,%edi
80100680:	0f 84 77 01 00 00    	je     801007fd <cprintf+0x19d>
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	8d 4d 0c             	lea    0xc(%ebp),%ecx
8010068c:	31 db                	xor    %ebx,%ebx
8010068e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80100691:	85 c0                	test   %eax,%eax
80100693:	75 56                	jne    801006eb <cprintf+0x8b>
80100695:	eb 79                	jmp    80100710 <cprintf+0xb0>
80100697:	89 f6                	mov    %esi,%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801006a0:	0f b6 16             	movzbl (%esi),%edx
801006a3:	85 d2                	test   %edx,%edx
801006a5:	74 69                	je     80100710 <cprintf+0xb0>
801006a7:	83 c3 02             	add    $0x2,%ebx
801006aa:	83 fa 70             	cmp    $0x70,%edx
801006ad:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
801006b0:	0f 84 84 00 00 00    	je     8010073a <cprintf+0xda>
801006b6:	7f 78                	jg     80100730 <cprintf+0xd0>
801006b8:	83 fa 25             	cmp    $0x25,%edx
801006bb:	0f 84 ff 00 00 00    	je     801007c0 <cprintf+0x160>
801006c1:	83 fa 64             	cmp    $0x64,%edx
801006c4:	0f 85 8e 00 00 00    	jne    80100758 <cprintf+0xf8>
801006ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801006cd:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d2:	8d 48 04             	lea    0x4(%eax),%ecx
801006d5:	8b 00                	mov    (%eax),%eax
801006d7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801006da:	b9 01 00 00 00       	mov    $0x1,%ecx
801006df:	e8 9c fe ff ff       	call   80100580 <printint>
801006e4:	0f b6 06             	movzbl (%esi),%eax
801006e7:	85 c0                	test   %eax,%eax
801006e9:	74 25                	je     80100710 <cprintf+0xb0>
801006eb:	8d 53 01             	lea    0x1(%ebx),%edx
801006ee:	83 f8 25             	cmp    $0x25,%eax
801006f1:	8d 34 17             	lea    (%edi,%edx,1),%esi
801006f4:	74 aa                	je     801006a0 <cprintf+0x40>
801006f6:	89 55 e0             	mov    %edx,-0x20(%ebp)
801006f9:	e8 12 fd ff ff       	call   80100410 <consputc>
801006fe:	0f b6 06             	movzbl (%esi),%eax
80100701:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100704:	89 d3                	mov    %edx,%ebx
80100706:	85 c0                	test   %eax,%eax
80100708:	75 e1                	jne    801006eb <cprintf+0x8b>
8010070a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100710:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100713:	85 c0                	test   %eax,%eax
80100715:	74 10                	je     80100727 <cprintf+0xc7>
80100717:	83 ec 0c             	sub    $0xc,%esp
8010071a:	68 20 a5 10 80       	push   $0x8010a520
8010071f:	e8 1c 3e 00 00       	call   80104540 <release>
80100724:	83 c4 10             	add    $0x10,%esp
80100727:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010072a:	5b                   	pop    %ebx
8010072b:	5e                   	pop    %esi
8010072c:	5f                   	pop    %edi
8010072d:	5d                   	pop    %ebp
8010072e:	c3                   	ret    
8010072f:	90                   	nop
80100730:	83 fa 73             	cmp    $0x73,%edx
80100733:	74 43                	je     80100778 <cprintf+0x118>
80100735:	83 fa 78             	cmp    $0x78,%edx
80100738:	75 1e                	jne    80100758 <cprintf+0xf8>
8010073a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010073d:	ba 10 00 00 00       	mov    $0x10,%edx
80100742:	8d 48 04             	lea    0x4(%eax),%ecx
80100745:	8b 00                	mov    (%eax),%eax
80100747:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010074a:	31 c9                	xor    %ecx,%ecx
8010074c:	e8 2f fe ff ff       	call   80100580 <printint>
80100751:	eb 91                	jmp    801006e4 <cprintf+0x84>
80100753:	90                   	nop
80100754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100758:	b8 25 00 00 00       	mov    $0x25,%eax
8010075d:	89 55 e0             	mov    %edx,-0x20(%ebp)
80100760:	e8 ab fc ff ff       	call   80100410 <consputc>
80100765:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100768:	89 d0                	mov    %edx,%eax
8010076a:	e8 a1 fc ff ff       	call   80100410 <consputc>
8010076f:	e9 70 ff ff ff       	jmp    801006e4 <cprintf+0x84>
80100774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100778:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010077b:	8b 10                	mov    (%eax),%edx
8010077d:	8d 48 04             	lea    0x4(%eax),%ecx
80100780:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80100783:	85 d2                	test   %edx,%edx
80100785:	74 49                	je     801007d0 <cprintf+0x170>
80100787:	0f be 02             	movsbl (%edx),%eax
8010078a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010078d:	84 c0                	test   %al,%al
8010078f:	0f 84 4f ff ff ff    	je     801006e4 <cprintf+0x84>
80100795:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100798:	89 d3                	mov    %edx,%ebx
8010079a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801007a0:	83 c3 01             	add    $0x1,%ebx
801007a3:	e8 68 fc ff ff       	call   80100410 <consputc>
801007a8:	0f be 03             	movsbl (%ebx),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
801007af:	8b 45 e0             	mov    -0x20(%ebp),%eax
801007b2:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801007b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801007b8:	e9 27 ff ff ff       	jmp    801006e4 <cprintf+0x84>
801007bd:	8d 76 00             	lea    0x0(%esi),%esi
801007c0:	b8 25 00 00 00       	mov    $0x25,%eax
801007c5:	e8 46 fc ff ff       	call   80100410 <consputc>
801007ca:	e9 15 ff ff ff       	jmp    801006e4 <cprintf+0x84>
801007cf:	90                   	nop
801007d0:	ba 58 71 10 80       	mov    $0x80107158,%edx
801007d5:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
801007d8:	b8 28 00 00 00       	mov    $0x28,%eax
801007dd:	89 d3                	mov    %edx,%ebx
801007df:	eb bf                	jmp    801007a0 <cprintf+0x140>
801007e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e8:	83 ec 0c             	sub    $0xc,%esp
801007eb:	68 20 a5 10 80       	push   $0x8010a520
801007f0:	e8 8b 3c 00 00       	call   80104480 <acquire>
801007f5:	83 c4 10             	add    $0x10,%esp
801007f8:	e9 7c fe ff ff       	jmp    80100679 <cprintf+0x19>
801007fd:	83 ec 0c             	sub    $0xc,%esp
80100800:	68 5f 71 10 80       	push   $0x8010715f
80100805:	e8 86 fb ff ff       	call   80100390 <panic>
8010080a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100810 <consoleintr>:
80100810:	55                   	push   %ebp
80100811:	89 e5                	mov    %esp,%ebp
80100813:	57                   	push   %edi
80100814:	56                   	push   %esi
80100815:	53                   	push   %ebx
80100816:	31 f6                	xor    %esi,%esi
80100818:	83 ec 18             	sub    $0x18,%esp
8010081b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010081e:	68 20 a5 10 80       	push   $0x8010a520
80100823:	e8 58 3c 00 00       	call   80104480 <acquire>
80100828:	83 c4 10             	add    $0x10,%esp
8010082b:	90                   	nop
8010082c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100830:	ff d3                	call   *%ebx
80100832:	85 c0                	test   %eax,%eax
80100834:	89 c7                	mov    %eax,%edi
80100836:	78 48                	js     80100880 <consoleintr+0x70>
80100838:	83 ff 10             	cmp    $0x10,%edi
8010083b:	0f 84 e7 00 00 00    	je     80100928 <consoleintr+0x118>
80100841:	7e 5d                	jle    801008a0 <consoleintr+0x90>
80100843:	83 ff 15             	cmp    $0x15,%edi
80100846:	0f 84 ec 00 00 00    	je     80100938 <consoleintr+0x128>
8010084c:	83 ff 7f             	cmp    $0x7f,%edi
8010084f:	75 54                	jne    801008a5 <consoleintr+0x95>
80100851:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100856:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010085c:	74 d2                	je     80100830 <consoleintr+0x20>
8010085e:	83 e8 01             	sub    $0x1,%eax
80100861:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
80100866:	b8 00 01 00 00       	mov    $0x100,%eax
8010086b:	e8 a0 fb ff ff       	call   80100410 <consputc>
80100870:	ff d3                	call   *%ebx
80100872:	85 c0                	test   %eax,%eax
80100874:	89 c7                	mov    %eax,%edi
80100876:	79 c0                	jns    80100838 <consoleintr+0x28>
80100878:	90                   	nop
80100879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100880:	83 ec 0c             	sub    $0xc,%esp
80100883:	68 20 a5 10 80       	push   $0x8010a520
80100888:	e8 b3 3c 00 00       	call   80104540 <release>
8010088d:	83 c4 10             	add    $0x10,%esp
80100890:	85 f6                	test   %esi,%esi
80100892:	0f 85 f8 00 00 00    	jne    80100990 <consoleintr+0x180>
80100898:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010089b:	5b                   	pop    %ebx
8010089c:	5e                   	pop    %esi
8010089d:	5f                   	pop    %edi
8010089e:	5d                   	pop    %ebp
8010089f:	c3                   	ret    
801008a0:	83 ff 08             	cmp    $0x8,%edi
801008a3:	74 ac                	je     80100851 <consoleintr+0x41>
801008a5:	85 ff                	test   %edi,%edi
801008a7:	74 87                	je     80100830 <consoleintr+0x20>
801008a9:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
801008ae:	89 c2                	mov    %eax,%edx
801008b0:	2b 15 a0 ff 10 80    	sub    0x8010ffa0,%edx
801008b6:	83 fa 7f             	cmp    $0x7f,%edx
801008b9:	0f 87 71 ff ff ff    	ja     80100830 <consoleintr+0x20>
801008bf:	8d 50 01             	lea    0x1(%eax),%edx
801008c2:	83 e0 7f             	and    $0x7f,%eax
801008c5:	83 ff 0d             	cmp    $0xd,%edi
801008c8:	89 15 a8 ff 10 80    	mov    %edx,0x8010ffa8
801008ce:	0f 84 cc 00 00 00    	je     801009a0 <consoleintr+0x190>
801008d4:	89 f9                	mov    %edi,%ecx
801008d6:	88 88 20 ff 10 80    	mov    %cl,-0x7fef00e0(%eax)
801008dc:	89 f8                	mov    %edi,%eax
801008de:	e8 2d fb ff ff       	call   80100410 <consputc>
801008e3:	83 ff 0a             	cmp    $0xa,%edi
801008e6:	0f 84 c5 00 00 00    	je     801009b1 <consoleintr+0x1a1>
801008ec:	83 ff 04             	cmp    $0x4,%edi
801008ef:	0f 84 bc 00 00 00    	je     801009b1 <consoleintr+0x1a1>
801008f5:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801008fa:	83 e8 80             	sub    $0xffffff80,%eax
801008fd:	39 05 a8 ff 10 80    	cmp    %eax,0x8010ffa8
80100903:	0f 85 27 ff ff ff    	jne    80100830 <consoleintr+0x20>
80100909:	83 ec 0c             	sub    $0xc,%esp
8010090c:	a3 a4 ff 10 80       	mov    %eax,0x8010ffa4
80100911:	68 a0 ff 10 80       	push   $0x8010ffa0
80100916:	e8 25 36 00 00       	call   80103f40 <wakeup>
8010091b:	83 c4 10             	add    $0x10,%esp
8010091e:	e9 0d ff ff ff       	jmp    80100830 <consoleintr+0x20>
80100923:	90                   	nop
80100924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100928:	be 01 00 00 00       	mov    $0x1,%esi
8010092d:	e9 fe fe ff ff       	jmp    80100830 <consoleintr+0x20>
80100932:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100938:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010093d:	39 05 a4 ff 10 80    	cmp    %eax,0x8010ffa4
80100943:	75 2b                	jne    80100970 <consoleintr+0x160>
80100945:	e9 e6 fe ff ff       	jmp    80100830 <consoleintr+0x20>
8010094a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100950:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
80100955:	b8 00 01 00 00       	mov    $0x100,%eax
8010095a:	e8 b1 fa ff ff       	call   80100410 <consputc>
8010095f:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100964:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010096a:	0f 84 c0 fe ff ff    	je     80100830 <consoleintr+0x20>
80100970:	83 e8 01             	sub    $0x1,%eax
80100973:	89 c2                	mov    %eax,%edx
80100975:	83 e2 7f             	and    $0x7f,%edx
80100978:	80 ba 20 ff 10 80 0a 	cmpb   $0xa,-0x7fef00e0(%edx)
8010097f:	75 cf                	jne    80100950 <consoleintr+0x140>
80100981:	e9 aa fe ff ff       	jmp    80100830 <consoleintr+0x20>
80100986:	8d 76 00             	lea    0x0(%esi),%esi
80100989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100990:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100993:	5b                   	pop    %ebx
80100994:	5e                   	pop    %esi
80100995:	5f                   	pop    %edi
80100996:	5d                   	pop    %ebp
80100997:	e9 94 36 00 00       	jmp    80104030 <procdump>
8010099c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801009a0:	c6 80 20 ff 10 80 0a 	movb   $0xa,-0x7fef00e0(%eax)
801009a7:	b8 0a 00 00 00       	mov    $0xa,%eax
801009ac:	e8 5f fa ff ff       	call   80100410 <consputc>
801009b1:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
801009b6:	e9 4e ff ff ff       	jmp    80100909 <consoleintr+0xf9>
801009bb:	90                   	nop
801009bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801009c0 <consoleinit>:
801009c0:	55                   	push   %ebp
801009c1:	89 e5                	mov    %esp,%ebp
801009c3:	83 ec 10             	sub    $0x10,%esp
801009c6:	68 68 71 10 80       	push   $0x80107168
801009cb:	68 20 a5 10 80       	push   $0x8010a520
801009d0:	e8 6b 39 00 00       	call   80104340 <initlock>
801009d5:	58                   	pop    %eax
801009d6:	5a                   	pop    %edx
801009d7:	6a 00                	push   $0x0
801009d9:	6a 01                	push   $0x1
801009db:	c7 05 6c 09 11 80 00 	movl   $0x80100600,0x8011096c
801009e2:	06 10 80 
801009e5:	c7 05 68 09 11 80 70 	movl   $0x80100270,0x80110968
801009ec:	02 10 80 
801009ef:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009f6:	00 00 00 
801009f9:	e8 e2 18 00 00       	call   801022e0 <ioapicenable>
801009fe:	83 c4 10             	add    $0x10,%esp
80100a01:	c9                   	leave  
80100a02:	c3                   	ret    
80100a03:	66 90                	xchg   %ax,%ax
80100a05:	66 90                	xchg   %ax,%ax
80100a07:	66 90                	xchg   %ax,%ax
80100a09:	66 90                	xchg   %ax,%ax
80100a0b:	66 90                	xchg   %ax,%ax
80100a0d:	66 90                	xchg   %ax,%ax
80100a0f:	90                   	nop

80100a10 <exec>:
80100a10:	55                   	push   %ebp
80100a11:	89 e5                	mov    %esp,%ebp
80100a13:	57                   	push   %edi
80100a14:	56                   	push   %esi
80100a15:	53                   	push   %ebx
80100a16:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
80100a1c:	e8 bf 2d 00 00       	call   801037e0 <myproc>
80100a21:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a27:	e8 84 21 00 00       	call   80102bb0 <begin_op>
80100a2c:	83 ec 0c             	sub    $0xc,%esp
80100a2f:	ff 75 08             	pushl  0x8(%ebp)
80100a32:	e8 b9 14 00 00       	call   80101ef0 <namei>
80100a37:	83 c4 10             	add    $0x10,%esp
80100a3a:	85 c0                	test   %eax,%eax
80100a3c:	0f 84 91 01 00 00    	je     80100bd3 <exec+0x1c3>
80100a42:	83 ec 0c             	sub    $0xc,%esp
80100a45:	89 c3                	mov    %eax,%ebx
80100a47:	50                   	push   %eax
80100a48:	e8 43 0c 00 00       	call   80101690 <ilock>
80100a4d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a53:	6a 34                	push   $0x34
80100a55:	6a 00                	push   $0x0
80100a57:	50                   	push   %eax
80100a58:	53                   	push   %ebx
80100a59:	e8 12 0f 00 00       	call   80101970 <readi>
80100a5e:	83 c4 20             	add    $0x20,%esp
80100a61:	83 f8 34             	cmp    $0x34,%eax
80100a64:	74 22                	je     80100a88 <exec+0x78>
80100a66:	83 ec 0c             	sub    $0xc,%esp
80100a69:	53                   	push   %ebx
80100a6a:	e8 b1 0e 00 00       	call   80101920 <iunlockput>
80100a6f:	e8 ac 21 00 00       	call   80102c20 <end_op>
80100a74:	83 c4 10             	add    $0x10,%esp
80100a77:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100a7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a7f:	5b                   	pop    %ebx
80100a80:	5e                   	pop    %esi
80100a81:	5f                   	pop    %edi
80100a82:	5d                   	pop    %ebp
80100a83:	c3                   	ret    
80100a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100a88:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a8f:	45 4c 46 
80100a92:	75 d2                	jne    80100a66 <exec+0x56>
80100a94:	e8 07 63 00 00       	call   80106da0 <setupkvm>
80100a99:	85 c0                	test   %eax,%eax
80100a9b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100aa1:	74 c3                	je     80100a66 <exec+0x56>
80100aa3:	31 ff                	xor    %edi,%edi
80100aa5:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100aac:	00 
80100aad:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
80100ab3:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100ab9:	0f 84 8c 02 00 00    	je     80100d4b <exec+0x33b>
80100abf:	31 f6                	xor    %esi,%esi
80100ac1:	eb 7f                	jmp    80100b42 <exec+0x132>
80100ac3:	90                   	nop
80100ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ac8:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100acf:	75 63                	jne    80100b34 <exec+0x124>
80100ad1:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ad7:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100add:	0f 82 86 00 00 00    	jb     80100b69 <exec+0x159>
80100ae3:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100ae9:	72 7e                	jb     80100b69 <exec+0x159>
80100aeb:	83 ec 04             	sub    $0x4,%esp
80100aee:	50                   	push   %eax
80100aef:	57                   	push   %edi
80100af0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100af6:	e8 f5 60 00 00       	call   80106bf0 <allocuvm>
80100afb:	83 c4 10             	add    $0x10,%esp
80100afe:	85 c0                	test   %eax,%eax
80100b00:	89 c7                	mov    %eax,%edi
80100b02:	74 65                	je     80100b69 <exec+0x159>
80100b04:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b0a:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b0f:	75 58                	jne    80100b69 <exec+0x159>
80100b11:	83 ec 0c             	sub    $0xc,%esp
80100b14:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b1a:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b20:	53                   	push   %ebx
80100b21:	50                   	push   %eax
80100b22:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b28:	e8 03 60 00 00       	call   80106b30 <loaduvm>
80100b2d:	83 c4 20             	add    $0x20,%esp
80100b30:	85 c0                	test   %eax,%eax
80100b32:	78 35                	js     80100b69 <exec+0x159>
80100b34:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100b3b:	83 c6 01             	add    $0x1,%esi
80100b3e:	39 f0                	cmp    %esi,%eax
80100b40:	7e 3d                	jle    80100b7f <exec+0x16f>
80100b42:	89 f0                	mov    %esi,%eax
80100b44:	6a 20                	push   $0x20
80100b46:	c1 e0 05             	shl    $0x5,%eax
80100b49:	03 85 ec fe ff ff    	add    -0x114(%ebp),%eax
80100b4f:	50                   	push   %eax
80100b50:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100b56:	50                   	push   %eax
80100b57:	53                   	push   %ebx
80100b58:	e8 13 0e 00 00       	call   80101970 <readi>
80100b5d:	83 c4 10             	add    $0x10,%esp
80100b60:	83 f8 20             	cmp    $0x20,%eax
80100b63:	0f 84 5f ff ff ff    	je     80100ac8 <exec+0xb8>
80100b69:	83 ec 0c             	sub    $0xc,%esp
80100b6c:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b72:	e8 a9 61 00 00       	call   80106d20 <freevm>
80100b77:	83 c4 10             	add    $0x10,%esp
80100b7a:	e9 e7 fe ff ff       	jmp    80100a66 <exec+0x56>
80100b7f:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100b85:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100b8b:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
80100b91:	83 ec 0c             	sub    $0xc,%esp
80100b94:	53                   	push   %ebx
80100b95:	e8 86 0d 00 00       	call   80101920 <iunlockput>
80100b9a:	e8 81 20 00 00       	call   80102c20 <end_op>
80100b9f:	83 c4 0c             	add    $0xc,%esp
80100ba2:	56                   	push   %esi
80100ba3:	57                   	push   %edi
80100ba4:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100baa:	e8 41 60 00 00       	call   80106bf0 <allocuvm>
80100baf:	83 c4 10             	add    $0x10,%esp
80100bb2:	85 c0                	test   %eax,%eax
80100bb4:	89 c6                	mov    %eax,%esi
80100bb6:	75 3a                	jne    80100bf2 <exec+0x1e2>
80100bb8:	83 ec 0c             	sub    $0xc,%esp
80100bbb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bc1:	e8 5a 61 00 00       	call   80106d20 <freevm>
80100bc6:	83 c4 10             	add    $0x10,%esp
80100bc9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bce:	e9 a9 fe ff ff       	jmp    80100a7c <exec+0x6c>
80100bd3:	e8 48 20 00 00       	call   80102c20 <end_op>
80100bd8:	83 ec 0c             	sub    $0xc,%esp
80100bdb:	68 81 71 10 80       	push   $0x80107181
80100be0:	e8 7b fa ff ff       	call   80100660 <cprintf>
80100be5:	83 c4 10             	add    $0x10,%esp
80100be8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bed:	e9 8a fe ff ff       	jmp    80100a7c <exec+0x6c>
80100bf2:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bf8:	83 ec 08             	sub    $0x8,%esp
80100bfb:	31 ff                	xor    %edi,%edi
80100bfd:	89 f3                	mov    %esi,%ebx
80100bff:	50                   	push   %eax
80100c00:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c06:	e8 35 62 00 00       	call   80106e40 <clearpteu>
80100c0b:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c0e:	83 c4 10             	add    $0x10,%esp
80100c11:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c17:	8b 00                	mov    (%eax),%eax
80100c19:	85 c0                	test   %eax,%eax
80100c1b:	74 70                	je     80100c8d <exec+0x27d>
80100c1d:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c23:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c29:	eb 0a                	jmp    80100c35 <exec+0x225>
80100c2b:	90                   	nop
80100c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100c30:	83 ff 20             	cmp    $0x20,%edi
80100c33:	74 83                	je     80100bb8 <exec+0x1a8>
80100c35:	83 ec 0c             	sub    $0xc,%esp
80100c38:	50                   	push   %eax
80100c39:	e8 72 3b 00 00       	call   801047b0 <strlen>
80100c3e:	f7 d0                	not    %eax
80100c40:	01 c3                	add    %eax,%ebx
80100c42:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c45:	5a                   	pop    %edx
80100c46:	83 e3 fc             	and    $0xfffffffc,%ebx
80100c49:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c4c:	e8 5f 3b 00 00       	call   801047b0 <strlen>
80100c51:	83 c0 01             	add    $0x1,%eax
80100c54:	50                   	push   %eax
80100c55:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c58:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c5b:	53                   	push   %ebx
80100c5c:	56                   	push   %esi
80100c5d:	e8 fe 63 00 00       	call   80107060 <copyout>
80100c62:	83 c4 20             	add    $0x20,%esp
80100c65:	85 c0                	test   %eax,%eax
80100c67:	0f 88 4b ff ff ff    	js     80100bb8 <exec+0x1a8>
80100c6d:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c70:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80100c77:	83 c7 01             	add    $0x1,%edi
80100c7a:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c80:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c83:	85 c0                	test   %eax,%eax
80100c85:	75 a9                	jne    80100c30 <exec+0x220>
80100c87:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100c8d:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c94:	89 d9                	mov    %ebx,%ecx
80100c96:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c9d:	00 00 00 00 
80100ca1:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100ca8:	ff ff ff 
80100cab:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80100cb1:	29 c1                	sub    %eax,%ecx
80100cb3:	83 c0 0c             	add    $0xc,%eax
80100cb6:	29 c3                	sub    %eax,%ebx
80100cb8:	50                   	push   %eax
80100cb9:	52                   	push   %edx
80100cba:	53                   	push   %ebx
80100cbb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100cc1:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80100cc7:	e8 94 63 00 00       	call   80107060 <copyout>
80100ccc:	83 c4 10             	add    $0x10,%esp
80100ccf:	85 c0                	test   %eax,%eax
80100cd1:	0f 88 e1 fe ff ff    	js     80100bb8 <exec+0x1a8>
80100cd7:	8b 45 08             	mov    0x8(%ebp),%eax
80100cda:	0f b6 00             	movzbl (%eax),%eax
80100cdd:	84 c0                	test   %al,%al
80100cdf:	74 17                	je     80100cf8 <exec+0x2e8>
80100ce1:	8b 55 08             	mov    0x8(%ebp),%edx
80100ce4:	89 d1                	mov    %edx,%ecx
80100ce6:	83 c1 01             	add    $0x1,%ecx
80100ce9:	3c 2f                	cmp    $0x2f,%al
80100ceb:	0f b6 01             	movzbl (%ecx),%eax
80100cee:	0f 44 d1             	cmove  %ecx,%edx
80100cf1:	84 c0                	test   %al,%al
80100cf3:	75 f1                	jne    80100ce6 <exec+0x2d6>
80100cf5:	89 55 08             	mov    %edx,0x8(%ebp)
80100cf8:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100cfe:	50                   	push   %eax
80100cff:	6a 10                	push   $0x10
80100d01:	ff 75 08             	pushl  0x8(%ebp)
80100d04:	89 f8                	mov    %edi,%eax
80100d06:	83 c0 6c             	add    $0x6c,%eax
80100d09:	50                   	push   %eax
80100d0a:	e8 61 3a 00 00       	call   80104770 <safestrcpy>
80100d0f:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
80100d15:	89 f9                	mov    %edi,%ecx
80100d17:	8b 7f 04             	mov    0x4(%edi),%edi
80100d1a:	8b 41 18             	mov    0x18(%ecx),%eax
80100d1d:	89 31                	mov    %esi,(%ecx)
80100d1f:	89 51 04             	mov    %edx,0x4(%ecx)
80100d22:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d28:	89 50 38             	mov    %edx,0x38(%eax)
80100d2b:	8b 41 18             	mov    0x18(%ecx),%eax
80100d2e:	89 58 44             	mov    %ebx,0x44(%eax)
80100d31:	89 0c 24             	mov    %ecx,(%esp)
80100d34:	e8 67 5c 00 00       	call   801069a0 <switchuvm>
80100d39:	89 3c 24             	mov    %edi,(%esp)
80100d3c:	e8 df 5f 00 00       	call   80106d20 <freevm>
80100d41:	83 c4 10             	add    $0x10,%esp
80100d44:	31 c0                	xor    %eax,%eax
80100d46:	e9 31 fd ff ff       	jmp    80100a7c <exec+0x6c>
80100d4b:	be 00 20 00 00       	mov    $0x2000,%esi
80100d50:	e9 3c fe ff ff       	jmp    80100b91 <exec+0x181>
80100d55:	66 90                	xchg   %ax,%ax
80100d57:	66 90                	xchg   %ax,%ax
80100d59:	66 90                	xchg   %ax,%ax
80100d5b:	66 90                	xchg   %ax,%ax
80100d5d:	66 90                	xchg   %ax,%ax
80100d5f:	90                   	nop

80100d60 <fileinit>:
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	83 ec 10             	sub    $0x10,%esp
80100d66:	68 8d 71 10 80       	push   $0x8010718d
80100d6b:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d70:	e8 cb 35 00 00       	call   80104340 <initlock>
80100d75:	83 c4 10             	add    $0x10,%esp
80100d78:	c9                   	leave  
80100d79:	c3                   	ret    
80100d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d80 <filealloc>:
80100d80:	55                   	push   %ebp
80100d81:	89 e5                	mov    %esp,%ebp
80100d83:	53                   	push   %ebx
80100d84:	bb f4 ff 10 80       	mov    $0x8010fff4,%ebx
80100d89:	83 ec 10             	sub    $0x10,%esp
80100d8c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d91:	e8 ea 36 00 00       	call   80104480 <acquire>
80100d96:	83 c4 10             	add    $0x10,%esp
80100d99:	eb 10                	jmp    80100dab <filealloc+0x2b>
80100d9b:	90                   	nop
80100d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100da0:	83 c3 18             	add    $0x18,%ebx
80100da3:	81 fb 54 09 11 80    	cmp    $0x80110954,%ebx
80100da9:	73 25                	jae    80100dd0 <filealloc+0x50>
80100dab:	8b 43 04             	mov    0x4(%ebx),%eax
80100dae:	85 c0                	test   %eax,%eax
80100db0:	75 ee                	jne    80100da0 <filealloc+0x20>
80100db2:	83 ec 0c             	sub    $0xc,%esp
80100db5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100dbc:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dc1:	e8 7a 37 00 00       	call   80104540 <release>
80100dc6:	89 d8                	mov    %ebx,%eax
80100dc8:	83 c4 10             	add    $0x10,%esp
80100dcb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dce:	c9                   	leave  
80100dcf:	c3                   	ret    
80100dd0:	83 ec 0c             	sub    $0xc,%esp
80100dd3:	31 db                	xor    %ebx,%ebx
80100dd5:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dda:	e8 61 37 00 00       	call   80104540 <release>
80100ddf:	89 d8                	mov    %ebx,%eax
80100de1:	83 c4 10             	add    $0x10,%esp
80100de4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100de7:	c9                   	leave  
80100de8:	c3                   	ret    
80100de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100df0 <filedup>:
80100df0:	55                   	push   %ebp
80100df1:	89 e5                	mov    %esp,%ebp
80100df3:	53                   	push   %ebx
80100df4:	83 ec 10             	sub    $0x10,%esp
80100df7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dfa:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dff:	e8 7c 36 00 00       	call   80104480 <acquire>
80100e04:	8b 43 04             	mov    0x4(%ebx),%eax
80100e07:	83 c4 10             	add    $0x10,%esp
80100e0a:	85 c0                	test   %eax,%eax
80100e0c:	7e 1a                	jle    80100e28 <filedup+0x38>
80100e0e:	83 c0 01             	add    $0x1,%eax
80100e11:	83 ec 0c             	sub    $0xc,%esp
80100e14:	89 43 04             	mov    %eax,0x4(%ebx)
80100e17:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e1c:	e8 1f 37 00 00       	call   80104540 <release>
80100e21:	89 d8                	mov    %ebx,%eax
80100e23:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e26:	c9                   	leave  
80100e27:	c3                   	ret    
80100e28:	83 ec 0c             	sub    $0xc,%esp
80100e2b:	68 94 71 10 80       	push   $0x80107194
80100e30:	e8 5b f5 ff ff       	call   80100390 <panic>
80100e35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e40 <fileclose>:
80100e40:	55                   	push   %ebp
80100e41:	89 e5                	mov    %esp,%ebp
80100e43:	57                   	push   %edi
80100e44:	56                   	push   %esi
80100e45:	53                   	push   %ebx
80100e46:	83 ec 28             	sub    $0x28,%esp
80100e49:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e4c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e51:	e8 2a 36 00 00       	call   80104480 <acquire>
80100e56:	8b 43 04             	mov    0x4(%ebx),%eax
80100e59:	83 c4 10             	add    $0x10,%esp
80100e5c:	85 c0                	test   %eax,%eax
80100e5e:	0f 8e 9b 00 00 00    	jle    80100eff <fileclose+0xbf>
80100e64:	83 e8 01             	sub    $0x1,%eax
80100e67:	85 c0                	test   %eax,%eax
80100e69:	89 43 04             	mov    %eax,0x4(%ebx)
80100e6c:	74 1a                	je     80100e88 <fileclose+0x48>
80100e6e:	c7 45 08 c0 ff 10 80 	movl   $0x8010ffc0,0x8(%ebp)
80100e75:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e78:	5b                   	pop    %ebx
80100e79:	5e                   	pop    %esi
80100e7a:	5f                   	pop    %edi
80100e7b:	5d                   	pop    %ebp
80100e7c:	e9 bf 36 00 00       	jmp    80104540 <release>
80100e81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100e88:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100e8c:	8b 3b                	mov    (%ebx),%edi
80100e8e:	83 ec 0c             	sub    $0xc,%esp
80100e91:	8b 73 0c             	mov    0xc(%ebx),%esi
80100e94:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100e9a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e9d:	8b 43 10             	mov    0x10(%ebx),%eax
80100ea0:	68 c0 ff 10 80       	push   $0x8010ffc0
80100ea5:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100ea8:	e8 93 36 00 00       	call   80104540 <release>
80100ead:	83 c4 10             	add    $0x10,%esp
80100eb0:	83 ff 01             	cmp    $0x1,%edi
80100eb3:	74 13                	je     80100ec8 <fileclose+0x88>
80100eb5:	83 ff 02             	cmp    $0x2,%edi
80100eb8:	74 26                	je     80100ee0 <fileclose+0xa0>
80100eba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ebd:	5b                   	pop    %ebx
80100ebe:	5e                   	pop    %esi
80100ebf:	5f                   	pop    %edi
80100ec0:	5d                   	pop    %ebp
80100ec1:	c3                   	ret    
80100ec2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100ec8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100ecc:	83 ec 08             	sub    $0x8,%esp
80100ecf:	53                   	push   %ebx
80100ed0:	56                   	push   %esi
80100ed1:	e8 8a 24 00 00       	call   80103360 <pipeclose>
80100ed6:	83 c4 10             	add    $0x10,%esp
80100ed9:	eb df                	jmp    80100eba <fileclose+0x7a>
80100edb:	90                   	nop
80100edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ee0:	e8 cb 1c 00 00       	call   80102bb0 <begin_op>
80100ee5:	83 ec 0c             	sub    $0xc,%esp
80100ee8:	ff 75 e0             	pushl  -0x20(%ebp)
80100eeb:	e8 d0 08 00 00       	call   801017c0 <iput>
80100ef0:	83 c4 10             	add    $0x10,%esp
80100ef3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ef6:	5b                   	pop    %ebx
80100ef7:	5e                   	pop    %esi
80100ef8:	5f                   	pop    %edi
80100ef9:	5d                   	pop    %ebp
80100efa:	e9 21 1d 00 00       	jmp    80102c20 <end_op>
80100eff:	83 ec 0c             	sub    $0xc,%esp
80100f02:	68 9c 71 10 80       	push   $0x8010719c
80100f07:	e8 84 f4 ff ff       	call   80100390 <panic>
80100f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f10 <filestat>:
80100f10:	55                   	push   %ebp
80100f11:	89 e5                	mov    %esp,%ebp
80100f13:	53                   	push   %ebx
80100f14:	83 ec 04             	sub    $0x4,%esp
80100f17:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f1a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f1d:	75 31                	jne    80100f50 <filestat+0x40>
80100f1f:	83 ec 0c             	sub    $0xc,%esp
80100f22:	ff 73 10             	pushl  0x10(%ebx)
80100f25:	e8 66 07 00 00       	call   80101690 <ilock>
80100f2a:	58                   	pop    %eax
80100f2b:	5a                   	pop    %edx
80100f2c:	ff 75 0c             	pushl  0xc(%ebp)
80100f2f:	ff 73 10             	pushl  0x10(%ebx)
80100f32:	e8 09 0a 00 00       	call   80101940 <stati>
80100f37:	59                   	pop    %ecx
80100f38:	ff 73 10             	pushl  0x10(%ebx)
80100f3b:	e8 30 08 00 00       	call   80101770 <iunlock>
80100f40:	83 c4 10             	add    $0x10,%esp
80100f43:	31 c0                	xor    %eax,%eax
80100f45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f48:	c9                   	leave  
80100f49:	c3                   	ret    
80100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f55:	eb ee                	jmp    80100f45 <filestat+0x35>
80100f57:	89 f6                	mov    %esi,%esi
80100f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100f60 <fileread>:
80100f60:	55                   	push   %ebp
80100f61:	89 e5                	mov    %esp,%ebp
80100f63:	57                   	push   %edi
80100f64:	56                   	push   %esi
80100f65:	53                   	push   %ebx
80100f66:	83 ec 0c             	sub    $0xc,%esp
80100f69:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f6c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f6f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100f72:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f76:	74 60                	je     80100fd8 <fileread+0x78>
80100f78:	8b 03                	mov    (%ebx),%eax
80100f7a:	83 f8 01             	cmp    $0x1,%eax
80100f7d:	74 41                	je     80100fc0 <fileread+0x60>
80100f7f:	83 f8 02             	cmp    $0x2,%eax
80100f82:	75 5b                	jne    80100fdf <fileread+0x7f>
80100f84:	83 ec 0c             	sub    $0xc,%esp
80100f87:	ff 73 10             	pushl  0x10(%ebx)
80100f8a:	e8 01 07 00 00       	call   80101690 <ilock>
80100f8f:	57                   	push   %edi
80100f90:	ff 73 14             	pushl  0x14(%ebx)
80100f93:	56                   	push   %esi
80100f94:	ff 73 10             	pushl  0x10(%ebx)
80100f97:	e8 d4 09 00 00       	call   80101970 <readi>
80100f9c:	83 c4 20             	add    $0x20,%esp
80100f9f:	85 c0                	test   %eax,%eax
80100fa1:	89 c6                	mov    %eax,%esi
80100fa3:	7e 03                	jle    80100fa8 <fileread+0x48>
80100fa5:	01 43 14             	add    %eax,0x14(%ebx)
80100fa8:	83 ec 0c             	sub    $0xc,%esp
80100fab:	ff 73 10             	pushl  0x10(%ebx)
80100fae:	e8 bd 07 00 00       	call   80101770 <iunlock>
80100fb3:	83 c4 10             	add    $0x10,%esp
80100fb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb9:	89 f0                	mov    %esi,%eax
80100fbb:	5b                   	pop    %ebx
80100fbc:	5e                   	pop    %esi
80100fbd:	5f                   	pop    %edi
80100fbe:	5d                   	pop    %ebp
80100fbf:	c3                   	ret    
80100fc0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fc3:	89 45 08             	mov    %eax,0x8(%ebp)
80100fc6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fc9:	5b                   	pop    %ebx
80100fca:	5e                   	pop    %esi
80100fcb:	5f                   	pop    %edi
80100fcc:	5d                   	pop    %ebp
80100fcd:	e9 3e 25 00 00       	jmp    80103510 <piperead>
80100fd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fd8:	be ff ff ff ff       	mov    $0xffffffff,%esi
80100fdd:	eb d7                	jmp    80100fb6 <fileread+0x56>
80100fdf:	83 ec 0c             	sub    $0xc,%esp
80100fe2:	68 a6 71 10 80       	push   $0x801071a6
80100fe7:	e8 a4 f3 ff ff       	call   80100390 <panic>
80100fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ff0 <filewrite>:
80100ff0:	55                   	push   %ebp
80100ff1:	89 e5                	mov    %esp,%ebp
80100ff3:	57                   	push   %edi
80100ff4:	56                   	push   %esi
80100ff5:	53                   	push   %ebx
80100ff6:	83 ec 1c             	sub    $0x1c,%esp
80100ff9:	8b 75 08             	mov    0x8(%ebp),%esi
80100ffc:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fff:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80101003:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101006:	8b 45 10             	mov    0x10(%ebp),%eax
80101009:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010100c:	0f 84 aa 00 00 00    	je     801010bc <filewrite+0xcc>
80101012:	8b 06                	mov    (%esi),%eax
80101014:	83 f8 01             	cmp    $0x1,%eax
80101017:	0f 84 c3 00 00 00    	je     801010e0 <filewrite+0xf0>
8010101d:	83 f8 02             	cmp    $0x2,%eax
80101020:	0f 85 d9 00 00 00    	jne    801010ff <filewrite+0x10f>
80101026:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101029:	31 ff                	xor    %edi,%edi
8010102b:	85 c0                	test   %eax,%eax
8010102d:	7f 34                	jg     80101063 <filewrite+0x73>
8010102f:	e9 9c 00 00 00       	jmp    801010d0 <filewrite+0xe0>
80101034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101038:	01 46 14             	add    %eax,0x14(%esi)
8010103b:	83 ec 0c             	sub    $0xc,%esp
8010103e:	ff 76 10             	pushl  0x10(%esi)
80101041:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101044:	e8 27 07 00 00       	call   80101770 <iunlock>
80101049:	e8 d2 1b 00 00       	call   80102c20 <end_op>
8010104e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101051:	83 c4 10             	add    $0x10,%esp
80101054:	39 c3                	cmp    %eax,%ebx
80101056:	0f 85 96 00 00 00    	jne    801010f2 <filewrite+0x102>
8010105c:	01 df                	add    %ebx,%edi
8010105e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101061:	7e 6d                	jle    801010d0 <filewrite+0xe0>
80101063:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101066:	b8 00 06 00 00       	mov    $0x600,%eax
8010106b:	29 fb                	sub    %edi,%ebx
8010106d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101073:	0f 4f d8             	cmovg  %eax,%ebx
80101076:	e8 35 1b 00 00       	call   80102bb0 <begin_op>
8010107b:	83 ec 0c             	sub    $0xc,%esp
8010107e:	ff 76 10             	pushl  0x10(%esi)
80101081:	e8 0a 06 00 00       	call   80101690 <ilock>
80101086:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101089:	53                   	push   %ebx
8010108a:	ff 76 14             	pushl  0x14(%esi)
8010108d:	01 f8                	add    %edi,%eax
8010108f:	50                   	push   %eax
80101090:	ff 76 10             	pushl  0x10(%esi)
80101093:	e8 d8 09 00 00       	call   80101a70 <writei>
80101098:	83 c4 20             	add    $0x20,%esp
8010109b:	85 c0                	test   %eax,%eax
8010109d:	7f 99                	jg     80101038 <filewrite+0x48>
8010109f:	83 ec 0c             	sub    $0xc,%esp
801010a2:	ff 76 10             	pushl  0x10(%esi)
801010a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010a8:	e8 c3 06 00 00       	call   80101770 <iunlock>
801010ad:	e8 6e 1b 00 00       	call   80102c20 <end_op>
801010b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010b5:	83 c4 10             	add    $0x10,%esp
801010b8:	85 c0                	test   %eax,%eax
801010ba:	74 98                	je     80101054 <filewrite+0x64>
801010bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010bf:	bf ff ff ff ff       	mov    $0xffffffff,%edi
801010c4:	89 f8                	mov    %edi,%eax
801010c6:	5b                   	pop    %ebx
801010c7:	5e                   	pop    %esi
801010c8:	5f                   	pop    %edi
801010c9:	5d                   	pop    %ebp
801010ca:	c3                   	ret    
801010cb:	90                   	nop
801010cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801010d0:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801010d3:	75 e7                	jne    801010bc <filewrite+0xcc>
801010d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010d8:	89 f8                	mov    %edi,%eax
801010da:	5b                   	pop    %ebx
801010db:	5e                   	pop    %esi
801010dc:	5f                   	pop    %edi
801010dd:	5d                   	pop    %ebp
801010de:	c3                   	ret    
801010df:	90                   	nop
801010e0:	8b 46 0c             	mov    0xc(%esi),%eax
801010e3:	89 45 08             	mov    %eax,0x8(%ebp)
801010e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010e9:	5b                   	pop    %ebx
801010ea:	5e                   	pop    %esi
801010eb:	5f                   	pop    %edi
801010ec:	5d                   	pop    %ebp
801010ed:	e9 0e 23 00 00       	jmp    80103400 <pipewrite>
801010f2:	83 ec 0c             	sub    $0xc,%esp
801010f5:	68 af 71 10 80       	push   $0x801071af
801010fa:	e8 91 f2 ff ff       	call   80100390 <panic>
801010ff:	83 ec 0c             	sub    $0xc,%esp
80101102:	68 b5 71 10 80       	push   $0x801071b5
80101107:	e8 84 f2 ff ff       	call   80100390 <panic>
8010110c:	66 90                	xchg   %ax,%ax
8010110e:	66 90                	xchg   %ax,%ax

80101110 <balloc>:
80101110:	55                   	push   %ebp
80101111:	89 e5                	mov    %esp,%ebp
80101113:	57                   	push   %edi
80101114:	56                   	push   %esi
80101115:	53                   	push   %ebx
80101116:	83 ec 1c             	sub    $0x1c,%esp
80101119:	8b 0d c0 09 11 80    	mov    0x801109c0,%ecx
8010111f:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101122:	85 c9                	test   %ecx,%ecx
80101124:	0f 84 87 00 00 00    	je     801011b1 <balloc+0xa1>
8010112a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101131:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101134:	83 ec 08             	sub    $0x8,%esp
80101137:	89 f0                	mov    %esi,%eax
80101139:	c1 f8 0c             	sar    $0xc,%eax
8010113c:	03 05 d8 09 11 80    	add    0x801109d8,%eax
80101142:	50                   	push   %eax
80101143:	ff 75 d8             	pushl  -0x28(%ebp)
80101146:	e8 85 ef ff ff       	call   801000d0 <bread>
8010114b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010114e:	a1 c0 09 11 80       	mov    0x801109c0,%eax
80101153:	83 c4 10             	add    $0x10,%esp
80101156:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101159:	31 c0                	xor    %eax,%eax
8010115b:	eb 2f                	jmp    8010118c <balloc+0x7c>
8010115d:	8d 76 00             	lea    0x0(%esi),%esi
80101160:	89 c1                	mov    %eax,%ecx
80101162:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101165:	bb 01 00 00 00       	mov    $0x1,%ebx
8010116a:	83 e1 07             	and    $0x7,%ecx
8010116d:	d3 e3                	shl    %cl,%ebx
8010116f:	89 c1                	mov    %eax,%ecx
80101171:	c1 f9 03             	sar    $0x3,%ecx
80101174:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101179:	85 df                	test   %ebx,%edi
8010117b:	89 fa                	mov    %edi,%edx
8010117d:	74 41                	je     801011c0 <balloc+0xb0>
8010117f:	83 c0 01             	add    $0x1,%eax
80101182:	83 c6 01             	add    $0x1,%esi
80101185:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010118a:	74 05                	je     80101191 <balloc+0x81>
8010118c:	39 75 e0             	cmp    %esi,-0x20(%ebp)
8010118f:	77 cf                	ja     80101160 <balloc+0x50>
80101191:	83 ec 0c             	sub    $0xc,%esp
80101194:	ff 75 e4             	pushl  -0x1c(%ebp)
80101197:	e8 44 f0 ff ff       	call   801001e0 <brelse>
8010119c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
801011a3:	83 c4 10             	add    $0x10,%esp
801011a6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801011a9:	39 05 c0 09 11 80    	cmp    %eax,0x801109c0
801011af:	77 80                	ja     80101131 <balloc+0x21>
801011b1:	83 ec 0c             	sub    $0xc,%esp
801011b4:	68 bf 71 10 80       	push   $0x801071bf
801011b9:	e8 d2 f1 ff ff       	call   80100390 <panic>
801011be:	66 90                	xchg   %ax,%ax
801011c0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801011c3:	83 ec 0c             	sub    $0xc,%esp
801011c6:	09 da                	or     %ebx,%edx
801011c8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
801011cc:	57                   	push   %edi
801011cd:	e8 ae 1b 00 00       	call   80102d80 <log_write>
801011d2:	89 3c 24             	mov    %edi,(%esp)
801011d5:	e8 06 f0 ff ff       	call   801001e0 <brelse>
801011da:	58                   	pop    %eax
801011db:	5a                   	pop    %edx
801011dc:	56                   	push   %esi
801011dd:	ff 75 d8             	pushl  -0x28(%ebp)
801011e0:	e8 eb ee ff ff       	call   801000d0 <bread>
801011e5:	89 c3                	mov    %eax,%ebx
801011e7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011ea:	83 c4 0c             	add    $0xc,%esp
801011ed:	68 00 02 00 00       	push   $0x200
801011f2:	6a 00                	push   $0x0
801011f4:	50                   	push   %eax
801011f5:	e8 96 33 00 00       	call   80104590 <memset>
801011fa:	89 1c 24             	mov    %ebx,(%esp)
801011fd:	e8 7e 1b 00 00       	call   80102d80 <log_write>
80101202:	89 1c 24             	mov    %ebx,(%esp)
80101205:	e8 d6 ef ff ff       	call   801001e0 <brelse>
8010120a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010120d:	89 f0                	mov    %esi,%eax
8010120f:	5b                   	pop    %ebx
80101210:	5e                   	pop    %esi
80101211:	5f                   	pop    %edi
80101212:	5d                   	pop    %ebp
80101213:	c3                   	ret    
80101214:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010121a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101220 <iget>:
80101220:	55                   	push   %ebp
80101221:	89 e5                	mov    %esp,%ebp
80101223:	57                   	push   %edi
80101224:	56                   	push   %esi
80101225:	53                   	push   %ebx
80101226:	89 c7                	mov    %eax,%edi
80101228:	31 f6                	xor    %esi,%esi
8010122a:	bb 14 0a 11 80       	mov    $0x80110a14,%ebx
8010122f:	83 ec 28             	sub    $0x28,%esp
80101232:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101235:	68 e0 09 11 80       	push   $0x801109e0
8010123a:	e8 41 32 00 00       	call   80104480 <acquire>
8010123f:	83 c4 10             	add    $0x10,%esp
80101242:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101245:	eb 17                	jmp    8010125e <iget+0x3e>
80101247:	89 f6                	mov    %esi,%esi
80101249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101250:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101256:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
8010125c:	73 22                	jae    80101280 <iget+0x60>
8010125e:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101261:	85 c9                	test   %ecx,%ecx
80101263:	7e 04                	jle    80101269 <iget+0x49>
80101265:	39 3b                	cmp    %edi,(%ebx)
80101267:	74 4f                	je     801012b8 <iget+0x98>
80101269:	85 f6                	test   %esi,%esi
8010126b:	75 e3                	jne    80101250 <iget+0x30>
8010126d:	85 c9                	test   %ecx,%ecx
8010126f:	0f 44 f3             	cmove  %ebx,%esi
80101272:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101278:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
8010127e:	72 de                	jb     8010125e <iget+0x3e>
80101280:	85 f6                	test   %esi,%esi
80101282:	74 5b                	je     801012df <iget+0xbf>
80101284:	83 ec 0c             	sub    $0xc,%esp
80101287:	89 3e                	mov    %edi,(%esi)
80101289:	89 56 04             	mov    %edx,0x4(%esi)
8010128c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
80101293:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010129a:	68 e0 09 11 80       	push   $0x801109e0
8010129f:	e8 9c 32 00 00       	call   80104540 <release>
801012a4:	83 c4 10             	add    $0x10,%esp
801012a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012aa:	89 f0                	mov    %esi,%eax
801012ac:	5b                   	pop    %ebx
801012ad:	5e                   	pop    %esi
801012ae:	5f                   	pop    %edi
801012af:	5d                   	pop    %ebp
801012b0:	c3                   	ret    
801012b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801012b8:	39 53 04             	cmp    %edx,0x4(%ebx)
801012bb:	75 ac                	jne    80101269 <iget+0x49>
801012bd:	83 ec 0c             	sub    $0xc,%esp
801012c0:	83 c1 01             	add    $0x1,%ecx
801012c3:	89 de                	mov    %ebx,%esi
801012c5:	68 e0 09 11 80       	push   $0x801109e0
801012ca:	89 4b 08             	mov    %ecx,0x8(%ebx)
801012cd:	e8 6e 32 00 00       	call   80104540 <release>
801012d2:	83 c4 10             	add    $0x10,%esp
801012d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012d8:	89 f0                	mov    %esi,%eax
801012da:	5b                   	pop    %ebx
801012db:	5e                   	pop    %esi
801012dc:	5f                   	pop    %edi
801012dd:	5d                   	pop    %ebp
801012de:	c3                   	ret    
801012df:	83 ec 0c             	sub    $0xc,%esp
801012e2:	68 d5 71 10 80       	push   $0x801071d5
801012e7:	e8 a4 f0 ff ff       	call   80100390 <panic>
801012ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801012f0 <bmap>:
801012f0:	55                   	push   %ebp
801012f1:	89 e5                	mov    %esp,%ebp
801012f3:	57                   	push   %edi
801012f4:	56                   	push   %esi
801012f5:	53                   	push   %ebx
801012f6:	89 c6                	mov    %eax,%esi
801012f8:	83 ec 1c             	sub    $0x1c,%esp
801012fb:	83 fa 0b             	cmp    $0xb,%edx
801012fe:	77 18                	ja     80101318 <bmap+0x28>
80101300:	8d 3c 90             	lea    (%eax,%edx,4),%edi
80101303:	8b 5f 5c             	mov    0x5c(%edi),%ebx
80101306:	85 db                	test   %ebx,%ebx
80101308:	74 76                	je     80101380 <bmap+0x90>
8010130a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010130d:	89 d8                	mov    %ebx,%eax
8010130f:	5b                   	pop    %ebx
80101310:	5e                   	pop    %esi
80101311:	5f                   	pop    %edi
80101312:	5d                   	pop    %ebp
80101313:	c3                   	ret    
80101314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101318:	8d 5a f4             	lea    -0xc(%edx),%ebx
8010131b:	83 fb 7f             	cmp    $0x7f,%ebx
8010131e:	0f 87 90 00 00 00    	ja     801013b4 <bmap+0xc4>
80101324:	8b 90 8c 00 00 00    	mov    0x8c(%eax),%edx
8010132a:	8b 00                	mov    (%eax),%eax
8010132c:	85 d2                	test   %edx,%edx
8010132e:	74 70                	je     801013a0 <bmap+0xb0>
80101330:	83 ec 08             	sub    $0x8,%esp
80101333:	52                   	push   %edx
80101334:	50                   	push   %eax
80101335:	e8 96 ed ff ff       	call   801000d0 <bread>
8010133a:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010133e:	83 c4 10             	add    $0x10,%esp
80101341:	89 c7                	mov    %eax,%edi
80101343:	8b 1a                	mov    (%edx),%ebx
80101345:	85 db                	test   %ebx,%ebx
80101347:	75 1d                	jne    80101366 <bmap+0x76>
80101349:	8b 06                	mov    (%esi),%eax
8010134b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010134e:	e8 bd fd ff ff       	call   80101110 <balloc>
80101353:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101356:	83 ec 0c             	sub    $0xc,%esp
80101359:	89 c3                	mov    %eax,%ebx
8010135b:	89 02                	mov    %eax,(%edx)
8010135d:	57                   	push   %edi
8010135e:	e8 1d 1a 00 00       	call   80102d80 <log_write>
80101363:	83 c4 10             	add    $0x10,%esp
80101366:	83 ec 0c             	sub    $0xc,%esp
80101369:	57                   	push   %edi
8010136a:	e8 71 ee ff ff       	call   801001e0 <brelse>
8010136f:	83 c4 10             	add    $0x10,%esp
80101372:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101375:	89 d8                	mov    %ebx,%eax
80101377:	5b                   	pop    %ebx
80101378:	5e                   	pop    %esi
80101379:	5f                   	pop    %edi
8010137a:	5d                   	pop    %ebp
8010137b:	c3                   	ret    
8010137c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101380:	8b 00                	mov    (%eax),%eax
80101382:	e8 89 fd ff ff       	call   80101110 <balloc>
80101387:	89 47 5c             	mov    %eax,0x5c(%edi)
8010138a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010138d:	89 c3                	mov    %eax,%ebx
8010138f:	89 d8                	mov    %ebx,%eax
80101391:	5b                   	pop    %ebx
80101392:	5e                   	pop    %esi
80101393:	5f                   	pop    %edi
80101394:	5d                   	pop    %ebp
80101395:	c3                   	ret    
80101396:	8d 76 00             	lea    0x0(%esi),%esi
80101399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801013a0:	e8 6b fd ff ff       	call   80101110 <balloc>
801013a5:	89 c2                	mov    %eax,%edx
801013a7:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801013ad:	8b 06                	mov    (%esi),%eax
801013af:	e9 7c ff ff ff       	jmp    80101330 <bmap+0x40>
801013b4:	83 ec 0c             	sub    $0xc,%esp
801013b7:	68 e5 71 10 80       	push   $0x801071e5
801013bc:	e8 cf ef ff ff       	call   80100390 <panic>
801013c1:	eb 0d                	jmp    801013d0 <readsb>
801013c3:	90                   	nop
801013c4:	90                   	nop
801013c5:	90                   	nop
801013c6:	90                   	nop
801013c7:	90                   	nop
801013c8:	90                   	nop
801013c9:	90                   	nop
801013ca:	90                   	nop
801013cb:	90                   	nop
801013cc:	90                   	nop
801013cd:	90                   	nop
801013ce:	90                   	nop
801013cf:	90                   	nop

801013d0 <readsb>:
801013d0:	55                   	push   %ebp
801013d1:	89 e5                	mov    %esp,%ebp
801013d3:	56                   	push   %esi
801013d4:	53                   	push   %ebx
801013d5:	8b 75 0c             	mov    0xc(%ebp),%esi
801013d8:	83 ec 08             	sub    $0x8,%esp
801013db:	6a 01                	push   $0x1
801013dd:	ff 75 08             	pushl  0x8(%ebp)
801013e0:	e8 eb ec ff ff       	call   801000d0 <bread>
801013e5:	89 c3                	mov    %eax,%ebx
801013e7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ea:	83 c4 0c             	add    $0xc,%esp
801013ed:	6a 1c                	push   $0x1c
801013ef:	50                   	push   %eax
801013f0:	56                   	push   %esi
801013f1:	e8 4a 32 00 00       	call   80104640 <memmove>
801013f6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013f9:	83 c4 10             	add    $0x10,%esp
801013fc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013ff:	5b                   	pop    %ebx
80101400:	5e                   	pop    %esi
80101401:	5d                   	pop    %ebp
80101402:	e9 d9 ed ff ff       	jmp    801001e0 <brelse>
80101407:	89 f6                	mov    %esi,%esi
80101409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101410 <bfree>:
80101410:	55                   	push   %ebp
80101411:	89 e5                	mov    %esp,%ebp
80101413:	56                   	push   %esi
80101414:	53                   	push   %ebx
80101415:	89 d3                	mov    %edx,%ebx
80101417:	89 c6                	mov    %eax,%esi
80101419:	83 ec 08             	sub    $0x8,%esp
8010141c:	68 c0 09 11 80       	push   $0x801109c0
80101421:	50                   	push   %eax
80101422:	e8 a9 ff ff ff       	call   801013d0 <readsb>
80101427:	58                   	pop    %eax
80101428:	5a                   	pop    %edx
80101429:	89 da                	mov    %ebx,%edx
8010142b:	c1 ea 0c             	shr    $0xc,%edx
8010142e:	03 15 d8 09 11 80    	add    0x801109d8,%edx
80101434:	52                   	push   %edx
80101435:	56                   	push   %esi
80101436:	e8 95 ec ff ff       	call   801000d0 <bread>
8010143b:	89 d9                	mov    %ebx,%ecx
8010143d:	c1 fb 03             	sar    $0x3,%ebx
80101440:	ba 01 00 00 00       	mov    $0x1,%edx
80101445:	83 e1 07             	and    $0x7,%ecx
80101448:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
8010144e:	83 c4 10             	add    $0x10,%esp
80101451:	d3 e2                	shl    %cl,%edx
80101453:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101458:	85 d1                	test   %edx,%ecx
8010145a:	74 25                	je     80101481 <bfree+0x71>
8010145c:	f7 d2                	not    %edx
8010145e:	89 c6                	mov    %eax,%esi
80101460:	83 ec 0c             	sub    $0xc,%esp
80101463:	21 ca                	and    %ecx,%edx
80101465:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
80101469:	56                   	push   %esi
8010146a:	e8 11 19 00 00       	call   80102d80 <log_write>
8010146f:	89 34 24             	mov    %esi,(%esp)
80101472:	e8 69 ed ff ff       	call   801001e0 <brelse>
80101477:	83 c4 10             	add    $0x10,%esp
8010147a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010147d:	5b                   	pop    %ebx
8010147e:	5e                   	pop    %esi
8010147f:	5d                   	pop    %ebp
80101480:	c3                   	ret    
80101481:	83 ec 0c             	sub    $0xc,%esp
80101484:	68 f8 71 10 80       	push   $0x801071f8
80101489:	e8 02 ef ff ff       	call   80100390 <panic>
8010148e:	66 90                	xchg   %ax,%ax

80101490 <iinit>:
80101490:	55                   	push   %ebp
80101491:	89 e5                	mov    %esp,%ebp
80101493:	53                   	push   %ebx
80101494:	bb 20 0a 11 80       	mov    $0x80110a20,%ebx
80101499:	83 ec 0c             	sub    $0xc,%esp
8010149c:	68 0b 72 10 80       	push   $0x8010720b
801014a1:	68 e0 09 11 80       	push   $0x801109e0
801014a6:	e8 95 2e 00 00       	call   80104340 <initlock>
801014ab:	83 c4 10             	add    $0x10,%esp
801014ae:	66 90                	xchg   %ax,%ax
801014b0:	83 ec 08             	sub    $0x8,%esp
801014b3:	68 12 72 10 80       	push   $0x80107212
801014b8:	53                   	push   %ebx
801014b9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014bf:	e8 4c 2d 00 00       	call   80104210 <initsleeplock>
801014c4:	83 c4 10             	add    $0x10,%esp
801014c7:	81 fb 40 26 11 80    	cmp    $0x80112640,%ebx
801014cd:	75 e1                	jne    801014b0 <iinit+0x20>
801014cf:	83 ec 08             	sub    $0x8,%esp
801014d2:	68 c0 09 11 80       	push   $0x801109c0
801014d7:	ff 75 08             	pushl  0x8(%ebp)
801014da:	e8 f1 fe ff ff       	call   801013d0 <readsb>
801014df:	ff 35 d8 09 11 80    	pushl  0x801109d8
801014e5:	ff 35 d4 09 11 80    	pushl  0x801109d4
801014eb:	ff 35 d0 09 11 80    	pushl  0x801109d0
801014f1:	ff 35 cc 09 11 80    	pushl  0x801109cc
801014f7:	ff 35 c8 09 11 80    	pushl  0x801109c8
801014fd:	ff 35 c4 09 11 80    	pushl  0x801109c4
80101503:	ff 35 c0 09 11 80    	pushl  0x801109c0
80101509:	68 78 72 10 80       	push   $0x80107278
8010150e:	e8 4d f1 ff ff       	call   80100660 <cprintf>
80101513:	83 c4 30             	add    $0x30,%esp
80101516:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101519:	c9                   	leave  
8010151a:	c3                   	ret    
8010151b:	90                   	nop
8010151c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101520 <ialloc>:
80101520:	55                   	push   %ebp
80101521:	89 e5                	mov    %esp,%ebp
80101523:	57                   	push   %edi
80101524:	56                   	push   %esi
80101525:	53                   	push   %ebx
80101526:	83 ec 1c             	sub    $0x1c,%esp
80101529:	83 3d c8 09 11 80 01 	cmpl   $0x1,0x801109c8
80101530:	8b 45 0c             	mov    0xc(%ebp),%eax
80101533:	8b 75 08             	mov    0x8(%ebp),%esi
80101536:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101539:	0f 86 91 00 00 00    	jbe    801015d0 <ialloc+0xb0>
8010153f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101544:	eb 21                	jmp    80101567 <ialloc+0x47>
80101546:	8d 76 00             	lea    0x0(%esi),%esi
80101549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101550:	83 ec 0c             	sub    $0xc,%esp
80101553:	83 c3 01             	add    $0x1,%ebx
80101556:	57                   	push   %edi
80101557:	e8 84 ec ff ff       	call   801001e0 <brelse>
8010155c:	83 c4 10             	add    $0x10,%esp
8010155f:	39 1d c8 09 11 80    	cmp    %ebx,0x801109c8
80101565:	76 69                	jbe    801015d0 <ialloc+0xb0>
80101567:	89 d8                	mov    %ebx,%eax
80101569:	83 ec 08             	sub    $0x8,%esp
8010156c:	c1 e8 03             	shr    $0x3,%eax
8010156f:	03 05 d4 09 11 80    	add    0x801109d4,%eax
80101575:	50                   	push   %eax
80101576:	56                   	push   %esi
80101577:	e8 54 eb ff ff       	call   801000d0 <bread>
8010157c:	89 c7                	mov    %eax,%edi
8010157e:	89 d8                	mov    %ebx,%eax
80101580:	83 c4 10             	add    $0x10,%esp
80101583:	83 e0 07             	and    $0x7,%eax
80101586:	c1 e0 06             	shl    $0x6,%eax
80101589:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
8010158d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101591:	75 bd                	jne    80101550 <ialloc+0x30>
80101593:	83 ec 04             	sub    $0x4,%esp
80101596:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101599:	6a 40                	push   $0x40
8010159b:	6a 00                	push   $0x0
8010159d:	51                   	push   %ecx
8010159e:	e8 ed 2f 00 00       	call   80104590 <memset>
801015a3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801015a7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801015aa:	66 89 01             	mov    %ax,(%ecx)
801015ad:	89 3c 24             	mov    %edi,(%esp)
801015b0:	e8 cb 17 00 00       	call   80102d80 <log_write>
801015b5:	89 3c 24             	mov    %edi,(%esp)
801015b8:	e8 23 ec ff ff       	call   801001e0 <brelse>
801015bd:	83 c4 10             	add    $0x10,%esp
801015c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801015c3:	89 da                	mov    %ebx,%edx
801015c5:	89 f0                	mov    %esi,%eax
801015c7:	5b                   	pop    %ebx
801015c8:	5e                   	pop    %esi
801015c9:	5f                   	pop    %edi
801015ca:	5d                   	pop    %ebp
801015cb:	e9 50 fc ff ff       	jmp    80101220 <iget>
801015d0:	83 ec 0c             	sub    $0xc,%esp
801015d3:	68 18 72 10 80       	push   $0x80107218
801015d8:	e8 b3 ed ff ff       	call   80100390 <panic>
801015dd:	8d 76 00             	lea    0x0(%esi),%esi

801015e0 <iupdate>:
801015e0:	55                   	push   %ebp
801015e1:	89 e5                	mov    %esp,%ebp
801015e3:	56                   	push   %esi
801015e4:	53                   	push   %ebx
801015e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801015e8:	83 ec 08             	sub    $0x8,%esp
801015eb:	8b 43 04             	mov    0x4(%ebx),%eax
801015ee:	83 c3 5c             	add    $0x5c,%ebx
801015f1:	c1 e8 03             	shr    $0x3,%eax
801015f4:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801015fa:	50                   	push   %eax
801015fb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015fe:	e8 cd ea ff ff       	call   801000d0 <bread>
80101603:	89 c6                	mov    %eax,%esi
80101605:	8b 43 a8             	mov    -0x58(%ebx),%eax
80101608:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
8010160c:	83 c4 0c             	add    $0xc,%esp
8010160f:	83 e0 07             	and    $0x7,%eax
80101612:	c1 e0 06             	shl    $0x6,%eax
80101615:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101619:	66 89 10             	mov    %dx,(%eax)
8010161c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
80101620:	83 c0 0c             	add    $0xc,%eax
80101623:	66 89 50 f6          	mov    %dx,-0xa(%eax)
80101627:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010162b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
8010162f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101633:	66 89 50 fa          	mov    %dx,-0x6(%eax)
80101637:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010163a:	89 50 fc             	mov    %edx,-0x4(%eax)
8010163d:	6a 34                	push   $0x34
8010163f:	53                   	push   %ebx
80101640:	50                   	push   %eax
80101641:	e8 fa 2f 00 00       	call   80104640 <memmove>
80101646:	89 34 24             	mov    %esi,(%esp)
80101649:	e8 32 17 00 00       	call   80102d80 <log_write>
8010164e:	89 75 08             	mov    %esi,0x8(%ebp)
80101651:	83 c4 10             	add    $0x10,%esp
80101654:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101657:	5b                   	pop    %ebx
80101658:	5e                   	pop    %esi
80101659:	5d                   	pop    %ebp
8010165a:	e9 81 eb ff ff       	jmp    801001e0 <brelse>
8010165f:	90                   	nop

80101660 <idup>:
80101660:	55                   	push   %ebp
80101661:	89 e5                	mov    %esp,%ebp
80101663:	53                   	push   %ebx
80101664:	83 ec 10             	sub    $0x10,%esp
80101667:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010166a:	68 e0 09 11 80       	push   $0x801109e0
8010166f:	e8 0c 2e 00 00       	call   80104480 <acquire>
80101674:	83 43 08 01          	addl   $0x1,0x8(%ebx)
80101678:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010167f:	e8 bc 2e 00 00       	call   80104540 <release>
80101684:	89 d8                	mov    %ebx,%eax
80101686:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101689:	c9                   	leave  
8010168a:	c3                   	ret    
8010168b:	90                   	nop
8010168c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101690 <ilock>:
80101690:	55                   	push   %ebp
80101691:	89 e5                	mov    %esp,%ebp
80101693:	56                   	push   %esi
80101694:	53                   	push   %ebx
80101695:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101698:	85 db                	test   %ebx,%ebx
8010169a:	0f 84 b7 00 00 00    	je     80101757 <ilock+0xc7>
801016a0:	8b 53 08             	mov    0x8(%ebx),%edx
801016a3:	85 d2                	test   %edx,%edx
801016a5:	0f 8e ac 00 00 00    	jle    80101757 <ilock+0xc7>
801016ab:	8d 43 0c             	lea    0xc(%ebx),%eax
801016ae:	83 ec 0c             	sub    $0xc,%esp
801016b1:	50                   	push   %eax
801016b2:	e8 99 2b 00 00       	call   80104250 <acquiresleep>
801016b7:	8b 43 4c             	mov    0x4c(%ebx),%eax
801016ba:	83 c4 10             	add    $0x10,%esp
801016bd:	85 c0                	test   %eax,%eax
801016bf:	74 0f                	je     801016d0 <ilock+0x40>
801016c1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016c4:	5b                   	pop    %ebx
801016c5:	5e                   	pop    %esi
801016c6:	5d                   	pop    %ebp
801016c7:	c3                   	ret    
801016c8:	90                   	nop
801016c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801016d0:	8b 43 04             	mov    0x4(%ebx),%eax
801016d3:	83 ec 08             	sub    $0x8,%esp
801016d6:	c1 e8 03             	shr    $0x3,%eax
801016d9:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801016df:	50                   	push   %eax
801016e0:	ff 33                	pushl  (%ebx)
801016e2:	e8 e9 e9 ff ff       	call   801000d0 <bread>
801016e7:	89 c6                	mov    %eax,%esi
801016e9:	8b 43 04             	mov    0x4(%ebx),%eax
801016ec:	83 c4 0c             	add    $0xc,%esp
801016ef:	83 e0 07             	and    $0x7,%eax
801016f2:	c1 e0 06             	shl    $0x6,%eax
801016f5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801016f9:	0f b7 10             	movzwl (%eax),%edx
801016fc:	83 c0 0c             	add    $0xc,%eax
801016ff:	66 89 53 50          	mov    %dx,0x50(%ebx)
80101703:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101707:	66 89 53 52          	mov    %dx,0x52(%ebx)
8010170b:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
8010170f:	66 89 53 54          	mov    %dx,0x54(%ebx)
80101713:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101717:	66 89 53 56          	mov    %dx,0x56(%ebx)
8010171b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010171e:	89 53 58             	mov    %edx,0x58(%ebx)
80101721:	6a 34                	push   $0x34
80101723:	50                   	push   %eax
80101724:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101727:	50                   	push   %eax
80101728:	e8 13 2f 00 00       	call   80104640 <memmove>
8010172d:	89 34 24             	mov    %esi,(%esp)
80101730:	e8 ab ea ff ff       	call   801001e0 <brelse>
80101735:	83 c4 10             	add    $0x10,%esp
80101738:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
8010173d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101744:	0f 85 77 ff ff ff    	jne    801016c1 <ilock+0x31>
8010174a:	83 ec 0c             	sub    $0xc,%esp
8010174d:	68 30 72 10 80       	push   $0x80107230
80101752:	e8 39 ec ff ff       	call   80100390 <panic>
80101757:	83 ec 0c             	sub    $0xc,%esp
8010175a:	68 2a 72 10 80       	push   $0x8010722a
8010175f:	e8 2c ec ff ff       	call   80100390 <panic>
80101764:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010176a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101770 <iunlock>:
80101770:	55                   	push   %ebp
80101771:	89 e5                	mov    %esp,%ebp
80101773:	56                   	push   %esi
80101774:	53                   	push   %ebx
80101775:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101778:	85 db                	test   %ebx,%ebx
8010177a:	74 28                	je     801017a4 <iunlock+0x34>
8010177c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010177f:	83 ec 0c             	sub    $0xc,%esp
80101782:	56                   	push   %esi
80101783:	e8 68 2b 00 00       	call   801042f0 <holdingsleep>
80101788:	83 c4 10             	add    $0x10,%esp
8010178b:	85 c0                	test   %eax,%eax
8010178d:	74 15                	je     801017a4 <iunlock+0x34>
8010178f:	8b 43 08             	mov    0x8(%ebx),%eax
80101792:	85 c0                	test   %eax,%eax
80101794:	7e 0e                	jle    801017a4 <iunlock+0x34>
80101796:	89 75 08             	mov    %esi,0x8(%ebp)
80101799:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010179c:	5b                   	pop    %ebx
8010179d:	5e                   	pop    %esi
8010179e:	5d                   	pop    %ebp
8010179f:	e9 0c 2b 00 00       	jmp    801042b0 <releasesleep>
801017a4:	83 ec 0c             	sub    $0xc,%esp
801017a7:	68 3f 72 10 80       	push   $0x8010723f
801017ac:	e8 df eb ff ff       	call   80100390 <panic>
801017b1:	eb 0d                	jmp    801017c0 <iput>
801017b3:	90                   	nop
801017b4:	90                   	nop
801017b5:	90                   	nop
801017b6:	90                   	nop
801017b7:	90                   	nop
801017b8:	90                   	nop
801017b9:	90                   	nop
801017ba:	90                   	nop
801017bb:	90                   	nop
801017bc:	90                   	nop
801017bd:	90                   	nop
801017be:	90                   	nop
801017bf:	90                   	nop

801017c0 <iput>:
801017c0:	55                   	push   %ebp
801017c1:	89 e5                	mov    %esp,%ebp
801017c3:	57                   	push   %edi
801017c4:	56                   	push   %esi
801017c5:	53                   	push   %ebx
801017c6:	83 ec 28             	sub    $0x28,%esp
801017c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801017cc:	8d 7b 0c             	lea    0xc(%ebx),%edi
801017cf:	57                   	push   %edi
801017d0:	e8 7b 2a 00 00       	call   80104250 <acquiresleep>
801017d5:	8b 53 4c             	mov    0x4c(%ebx),%edx
801017d8:	83 c4 10             	add    $0x10,%esp
801017db:	85 d2                	test   %edx,%edx
801017dd:	74 07                	je     801017e6 <iput+0x26>
801017df:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801017e4:	74 32                	je     80101818 <iput+0x58>
801017e6:	83 ec 0c             	sub    $0xc,%esp
801017e9:	57                   	push   %edi
801017ea:	e8 c1 2a 00 00       	call   801042b0 <releasesleep>
801017ef:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801017f6:	e8 85 2c 00 00       	call   80104480 <acquire>
801017fb:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
801017ff:	83 c4 10             	add    $0x10,%esp
80101802:	c7 45 08 e0 09 11 80 	movl   $0x801109e0,0x8(%ebp)
80101809:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010180c:	5b                   	pop    %ebx
8010180d:	5e                   	pop    %esi
8010180e:	5f                   	pop    %edi
8010180f:	5d                   	pop    %ebp
80101810:	e9 2b 2d 00 00       	jmp    80104540 <release>
80101815:	8d 76 00             	lea    0x0(%esi),%esi
80101818:	83 ec 0c             	sub    $0xc,%esp
8010181b:	68 e0 09 11 80       	push   $0x801109e0
80101820:	e8 5b 2c 00 00       	call   80104480 <acquire>
80101825:	8b 73 08             	mov    0x8(%ebx),%esi
80101828:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010182f:	e8 0c 2d 00 00       	call   80104540 <release>
80101834:	83 c4 10             	add    $0x10,%esp
80101837:	83 fe 01             	cmp    $0x1,%esi
8010183a:	75 aa                	jne    801017e6 <iput+0x26>
8010183c:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
80101842:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101845:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101848:	89 cf                	mov    %ecx,%edi
8010184a:	eb 0b                	jmp    80101857 <iput+0x97>
8010184c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101850:	83 c6 04             	add    $0x4,%esi
80101853:	39 fe                	cmp    %edi,%esi
80101855:	74 19                	je     80101870 <iput+0xb0>
80101857:	8b 16                	mov    (%esi),%edx
80101859:	85 d2                	test   %edx,%edx
8010185b:	74 f3                	je     80101850 <iput+0x90>
8010185d:	8b 03                	mov    (%ebx),%eax
8010185f:	e8 ac fb ff ff       	call   80101410 <bfree>
80101864:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010186a:	eb e4                	jmp    80101850 <iput+0x90>
8010186c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101870:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
80101876:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101879:	85 c0                	test   %eax,%eax
8010187b:	75 33                	jne    801018b0 <iput+0xf0>
8010187d:	83 ec 0c             	sub    $0xc,%esp
80101880:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
80101887:	53                   	push   %ebx
80101888:	e8 53 fd ff ff       	call   801015e0 <iupdate>
8010188d:	31 c0                	xor    %eax,%eax
8010188f:	66 89 43 50          	mov    %ax,0x50(%ebx)
80101893:	89 1c 24             	mov    %ebx,(%esp)
80101896:	e8 45 fd ff ff       	call   801015e0 <iupdate>
8010189b:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
801018a2:	83 c4 10             	add    $0x10,%esp
801018a5:	e9 3c ff ff ff       	jmp    801017e6 <iput+0x26>
801018aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801018b0:	83 ec 08             	sub    $0x8,%esp
801018b3:	50                   	push   %eax
801018b4:	ff 33                	pushl  (%ebx)
801018b6:	e8 15 e8 ff ff       	call   801000d0 <bread>
801018bb:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018c1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801018c7:	8d 70 5c             	lea    0x5c(%eax),%esi
801018ca:	83 c4 10             	add    $0x10,%esp
801018cd:	89 cf                	mov    %ecx,%edi
801018cf:	eb 0e                	jmp    801018df <iput+0x11f>
801018d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018d8:	83 c6 04             	add    $0x4,%esi
801018db:	39 fe                	cmp    %edi,%esi
801018dd:	74 0f                	je     801018ee <iput+0x12e>
801018df:	8b 16                	mov    (%esi),%edx
801018e1:	85 d2                	test   %edx,%edx
801018e3:	74 f3                	je     801018d8 <iput+0x118>
801018e5:	8b 03                	mov    (%ebx),%eax
801018e7:	e8 24 fb ff ff       	call   80101410 <bfree>
801018ec:	eb ea                	jmp    801018d8 <iput+0x118>
801018ee:	83 ec 0c             	sub    $0xc,%esp
801018f1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018f4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018f7:	e8 e4 e8 ff ff       	call   801001e0 <brelse>
801018fc:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
80101902:	8b 03                	mov    (%ebx),%eax
80101904:	e8 07 fb ff ff       	call   80101410 <bfree>
80101909:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
80101910:	00 00 00 
80101913:	83 c4 10             	add    $0x10,%esp
80101916:	e9 62 ff ff ff       	jmp    8010187d <iput+0xbd>
8010191b:	90                   	nop
8010191c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101920 <iunlockput>:
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	53                   	push   %ebx
80101924:	83 ec 10             	sub    $0x10,%esp
80101927:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010192a:	53                   	push   %ebx
8010192b:	e8 40 fe ff ff       	call   80101770 <iunlock>
80101930:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101933:	83 c4 10             	add    $0x10,%esp
80101936:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101939:	c9                   	leave  
8010193a:	e9 81 fe ff ff       	jmp    801017c0 <iput>
8010193f:	90                   	nop

80101940 <stati>:
80101940:	55                   	push   %ebp
80101941:	89 e5                	mov    %esp,%ebp
80101943:	8b 55 08             	mov    0x8(%ebp),%edx
80101946:	8b 45 0c             	mov    0xc(%ebp),%eax
80101949:	8b 0a                	mov    (%edx),%ecx
8010194b:	89 48 04             	mov    %ecx,0x4(%eax)
8010194e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101951:	89 48 08             	mov    %ecx,0x8(%eax)
80101954:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101958:	66 89 08             	mov    %cx,(%eax)
8010195b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010195f:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101963:	8b 52 58             	mov    0x58(%edx),%edx
80101966:	89 50 10             	mov    %edx,0x10(%eax)
80101969:	5d                   	pop    %ebp
8010196a:	c3                   	ret    
8010196b:	90                   	nop
8010196c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101970 <readi>:
80101970:	55                   	push   %ebp
80101971:	89 e5                	mov    %esp,%ebp
80101973:	57                   	push   %edi
80101974:	56                   	push   %esi
80101975:	53                   	push   %ebx
80101976:	83 ec 1c             	sub    $0x1c,%esp
80101979:	8b 45 08             	mov    0x8(%ebp),%eax
8010197c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010197f:	8b 7d 14             	mov    0x14(%ebp),%edi
80101982:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101987:	89 75 e0             	mov    %esi,-0x20(%ebp)
8010198a:	89 45 d8             	mov    %eax,-0x28(%ebp)
8010198d:	8b 75 10             	mov    0x10(%ebp),%esi
80101990:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101993:	0f 84 a7 00 00 00    	je     80101a40 <readi+0xd0>
80101999:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010199c:	8b 40 58             	mov    0x58(%eax),%eax
8010199f:	39 c6                	cmp    %eax,%esi
801019a1:	0f 87 ba 00 00 00    	ja     80101a61 <readi+0xf1>
801019a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801019aa:	89 f9                	mov    %edi,%ecx
801019ac:	01 f1                	add    %esi,%ecx
801019ae:	0f 82 ad 00 00 00    	jb     80101a61 <readi+0xf1>
801019b4:	89 c2                	mov    %eax,%edx
801019b6:	29 f2                	sub    %esi,%edx
801019b8:	39 c8                	cmp    %ecx,%eax
801019ba:	0f 43 d7             	cmovae %edi,%edx
801019bd:	31 ff                	xor    %edi,%edi
801019bf:	85 d2                	test   %edx,%edx
801019c1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801019c4:	74 6c                	je     80101a32 <readi+0xc2>
801019c6:	8d 76 00             	lea    0x0(%esi),%esi
801019c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801019d0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019d3:	89 f2                	mov    %esi,%edx
801019d5:	c1 ea 09             	shr    $0x9,%edx
801019d8:	89 d8                	mov    %ebx,%eax
801019da:	e8 11 f9 ff ff       	call   801012f0 <bmap>
801019df:	83 ec 08             	sub    $0x8,%esp
801019e2:	50                   	push   %eax
801019e3:	ff 33                	pushl  (%ebx)
801019e5:	e8 e6 e6 ff ff       	call   801000d0 <bread>
801019ea:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801019ed:	89 c2                	mov    %eax,%edx
801019ef:	89 f0                	mov    %esi,%eax
801019f1:	25 ff 01 00 00       	and    $0x1ff,%eax
801019f6:	b9 00 02 00 00       	mov    $0x200,%ecx
801019fb:	83 c4 0c             	add    $0xc,%esp
801019fe:	29 c1                	sub    %eax,%ecx
80101a00:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
80101a04:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101a07:	29 fb                	sub    %edi,%ebx
80101a09:	39 d9                	cmp    %ebx,%ecx
80101a0b:	0f 46 d9             	cmovbe %ecx,%ebx
80101a0e:	53                   	push   %ebx
80101a0f:	50                   	push   %eax
80101a10:	01 df                	add    %ebx,%edi
80101a12:	ff 75 e0             	pushl  -0x20(%ebp)
80101a15:	01 de                	add    %ebx,%esi
80101a17:	e8 24 2c 00 00       	call   80104640 <memmove>
80101a1c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a1f:	89 14 24             	mov    %edx,(%esp)
80101a22:	e8 b9 e7 ff ff       	call   801001e0 <brelse>
80101a27:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a2a:	83 c4 10             	add    $0x10,%esp
80101a2d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a30:	77 9e                	ja     801019d0 <readi+0x60>
80101a32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101a35:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a38:	5b                   	pop    %ebx
80101a39:	5e                   	pop    %esi
80101a3a:	5f                   	pop    %edi
80101a3b:	5d                   	pop    %ebp
80101a3c:	c3                   	ret    
80101a3d:	8d 76 00             	lea    0x0(%esi),%esi
80101a40:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a44:	66 83 f8 09          	cmp    $0x9,%ax
80101a48:	77 17                	ja     80101a61 <readi+0xf1>
80101a4a:	8b 04 c5 60 09 11 80 	mov    -0x7feef6a0(,%eax,8),%eax
80101a51:	85 c0                	test   %eax,%eax
80101a53:	74 0c                	je     80101a61 <readi+0xf1>
80101a55:	89 7d 10             	mov    %edi,0x10(%ebp)
80101a58:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a5b:	5b                   	pop    %ebx
80101a5c:	5e                   	pop    %esi
80101a5d:	5f                   	pop    %edi
80101a5e:	5d                   	pop    %ebp
80101a5f:	ff e0                	jmp    *%eax
80101a61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a66:	eb cd                	jmp    80101a35 <readi+0xc5>
80101a68:	90                   	nop
80101a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101a70 <writei>:
80101a70:	55                   	push   %ebp
80101a71:	89 e5                	mov    %esp,%ebp
80101a73:	57                   	push   %edi
80101a74:	56                   	push   %esi
80101a75:	53                   	push   %ebx
80101a76:	83 ec 1c             	sub    $0x1c,%esp
80101a79:	8b 45 08             	mov    0x8(%ebp),%eax
80101a7c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a7f:	8b 7d 14             	mov    0x14(%ebp),%edi
80101a82:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101a87:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a8a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a8d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a90:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a93:	0f 84 b7 00 00 00    	je     80101b50 <writei+0xe0>
80101a99:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a9c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a9f:	0f 82 eb 00 00 00    	jb     80101b90 <writei+0x120>
80101aa5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101aa8:	31 d2                	xor    %edx,%edx
80101aaa:	89 f8                	mov    %edi,%eax
80101aac:	01 f0                	add    %esi,%eax
80101aae:	0f 92 c2             	setb   %dl
80101ab1:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101ab6:	0f 87 d4 00 00 00    	ja     80101b90 <writei+0x120>
80101abc:	85 d2                	test   %edx,%edx
80101abe:	0f 85 cc 00 00 00    	jne    80101b90 <writei+0x120>
80101ac4:	85 ff                	test   %edi,%edi
80101ac6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101acd:	74 72                	je     80101b41 <writei+0xd1>
80101acf:	90                   	nop
80101ad0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101ad3:	89 f2                	mov    %esi,%edx
80101ad5:	c1 ea 09             	shr    $0x9,%edx
80101ad8:	89 f8                	mov    %edi,%eax
80101ada:	e8 11 f8 ff ff       	call   801012f0 <bmap>
80101adf:	83 ec 08             	sub    $0x8,%esp
80101ae2:	50                   	push   %eax
80101ae3:	ff 37                	pushl  (%edi)
80101ae5:	e8 e6 e5 ff ff       	call   801000d0 <bread>
80101aea:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101aed:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
80101af0:	89 c7                	mov    %eax,%edi
80101af2:	89 f0                	mov    %esi,%eax
80101af4:	b9 00 02 00 00       	mov    $0x200,%ecx
80101af9:	83 c4 0c             	add    $0xc,%esp
80101afc:	25 ff 01 00 00       	and    $0x1ff,%eax
80101b01:	29 c1                	sub    %eax,%ecx
80101b03:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
80101b07:	39 d9                	cmp    %ebx,%ecx
80101b09:	0f 46 d9             	cmovbe %ecx,%ebx
80101b0c:	53                   	push   %ebx
80101b0d:	ff 75 dc             	pushl  -0x24(%ebp)
80101b10:	01 de                	add    %ebx,%esi
80101b12:	50                   	push   %eax
80101b13:	e8 28 2b 00 00       	call   80104640 <memmove>
80101b18:	89 3c 24             	mov    %edi,(%esp)
80101b1b:	e8 60 12 00 00       	call   80102d80 <log_write>
80101b20:	89 3c 24             	mov    %edi,(%esp)
80101b23:	e8 b8 e6 ff ff       	call   801001e0 <brelse>
80101b28:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b2b:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b2e:	83 c4 10             	add    $0x10,%esp
80101b31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b34:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101b37:	77 97                	ja     80101ad0 <writei+0x60>
80101b39:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b3c:	3b 70 58             	cmp    0x58(%eax),%esi
80101b3f:	77 37                	ja     80101b78 <writei+0x108>
80101b41:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b44:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b47:	5b                   	pop    %ebx
80101b48:	5e                   	pop    %esi
80101b49:	5f                   	pop    %edi
80101b4a:	5d                   	pop    %ebp
80101b4b:	c3                   	ret    
80101b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b50:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b54:	66 83 f8 09          	cmp    $0x9,%ax
80101b58:	77 36                	ja     80101b90 <writei+0x120>
80101b5a:	8b 04 c5 64 09 11 80 	mov    -0x7feef69c(,%eax,8),%eax
80101b61:	85 c0                	test   %eax,%eax
80101b63:	74 2b                	je     80101b90 <writei+0x120>
80101b65:	89 7d 10             	mov    %edi,0x10(%ebp)
80101b68:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b6b:	5b                   	pop    %ebx
80101b6c:	5e                   	pop    %esi
80101b6d:	5f                   	pop    %edi
80101b6e:	5d                   	pop    %ebp
80101b6f:	ff e0                	jmp    *%eax
80101b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b78:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b7b:	83 ec 0c             	sub    $0xc,%esp
80101b7e:	89 70 58             	mov    %esi,0x58(%eax)
80101b81:	50                   	push   %eax
80101b82:	e8 59 fa ff ff       	call   801015e0 <iupdate>
80101b87:	83 c4 10             	add    $0x10,%esp
80101b8a:	eb b5                	jmp    80101b41 <writei+0xd1>
80101b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b95:	eb ad                	jmp    80101b44 <writei+0xd4>
80101b97:	89 f6                	mov    %esi,%esi
80101b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ba0 <namecmp>:
80101ba0:	55                   	push   %ebp
80101ba1:	89 e5                	mov    %esp,%ebp
80101ba3:	83 ec 0c             	sub    $0xc,%esp
80101ba6:	6a 0e                	push   $0xe
80101ba8:	ff 75 0c             	pushl  0xc(%ebp)
80101bab:	ff 75 08             	pushl  0x8(%ebp)
80101bae:	e8 fd 2a 00 00       	call   801046b0 <strncmp>
80101bb3:	c9                   	leave  
80101bb4:	c3                   	ret    
80101bb5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bc0 <dirlookup>:
80101bc0:	55                   	push   %ebp
80101bc1:	89 e5                	mov    %esp,%ebp
80101bc3:	57                   	push   %edi
80101bc4:	56                   	push   %esi
80101bc5:	53                   	push   %ebx
80101bc6:	83 ec 1c             	sub    $0x1c,%esp
80101bc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101bcc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bd1:	0f 85 85 00 00 00    	jne    80101c5c <dirlookup+0x9c>
80101bd7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bda:	31 ff                	xor    %edi,%edi
80101bdc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bdf:	85 d2                	test   %edx,%edx
80101be1:	74 3e                	je     80101c21 <dirlookup+0x61>
80101be3:	90                   	nop
80101be4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101be8:	6a 10                	push   $0x10
80101bea:	57                   	push   %edi
80101beb:	56                   	push   %esi
80101bec:	53                   	push   %ebx
80101bed:	e8 7e fd ff ff       	call   80101970 <readi>
80101bf2:	83 c4 10             	add    $0x10,%esp
80101bf5:	83 f8 10             	cmp    $0x10,%eax
80101bf8:	75 55                	jne    80101c4f <dirlookup+0x8f>
80101bfa:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bff:	74 18                	je     80101c19 <dirlookup+0x59>
80101c01:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c04:	83 ec 04             	sub    $0x4,%esp
80101c07:	6a 0e                	push   $0xe
80101c09:	50                   	push   %eax
80101c0a:	ff 75 0c             	pushl  0xc(%ebp)
80101c0d:	e8 9e 2a 00 00       	call   801046b0 <strncmp>
80101c12:	83 c4 10             	add    $0x10,%esp
80101c15:	85 c0                	test   %eax,%eax
80101c17:	74 17                	je     80101c30 <dirlookup+0x70>
80101c19:	83 c7 10             	add    $0x10,%edi
80101c1c:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101c1f:	72 c7                	jb     80101be8 <dirlookup+0x28>
80101c21:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c24:	31 c0                	xor    %eax,%eax
80101c26:	5b                   	pop    %ebx
80101c27:	5e                   	pop    %esi
80101c28:	5f                   	pop    %edi
80101c29:	5d                   	pop    %ebp
80101c2a:	c3                   	ret    
80101c2b:	90                   	nop
80101c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c30:	8b 45 10             	mov    0x10(%ebp),%eax
80101c33:	85 c0                	test   %eax,%eax
80101c35:	74 05                	je     80101c3c <dirlookup+0x7c>
80101c37:	8b 45 10             	mov    0x10(%ebp),%eax
80101c3a:	89 38                	mov    %edi,(%eax)
80101c3c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c40:	8b 03                	mov    (%ebx),%eax
80101c42:	e8 d9 f5 ff ff       	call   80101220 <iget>
80101c47:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c4a:	5b                   	pop    %ebx
80101c4b:	5e                   	pop    %esi
80101c4c:	5f                   	pop    %edi
80101c4d:	5d                   	pop    %ebp
80101c4e:	c3                   	ret    
80101c4f:	83 ec 0c             	sub    $0xc,%esp
80101c52:	68 59 72 10 80       	push   $0x80107259
80101c57:	e8 34 e7 ff ff       	call   80100390 <panic>
80101c5c:	83 ec 0c             	sub    $0xc,%esp
80101c5f:	68 47 72 10 80       	push   $0x80107247
80101c64:	e8 27 e7 ff ff       	call   80100390 <panic>
80101c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101c70 <namex>:
80101c70:	55                   	push   %ebp
80101c71:	89 e5                	mov    %esp,%ebp
80101c73:	57                   	push   %edi
80101c74:	56                   	push   %esi
80101c75:	53                   	push   %ebx
80101c76:	89 cf                	mov    %ecx,%edi
80101c78:	89 c3                	mov    %eax,%ebx
80101c7a:	83 ec 1c             	sub    $0x1c,%esp
80101c7d:	80 38 2f             	cmpb   $0x2f,(%eax)
80101c80:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101c83:	0f 84 67 01 00 00    	je     80101df0 <namex+0x180>
80101c89:	e8 52 1b 00 00       	call   801037e0 <myproc>
80101c8e:	83 ec 0c             	sub    $0xc,%esp
80101c91:	8b 70 68             	mov    0x68(%eax),%esi
80101c94:	68 e0 09 11 80       	push   $0x801109e0
80101c99:	e8 e2 27 00 00       	call   80104480 <acquire>
80101c9e:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101ca2:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101ca9:	e8 92 28 00 00       	call   80104540 <release>
80101cae:	83 c4 10             	add    $0x10,%esp
80101cb1:	eb 08                	jmp    80101cbb <namex+0x4b>
80101cb3:	90                   	nop
80101cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101cb8:	83 c3 01             	add    $0x1,%ebx
80101cbb:	0f b6 03             	movzbl (%ebx),%eax
80101cbe:	3c 2f                	cmp    $0x2f,%al
80101cc0:	74 f6                	je     80101cb8 <namex+0x48>
80101cc2:	84 c0                	test   %al,%al
80101cc4:	0f 84 ee 00 00 00    	je     80101db8 <namex+0x148>
80101cca:	0f b6 03             	movzbl (%ebx),%eax
80101ccd:	3c 2f                	cmp    $0x2f,%al
80101ccf:	0f 84 b3 00 00 00    	je     80101d88 <namex+0x118>
80101cd5:	84 c0                	test   %al,%al
80101cd7:	89 da                	mov    %ebx,%edx
80101cd9:	75 09                	jne    80101ce4 <namex+0x74>
80101cdb:	e9 a8 00 00 00       	jmp    80101d88 <namex+0x118>
80101ce0:	84 c0                	test   %al,%al
80101ce2:	74 0a                	je     80101cee <namex+0x7e>
80101ce4:	83 c2 01             	add    $0x1,%edx
80101ce7:	0f b6 02             	movzbl (%edx),%eax
80101cea:	3c 2f                	cmp    $0x2f,%al
80101cec:	75 f2                	jne    80101ce0 <namex+0x70>
80101cee:	89 d1                	mov    %edx,%ecx
80101cf0:	29 d9                	sub    %ebx,%ecx
80101cf2:	83 f9 0d             	cmp    $0xd,%ecx
80101cf5:	0f 8e 91 00 00 00    	jle    80101d8c <namex+0x11c>
80101cfb:	83 ec 04             	sub    $0x4,%esp
80101cfe:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d01:	6a 0e                	push   $0xe
80101d03:	53                   	push   %ebx
80101d04:	57                   	push   %edi
80101d05:	e8 36 29 00 00       	call   80104640 <memmove>
80101d0a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d0d:	83 c4 10             	add    $0x10,%esp
80101d10:	89 d3                	mov    %edx,%ebx
80101d12:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d15:	75 11                	jne    80101d28 <namex+0xb8>
80101d17:	89 f6                	mov    %esi,%esi
80101d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101d20:	83 c3 01             	add    $0x1,%ebx
80101d23:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d26:	74 f8                	je     80101d20 <namex+0xb0>
80101d28:	83 ec 0c             	sub    $0xc,%esp
80101d2b:	56                   	push   %esi
80101d2c:	e8 5f f9 ff ff       	call   80101690 <ilock>
80101d31:	83 c4 10             	add    $0x10,%esp
80101d34:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d39:	0f 85 91 00 00 00    	jne    80101dd0 <namex+0x160>
80101d3f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d42:	85 d2                	test   %edx,%edx
80101d44:	74 09                	je     80101d4f <namex+0xdf>
80101d46:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d49:	0f 84 b7 00 00 00    	je     80101e06 <namex+0x196>
80101d4f:	83 ec 04             	sub    $0x4,%esp
80101d52:	6a 00                	push   $0x0
80101d54:	57                   	push   %edi
80101d55:	56                   	push   %esi
80101d56:	e8 65 fe ff ff       	call   80101bc0 <dirlookup>
80101d5b:	83 c4 10             	add    $0x10,%esp
80101d5e:	85 c0                	test   %eax,%eax
80101d60:	74 6e                	je     80101dd0 <namex+0x160>
80101d62:	83 ec 0c             	sub    $0xc,%esp
80101d65:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d68:	56                   	push   %esi
80101d69:	e8 02 fa ff ff       	call   80101770 <iunlock>
80101d6e:	89 34 24             	mov    %esi,(%esp)
80101d71:	e8 4a fa ff ff       	call   801017c0 <iput>
80101d76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d79:	83 c4 10             	add    $0x10,%esp
80101d7c:	89 c6                	mov    %eax,%esi
80101d7e:	e9 38 ff ff ff       	jmp    80101cbb <namex+0x4b>
80101d83:	90                   	nop
80101d84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d88:	89 da                	mov    %ebx,%edx
80101d8a:	31 c9                	xor    %ecx,%ecx
80101d8c:	83 ec 04             	sub    $0x4,%esp
80101d8f:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d92:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d95:	51                   	push   %ecx
80101d96:	53                   	push   %ebx
80101d97:	57                   	push   %edi
80101d98:	e8 a3 28 00 00       	call   80104640 <memmove>
80101d9d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101da0:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101da3:	83 c4 10             	add    $0x10,%esp
80101da6:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101daa:	89 d3                	mov    %edx,%ebx
80101dac:	e9 61 ff ff ff       	jmp    80101d12 <namex+0xa2>
80101db1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101db8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101dbb:	85 c0                	test   %eax,%eax
80101dbd:	75 5d                	jne    80101e1c <namex+0x1ac>
80101dbf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101dc2:	89 f0                	mov    %esi,%eax
80101dc4:	5b                   	pop    %ebx
80101dc5:	5e                   	pop    %esi
80101dc6:	5f                   	pop    %edi
80101dc7:	5d                   	pop    %ebp
80101dc8:	c3                   	ret    
80101dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101dd0:	83 ec 0c             	sub    $0xc,%esp
80101dd3:	56                   	push   %esi
80101dd4:	e8 97 f9 ff ff       	call   80101770 <iunlock>
80101dd9:	89 34 24             	mov    %esi,(%esp)
80101ddc:	31 f6                	xor    %esi,%esi
80101dde:	e8 dd f9 ff ff       	call   801017c0 <iput>
80101de3:	83 c4 10             	add    $0x10,%esp
80101de6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101de9:	89 f0                	mov    %esi,%eax
80101deb:	5b                   	pop    %ebx
80101dec:	5e                   	pop    %esi
80101ded:	5f                   	pop    %edi
80101dee:	5d                   	pop    %ebp
80101def:	c3                   	ret    
80101df0:	ba 01 00 00 00       	mov    $0x1,%edx
80101df5:	b8 01 00 00 00       	mov    $0x1,%eax
80101dfa:	e8 21 f4 ff ff       	call   80101220 <iget>
80101dff:	89 c6                	mov    %eax,%esi
80101e01:	e9 b5 fe ff ff       	jmp    80101cbb <namex+0x4b>
80101e06:	83 ec 0c             	sub    $0xc,%esp
80101e09:	56                   	push   %esi
80101e0a:	e8 61 f9 ff ff       	call   80101770 <iunlock>
80101e0f:	83 c4 10             	add    $0x10,%esp
80101e12:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e15:	89 f0                	mov    %esi,%eax
80101e17:	5b                   	pop    %ebx
80101e18:	5e                   	pop    %esi
80101e19:	5f                   	pop    %edi
80101e1a:	5d                   	pop    %ebp
80101e1b:	c3                   	ret    
80101e1c:	83 ec 0c             	sub    $0xc,%esp
80101e1f:	56                   	push   %esi
80101e20:	31 f6                	xor    %esi,%esi
80101e22:	e8 99 f9 ff ff       	call   801017c0 <iput>
80101e27:	83 c4 10             	add    $0x10,%esp
80101e2a:	eb 93                	jmp    80101dbf <namex+0x14f>
80101e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101e30 <dirlink>:
80101e30:	55                   	push   %ebp
80101e31:	89 e5                	mov    %esp,%ebp
80101e33:	57                   	push   %edi
80101e34:	56                   	push   %esi
80101e35:	53                   	push   %ebx
80101e36:	83 ec 20             	sub    $0x20,%esp
80101e39:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101e3c:	6a 00                	push   $0x0
80101e3e:	ff 75 0c             	pushl  0xc(%ebp)
80101e41:	53                   	push   %ebx
80101e42:	e8 79 fd ff ff       	call   80101bc0 <dirlookup>
80101e47:	83 c4 10             	add    $0x10,%esp
80101e4a:	85 c0                	test   %eax,%eax
80101e4c:	75 67                	jne    80101eb5 <dirlink+0x85>
80101e4e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e51:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e54:	85 ff                	test   %edi,%edi
80101e56:	74 29                	je     80101e81 <dirlink+0x51>
80101e58:	31 ff                	xor    %edi,%edi
80101e5a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e5d:	eb 09                	jmp    80101e68 <dirlink+0x38>
80101e5f:	90                   	nop
80101e60:	83 c7 10             	add    $0x10,%edi
80101e63:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101e66:	73 19                	jae    80101e81 <dirlink+0x51>
80101e68:	6a 10                	push   $0x10
80101e6a:	57                   	push   %edi
80101e6b:	56                   	push   %esi
80101e6c:	53                   	push   %ebx
80101e6d:	e8 fe fa ff ff       	call   80101970 <readi>
80101e72:	83 c4 10             	add    $0x10,%esp
80101e75:	83 f8 10             	cmp    $0x10,%eax
80101e78:	75 4e                	jne    80101ec8 <dirlink+0x98>
80101e7a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e7f:	75 df                	jne    80101e60 <dirlink+0x30>
80101e81:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e84:	83 ec 04             	sub    $0x4,%esp
80101e87:	6a 0e                	push   $0xe
80101e89:	ff 75 0c             	pushl  0xc(%ebp)
80101e8c:	50                   	push   %eax
80101e8d:	e8 7e 28 00 00       	call   80104710 <strncpy>
80101e92:	8b 45 10             	mov    0x10(%ebp),%eax
80101e95:	6a 10                	push   $0x10
80101e97:	57                   	push   %edi
80101e98:	56                   	push   %esi
80101e99:	53                   	push   %ebx
80101e9a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101e9e:	e8 cd fb ff ff       	call   80101a70 <writei>
80101ea3:	83 c4 20             	add    $0x20,%esp
80101ea6:	83 f8 10             	cmp    $0x10,%eax
80101ea9:	75 2a                	jne    80101ed5 <dirlink+0xa5>
80101eab:	31 c0                	xor    %eax,%eax
80101ead:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101eb0:	5b                   	pop    %ebx
80101eb1:	5e                   	pop    %esi
80101eb2:	5f                   	pop    %edi
80101eb3:	5d                   	pop    %ebp
80101eb4:	c3                   	ret    
80101eb5:	83 ec 0c             	sub    $0xc,%esp
80101eb8:	50                   	push   %eax
80101eb9:	e8 02 f9 ff ff       	call   801017c0 <iput>
80101ebe:	83 c4 10             	add    $0x10,%esp
80101ec1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ec6:	eb e5                	jmp    80101ead <dirlink+0x7d>
80101ec8:	83 ec 0c             	sub    $0xc,%esp
80101ecb:	68 68 72 10 80       	push   $0x80107268
80101ed0:	e8 bb e4 ff ff       	call   80100390 <panic>
80101ed5:	83 ec 0c             	sub    $0xc,%esp
80101ed8:	68 c2 78 10 80       	push   $0x801078c2
80101edd:	e8 ae e4 ff ff       	call   80100390 <panic>
80101ee2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ef0 <namei>:
80101ef0:	55                   	push   %ebp
80101ef1:	31 d2                	xor    %edx,%edx
80101ef3:	89 e5                	mov    %esp,%ebp
80101ef5:	83 ec 18             	sub    $0x18,%esp
80101ef8:	8b 45 08             	mov    0x8(%ebp),%eax
80101efb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101efe:	e8 6d fd ff ff       	call   80101c70 <namex>
80101f03:	c9                   	leave  
80101f04:	c3                   	ret    
80101f05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f10 <nameiparent>:
80101f10:	55                   	push   %ebp
80101f11:	ba 01 00 00 00       	mov    $0x1,%edx
80101f16:	89 e5                	mov    %esp,%ebp
80101f18:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f1b:	8b 45 08             	mov    0x8(%ebp),%eax
80101f1e:	5d                   	pop    %ebp
80101f1f:	e9 4c fd ff ff       	jmp    80101c70 <namex>
80101f24:	66 90                	xchg   %ax,%ax
80101f26:	66 90                	xchg   %ax,%ax
80101f28:	66 90                	xchg   %ax,%ax
80101f2a:	66 90                	xchg   %ax,%ax
80101f2c:	66 90                	xchg   %ax,%ax
80101f2e:	66 90                	xchg   %ax,%ax

80101f30 <idestart>:
80101f30:	55                   	push   %ebp
80101f31:	89 e5                	mov    %esp,%ebp
80101f33:	57                   	push   %edi
80101f34:	56                   	push   %esi
80101f35:	53                   	push   %ebx
80101f36:	83 ec 0c             	sub    $0xc,%esp
80101f39:	85 c0                	test   %eax,%eax
80101f3b:	0f 84 b4 00 00 00    	je     80101ff5 <idestart+0xc5>
80101f41:	8b 58 08             	mov    0x8(%eax),%ebx
80101f44:	89 c6                	mov    %eax,%esi
80101f46:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f4c:	0f 87 96 00 00 00    	ja     80101fe8 <idestart+0xb8>
80101f52:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80101f57:	89 f6                	mov    %esi,%esi
80101f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101f60:	89 ca                	mov    %ecx,%edx
80101f62:	ec                   	in     (%dx),%al
80101f63:	83 e0 c0             	and    $0xffffffc0,%eax
80101f66:	3c 40                	cmp    $0x40,%al
80101f68:	75 f6                	jne    80101f60 <idestart+0x30>
80101f6a:	31 ff                	xor    %edi,%edi
80101f6c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f71:	89 f8                	mov    %edi,%eax
80101f73:	ee                   	out    %al,(%dx)
80101f74:	b8 01 00 00 00       	mov    $0x1,%eax
80101f79:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f7e:	ee                   	out    %al,(%dx)
80101f7f:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f84:	89 d8                	mov    %ebx,%eax
80101f86:	ee                   	out    %al,(%dx)
80101f87:	89 d8                	mov    %ebx,%eax
80101f89:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f8e:	c1 f8 08             	sar    $0x8,%eax
80101f91:	ee                   	out    %al,(%dx)
80101f92:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f97:	89 f8                	mov    %edi,%eax
80101f99:	ee                   	out    %al,(%dx)
80101f9a:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101f9e:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fa3:	c1 e0 04             	shl    $0x4,%eax
80101fa6:	83 e0 10             	and    $0x10,%eax
80101fa9:	83 c8 e0             	or     $0xffffffe0,%eax
80101fac:	ee                   	out    %al,(%dx)
80101fad:	f6 06 04             	testb  $0x4,(%esi)
80101fb0:	75 16                	jne    80101fc8 <idestart+0x98>
80101fb2:	b8 20 00 00 00       	mov    $0x20,%eax
80101fb7:	89 ca                	mov    %ecx,%edx
80101fb9:	ee                   	out    %al,(%dx)
80101fba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fbd:	5b                   	pop    %ebx
80101fbe:	5e                   	pop    %esi
80101fbf:	5f                   	pop    %edi
80101fc0:	5d                   	pop    %ebp
80101fc1:	c3                   	ret    
80101fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101fc8:	b8 30 00 00 00       	mov    $0x30,%eax
80101fcd:	89 ca                	mov    %ecx,%edx
80101fcf:	ee                   	out    %al,(%dx)
80101fd0:	b9 80 00 00 00       	mov    $0x80,%ecx
80101fd5:	83 c6 5c             	add    $0x5c,%esi
80101fd8:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101fdd:	fc                   	cld    
80101fde:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101fe0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fe3:	5b                   	pop    %ebx
80101fe4:	5e                   	pop    %esi
80101fe5:	5f                   	pop    %edi
80101fe6:	5d                   	pop    %ebp
80101fe7:	c3                   	ret    
80101fe8:	83 ec 0c             	sub    $0xc,%esp
80101feb:	68 d4 72 10 80       	push   $0x801072d4
80101ff0:	e8 9b e3 ff ff       	call   80100390 <panic>
80101ff5:	83 ec 0c             	sub    $0xc,%esp
80101ff8:	68 cb 72 10 80       	push   $0x801072cb
80101ffd:	e8 8e e3 ff ff       	call   80100390 <panic>
80102002:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102010 <ideinit>:
80102010:	55                   	push   %ebp
80102011:	89 e5                	mov    %esp,%ebp
80102013:	83 ec 10             	sub    $0x10,%esp
80102016:	68 e6 72 10 80       	push   $0x801072e6
8010201b:	68 80 a5 10 80       	push   $0x8010a580
80102020:	e8 1b 23 00 00       	call   80104340 <initlock>
80102025:	58                   	pop    %eax
80102026:	a1 00 2d 11 80       	mov    0x80112d00,%eax
8010202b:	5a                   	pop    %edx
8010202c:	83 e8 01             	sub    $0x1,%eax
8010202f:	50                   	push   %eax
80102030:	6a 0e                	push   $0xe
80102032:	e8 a9 02 00 00       	call   801022e0 <ioapicenable>
80102037:	83 c4 10             	add    $0x10,%esp
8010203a:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010203f:	90                   	nop
80102040:	ec                   	in     (%dx),%al
80102041:	83 e0 c0             	and    $0xffffffc0,%eax
80102044:	3c 40                	cmp    $0x40,%al
80102046:	75 f8                	jne    80102040 <ideinit+0x30>
80102048:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010204d:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102052:	ee                   	out    %al,(%dx)
80102053:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80102058:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010205d:	eb 06                	jmp    80102065 <ideinit+0x55>
8010205f:	90                   	nop
80102060:	83 e9 01             	sub    $0x1,%ecx
80102063:	74 0f                	je     80102074 <ideinit+0x64>
80102065:	ec                   	in     (%dx),%al
80102066:	84 c0                	test   %al,%al
80102068:	74 f6                	je     80102060 <ideinit+0x50>
8010206a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102071:	00 00 00 
80102074:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102079:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010207e:	ee                   	out    %al,(%dx)
8010207f:	c9                   	leave  
80102080:	c3                   	ret    
80102081:	eb 0d                	jmp    80102090 <ideintr>
80102083:	90                   	nop
80102084:	90                   	nop
80102085:	90                   	nop
80102086:	90                   	nop
80102087:	90                   	nop
80102088:	90                   	nop
80102089:	90                   	nop
8010208a:	90                   	nop
8010208b:	90                   	nop
8010208c:	90                   	nop
8010208d:	90                   	nop
8010208e:	90                   	nop
8010208f:	90                   	nop

80102090 <ideintr>:
80102090:	55                   	push   %ebp
80102091:	89 e5                	mov    %esp,%ebp
80102093:	57                   	push   %edi
80102094:	56                   	push   %esi
80102095:	53                   	push   %ebx
80102096:	83 ec 18             	sub    $0x18,%esp
80102099:	68 80 a5 10 80       	push   $0x8010a580
8010209e:	e8 dd 23 00 00       	call   80104480 <acquire>
801020a3:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
801020a9:	83 c4 10             	add    $0x10,%esp
801020ac:	85 db                	test   %ebx,%ebx
801020ae:	74 67                	je     80102117 <ideintr+0x87>
801020b0:	8b 43 58             	mov    0x58(%ebx),%eax
801020b3:	a3 64 a5 10 80       	mov    %eax,0x8010a564
801020b8:	8b 3b                	mov    (%ebx),%edi
801020ba:	f7 c7 04 00 00 00    	test   $0x4,%edi
801020c0:	75 31                	jne    801020f3 <ideintr+0x63>
801020c2:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020c7:	89 f6                	mov    %esi,%esi
801020c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801020d0:	ec                   	in     (%dx),%al
801020d1:	89 c6                	mov    %eax,%esi
801020d3:	83 e6 c0             	and    $0xffffffc0,%esi
801020d6:	89 f1                	mov    %esi,%ecx
801020d8:	80 f9 40             	cmp    $0x40,%cl
801020db:	75 f3                	jne    801020d0 <ideintr+0x40>
801020dd:	a8 21                	test   $0x21,%al
801020df:	75 12                	jne    801020f3 <ideintr+0x63>
801020e1:	8d 7b 5c             	lea    0x5c(%ebx),%edi
801020e4:	b9 80 00 00 00       	mov    $0x80,%ecx
801020e9:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020ee:	fc                   	cld    
801020ef:	f3 6d                	rep insl (%dx),%es:(%edi)
801020f1:	8b 3b                	mov    (%ebx),%edi
801020f3:	83 e7 fb             	and    $0xfffffffb,%edi
801020f6:	83 ec 0c             	sub    $0xc,%esp
801020f9:	89 f9                	mov    %edi,%ecx
801020fb:	83 c9 02             	or     $0x2,%ecx
801020fe:	89 0b                	mov    %ecx,(%ebx)
80102100:	53                   	push   %ebx
80102101:	e8 3a 1e 00 00       	call   80103f40 <wakeup>
80102106:	a1 64 a5 10 80       	mov    0x8010a564,%eax
8010210b:	83 c4 10             	add    $0x10,%esp
8010210e:	85 c0                	test   %eax,%eax
80102110:	74 05                	je     80102117 <ideintr+0x87>
80102112:	e8 19 fe ff ff       	call   80101f30 <idestart>
80102117:	83 ec 0c             	sub    $0xc,%esp
8010211a:	68 80 a5 10 80       	push   $0x8010a580
8010211f:	e8 1c 24 00 00       	call   80104540 <release>
80102124:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102127:	5b                   	pop    %ebx
80102128:	5e                   	pop    %esi
80102129:	5f                   	pop    %edi
8010212a:	5d                   	pop    %ebp
8010212b:	c3                   	ret    
8010212c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102130 <iderw>:
80102130:	55                   	push   %ebp
80102131:	89 e5                	mov    %esp,%ebp
80102133:	53                   	push   %ebx
80102134:	83 ec 10             	sub    $0x10,%esp
80102137:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010213a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010213d:	50                   	push   %eax
8010213e:	e8 ad 21 00 00       	call   801042f0 <holdingsleep>
80102143:	83 c4 10             	add    $0x10,%esp
80102146:	85 c0                	test   %eax,%eax
80102148:	0f 84 c6 00 00 00    	je     80102214 <iderw+0xe4>
8010214e:	8b 03                	mov    (%ebx),%eax
80102150:	83 e0 06             	and    $0x6,%eax
80102153:	83 f8 02             	cmp    $0x2,%eax
80102156:	0f 84 ab 00 00 00    	je     80102207 <iderw+0xd7>
8010215c:	8b 53 04             	mov    0x4(%ebx),%edx
8010215f:	85 d2                	test   %edx,%edx
80102161:	74 0d                	je     80102170 <iderw+0x40>
80102163:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102168:	85 c0                	test   %eax,%eax
8010216a:	0f 84 b1 00 00 00    	je     80102221 <iderw+0xf1>
80102170:	83 ec 0c             	sub    $0xc,%esp
80102173:	68 80 a5 10 80       	push   $0x8010a580
80102178:	e8 03 23 00 00       	call   80104480 <acquire>
8010217d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102183:	83 c4 10             	add    $0x10,%esp
80102186:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
8010218d:	85 d2                	test   %edx,%edx
8010218f:	75 09                	jne    8010219a <iderw+0x6a>
80102191:	eb 6d                	jmp    80102200 <iderw+0xd0>
80102193:	90                   	nop
80102194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102198:	89 c2                	mov    %eax,%edx
8010219a:	8b 42 58             	mov    0x58(%edx),%eax
8010219d:	85 c0                	test   %eax,%eax
8010219f:	75 f7                	jne    80102198 <iderw+0x68>
801021a1:	83 c2 58             	add    $0x58,%edx
801021a4:	89 1a                	mov    %ebx,(%edx)
801021a6:	39 1d 64 a5 10 80    	cmp    %ebx,0x8010a564
801021ac:	74 42                	je     801021f0 <iderw+0xc0>
801021ae:	8b 03                	mov    (%ebx),%eax
801021b0:	83 e0 06             	and    $0x6,%eax
801021b3:	83 f8 02             	cmp    $0x2,%eax
801021b6:	74 23                	je     801021db <iderw+0xab>
801021b8:	90                   	nop
801021b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801021c0:	83 ec 08             	sub    $0x8,%esp
801021c3:	68 80 a5 10 80       	push   $0x8010a580
801021c8:	53                   	push   %ebx
801021c9:	e8 c2 1b 00 00       	call   80103d90 <sleep>
801021ce:	8b 03                	mov    (%ebx),%eax
801021d0:	83 c4 10             	add    $0x10,%esp
801021d3:	83 e0 06             	and    $0x6,%eax
801021d6:	83 f8 02             	cmp    $0x2,%eax
801021d9:	75 e5                	jne    801021c0 <iderw+0x90>
801021db:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
801021e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021e5:	c9                   	leave  
801021e6:	e9 55 23 00 00       	jmp    80104540 <release>
801021eb:	90                   	nop
801021ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801021f0:	89 d8                	mov    %ebx,%eax
801021f2:	e8 39 fd ff ff       	call   80101f30 <idestart>
801021f7:	eb b5                	jmp    801021ae <iderw+0x7e>
801021f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102200:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
80102205:	eb 9d                	jmp    801021a4 <iderw+0x74>
80102207:	83 ec 0c             	sub    $0xc,%esp
8010220a:	68 00 73 10 80       	push   $0x80107300
8010220f:	e8 7c e1 ff ff       	call   80100390 <panic>
80102214:	83 ec 0c             	sub    $0xc,%esp
80102217:	68 ea 72 10 80       	push   $0x801072ea
8010221c:	e8 6f e1 ff ff       	call   80100390 <panic>
80102221:	83 ec 0c             	sub    $0xc,%esp
80102224:	68 15 73 10 80       	push   $0x80107315
80102229:	e8 62 e1 ff ff       	call   80100390 <panic>
8010222e:	66 90                	xchg   %ax,%ax

80102230 <ioapicinit>:
80102230:	55                   	push   %ebp
80102231:	c7 05 34 26 11 80 00 	movl   $0xfec00000,0x80112634
80102238:	00 c0 fe 
8010223b:	89 e5                	mov    %esp,%ebp
8010223d:	56                   	push   %esi
8010223e:	53                   	push   %ebx
8010223f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102246:	00 00 00 
80102249:	a1 34 26 11 80       	mov    0x80112634,%eax
8010224e:	8b 58 10             	mov    0x10(%eax),%ebx
80102251:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80102257:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
8010225d:	0f b6 15 60 27 11 80 	movzbl 0x80112760,%edx
80102264:	c1 eb 10             	shr    $0x10,%ebx
80102267:	8b 41 10             	mov    0x10(%ecx),%eax
8010226a:	0f b6 db             	movzbl %bl,%ebx
8010226d:	c1 e8 18             	shr    $0x18,%eax
80102270:	39 c2                	cmp    %eax,%edx
80102272:	74 16                	je     8010228a <ioapicinit+0x5a>
80102274:	83 ec 0c             	sub    $0xc,%esp
80102277:	68 34 73 10 80       	push   $0x80107334
8010227c:	e8 df e3 ff ff       	call   80100660 <cprintf>
80102281:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
80102287:	83 c4 10             	add    $0x10,%esp
8010228a:	83 c3 21             	add    $0x21,%ebx
8010228d:	ba 10 00 00 00       	mov    $0x10,%edx
80102292:	b8 20 00 00 00       	mov    $0x20,%eax
80102297:	89 f6                	mov    %esi,%esi
80102299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801022a0:	89 11                	mov    %edx,(%ecx)
801022a2:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801022a8:	89 c6                	mov    %eax,%esi
801022aa:	81 ce 00 00 01 00    	or     $0x10000,%esi
801022b0:	83 c0 01             	add    $0x1,%eax
801022b3:	89 71 10             	mov    %esi,0x10(%ecx)
801022b6:	8d 72 01             	lea    0x1(%edx),%esi
801022b9:	83 c2 02             	add    $0x2,%edx
801022bc:	39 d8                	cmp    %ebx,%eax
801022be:	89 31                	mov    %esi,(%ecx)
801022c0:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801022c6:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
801022cd:	75 d1                	jne    801022a0 <ioapicinit+0x70>
801022cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801022d2:	5b                   	pop    %ebx
801022d3:	5e                   	pop    %esi
801022d4:	5d                   	pop    %ebp
801022d5:	c3                   	ret    
801022d6:	8d 76 00             	lea    0x0(%esi),%esi
801022d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022e0 <ioapicenable>:
801022e0:	55                   	push   %ebp
801022e1:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801022e7:	89 e5                	mov    %esp,%ebp
801022e9:	8b 45 08             	mov    0x8(%ebp),%eax
801022ec:	8d 50 20             	lea    0x20(%eax),%edx
801022ef:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
801022f3:	89 01                	mov    %eax,(%ecx)
801022f5:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801022fb:	83 c0 01             	add    $0x1,%eax
801022fe:	89 51 10             	mov    %edx,0x10(%ecx)
80102301:	8b 55 0c             	mov    0xc(%ebp),%edx
80102304:	89 01                	mov    %eax,(%ecx)
80102306:	a1 34 26 11 80       	mov    0x80112634,%eax
8010230b:	c1 e2 18             	shl    $0x18,%edx
8010230e:	89 50 10             	mov    %edx,0x10(%eax)
80102311:	5d                   	pop    %ebp
80102312:	c3                   	ret    
80102313:	66 90                	xchg   %ax,%ax
80102315:	66 90                	xchg   %ax,%ax
80102317:	66 90                	xchg   %ax,%ax
80102319:	66 90                	xchg   %ax,%ax
8010231b:	66 90                	xchg   %ax,%ax
8010231d:	66 90                	xchg   %ax,%ax
8010231f:	90                   	nop

80102320 <kfree>:
80102320:	55                   	push   %ebp
80102321:	89 e5                	mov    %esp,%ebp
80102323:	53                   	push   %ebx
80102324:	83 ec 04             	sub    $0x4,%esp
80102327:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010232a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102330:	75 70                	jne    801023a2 <kfree+0x82>
80102332:	81 fb a8 54 11 80    	cmp    $0x801154a8,%ebx
80102338:	72 68                	jb     801023a2 <kfree+0x82>
8010233a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102340:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102345:	77 5b                	ja     801023a2 <kfree+0x82>
80102347:	83 ec 04             	sub    $0x4,%esp
8010234a:	68 00 10 00 00       	push   $0x1000
8010234f:	6a 01                	push   $0x1
80102351:	53                   	push   %ebx
80102352:	e8 39 22 00 00       	call   80104590 <memset>
80102357:	8b 15 74 26 11 80    	mov    0x80112674,%edx
8010235d:	83 c4 10             	add    $0x10,%esp
80102360:	85 d2                	test   %edx,%edx
80102362:	75 2c                	jne    80102390 <kfree+0x70>
80102364:	a1 78 26 11 80       	mov    0x80112678,%eax
80102369:	89 03                	mov    %eax,(%ebx)
8010236b:	a1 74 26 11 80       	mov    0x80112674,%eax
80102370:	89 1d 78 26 11 80    	mov    %ebx,0x80112678
80102376:	85 c0                	test   %eax,%eax
80102378:	75 06                	jne    80102380 <kfree+0x60>
8010237a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010237d:	c9                   	leave  
8010237e:	c3                   	ret    
8010237f:	90                   	nop
80102380:	c7 45 08 40 26 11 80 	movl   $0x80112640,0x8(%ebp)
80102387:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010238a:	c9                   	leave  
8010238b:	e9 b0 21 00 00       	jmp    80104540 <release>
80102390:	83 ec 0c             	sub    $0xc,%esp
80102393:	68 40 26 11 80       	push   $0x80112640
80102398:	e8 e3 20 00 00       	call   80104480 <acquire>
8010239d:	83 c4 10             	add    $0x10,%esp
801023a0:	eb c2                	jmp    80102364 <kfree+0x44>
801023a2:	83 ec 0c             	sub    $0xc,%esp
801023a5:	68 66 73 10 80       	push   $0x80107366
801023aa:	e8 e1 df ff ff       	call   80100390 <panic>
801023af:	90                   	nop

801023b0 <freerange>:
801023b0:	55                   	push   %ebp
801023b1:	89 e5                	mov    %esp,%ebp
801023b3:	56                   	push   %esi
801023b4:	53                   	push   %ebx
801023b5:	8b 45 08             	mov    0x8(%ebp),%eax
801023b8:	8b 75 0c             	mov    0xc(%ebp),%esi
801023bb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023c1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023c7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023cd:	39 de                	cmp    %ebx,%esi
801023cf:	72 23                	jb     801023f4 <freerange+0x44>
801023d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801023d8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023de:	83 ec 0c             	sub    $0xc,%esp
801023e1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023e7:	50                   	push   %eax
801023e8:	e8 33 ff ff ff       	call   80102320 <kfree>
801023ed:	83 c4 10             	add    $0x10,%esp
801023f0:	39 f3                	cmp    %esi,%ebx
801023f2:	76 e4                	jbe    801023d8 <freerange+0x28>
801023f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023f7:	5b                   	pop    %ebx
801023f8:	5e                   	pop    %esi
801023f9:	5d                   	pop    %ebp
801023fa:	c3                   	ret    
801023fb:	90                   	nop
801023fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102400 <kinit1>:
80102400:	55                   	push   %ebp
80102401:	89 e5                	mov    %esp,%ebp
80102403:	56                   	push   %esi
80102404:	53                   	push   %ebx
80102405:	8b 75 0c             	mov    0xc(%ebp),%esi
80102408:	83 ec 08             	sub    $0x8,%esp
8010240b:	68 6c 73 10 80       	push   $0x8010736c
80102410:	68 40 26 11 80       	push   $0x80112640
80102415:	e8 26 1f 00 00       	call   80104340 <initlock>
8010241a:	8b 45 08             	mov    0x8(%ebp),%eax
8010241d:	83 c4 10             	add    $0x10,%esp
80102420:	c7 05 74 26 11 80 00 	movl   $0x0,0x80112674
80102427:	00 00 00 
8010242a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102430:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102436:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010243c:	39 de                	cmp    %ebx,%esi
8010243e:	72 1c                	jb     8010245c <kinit1+0x5c>
80102440:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102446:	83 ec 0c             	sub    $0xc,%esp
80102449:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010244f:	50                   	push   %eax
80102450:	e8 cb fe ff ff       	call   80102320 <kfree>
80102455:	83 c4 10             	add    $0x10,%esp
80102458:	39 de                	cmp    %ebx,%esi
8010245a:	73 e4                	jae    80102440 <kinit1+0x40>
8010245c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010245f:	5b                   	pop    %ebx
80102460:	5e                   	pop    %esi
80102461:	5d                   	pop    %ebp
80102462:	c3                   	ret    
80102463:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102470 <kinit2>:
80102470:	55                   	push   %ebp
80102471:	89 e5                	mov    %esp,%ebp
80102473:	56                   	push   %esi
80102474:	53                   	push   %ebx
80102475:	8b 45 08             	mov    0x8(%ebp),%eax
80102478:	8b 75 0c             	mov    0xc(%ebp),%esi
8010247b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102481:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102487:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010248d:	39 de                	cmp    %ebx,%esi
8010248f:	72 23                	jb     801024b4 <kinit2+0x44>
80102491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102498:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010249e:	83 ec 0c             	sub    $0xc,%esp
801024a1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024a7:	50                   	push   %eax
801024a8:	e8 73 fe ff ff       	call   80102320 <kfree>
801024ad:	83 c4 10             	add    $0x10,%esp
801024b0:	39 de                	cmp    %ebx,%esi
801024b2:	73 e4                	jae    80102498 <kinit2+0x28>
801024b4:	c7 05 74 26 11 80 01 	movl   $0x1,0x80112674
801024bb:	00 00 00 
801024be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024c1:	5b                   	pop    %ebx
801024c2:	5e                   	pop    %esi
801024c3:	5d                   	pop    %ebp
801024c4:	c3                   	ret    
801024c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024d0 <kalloc>:
801024d0:	a1 74 26 11 80       	mov    0x80112674,%eax
801024d5:	85 c0                	test   %eax,%eax
801024d7:	75 1f                	jne    801024f8 <kalloc+0x28>
801024d9:	a1 78 26 11 80       	mov    0x80112678,%eax
801024de:	85 c0                	test   %eax,%eax
801024e0:	74 0e                	je     801024f0 <kalloc+0x20>
801024e2:	8b 10                	mov    (%eax),%edx
801024e4:	89 15 78 26 11 80    	mov    %edx,0x80112678
801024ea:	c3                   	ret    
801024eb:	90                   	nop
801024ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024f0:	f3 c3                	repz ret 
801024f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801024f8:	55                   	push   %ebp
801024f9:	89 e5                	mov    %esp,%ebp
801024fb:	83 ec 24             	sub    $0x24,%esp
801024fe:	68 40 26 11 80       	push   $0x80112640
80102503:	e8 78 1f 00 00       	call   80104480 <acquire>
80102508:	a1 78 26 11 80       	mov    0x80112678,%eax
8010250d:	83 c4 10             	add    $0x10,%esp
80102510:	8b 15 74 26 11 80    	mov    0x80112674,%edx
80102516:	85 c0                	test   %eax,%eax
80102518:	74 08                	je     80102522 <kalloc+0x52>
8010251a:	8b 08                	mov    (%eax),%ecx
8010251c:	89 0d 78 26 11 80    	mov    %ecx,0x80112678
80102522:	85 d2                	test   %edx,%edx
80102524:	74 16                	je     8010253c <kalloc+0x6c>
80102526:	83 ec 0c             	sub    $0xc,%esp
80102529:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010252c:	68 40 26 11 80       	push   $0x80112640
80102531:	e8 0a 20 00 00       	call   80104540 <release>
80102536:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102539:	83 c4 10             	add    $0x10,%esp
8010253c:	c9                   	leave  
8010253d:	c3                   	ret    
8010253e:	66 90                	xchg   %ax,%ax

80102540 <kbdgetc>:
80102540:	ba 64 00 00 00       	mov    $0x64,%edx
80102545:	ec                   	in     (%dx),%al
80102546:	a8 01                	test   $0x1,%al
80102548:	0f 84 c2 00 00 00    	je     80102610 <kbdgetc+0xd0>
8010254e:	ba 60 00 00 00       	mov    $0x60,%edx
80102553:	ec                   	in     (%dx),%al
80102554:	0f b6 d0             	movzbl %al,%edx
80102557:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
8010255d:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102563:	0f 84 7f 00 00 00    	je     801025e8 <kbdgetc+0xa8>
80102569:	55                   	push   %ebp
8010256a:	89 e5                	mov    %esp,%ebp
8010256c:	53                   	push   %ebx
8010256d:	89 cb                	mov    %ecx,%ebx
8010256f:	83 e3 40             	and    $0x40,%ebx
80102572:	84 c0                	test   %al,%al
80102574:	78 4a                	js     801025c0 <kbdgetc+0x80>
80102576:	85 db                	test   %ebx,%ebx
80102578:	74 09                	je     80102583 <kbdgetc+0x43>
8010257a:	83 c8 80             	or     $0xffffff80,%eax
8010257d:	83 e1 bf             	and    $0xffffffbf,%ecx
80102580:	0f b6 d0             	movzbl %al,%edx
80102583:	0f b6 82 a0 74 10 80 	movzbl -0x7fef8b60(%edx),%eax
8010258a:	09 c1                	or     %eax,%ecx
8010258c:	0f b6 82 a0 73 10 80 	movzbl -0x7fef8c60(%edx),%eax
80102593:	31 c1                	xor    %eax,%ecx
80102595:	89 c8                	mov    %ecx,%eax
80102597:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
8010259d:	83 e0 03             	and    $0x3,%eax
801025a0:	83 e1 08             	and    $0x8,%ecx
801025a3:	8b 04 85 80 73 10 80 	mov    -0x7fef8c80(,%eax,4),%eax
801025aa:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
801025ae:	74 31                	je     801025e1 <kbdgetc+0xa1>
801025b0:	8d 50 9f             	lea    -0x61(%eax),%edx
801025b3:	83 fa 19             	cmp    $0x19,%edx
801025b6:	77 40                	ja     801025f8 <kbdgetc+0xb8>
801025b8:	83 e8 20             	sub    $0x20,%eax
801025bb:	5b                   	pop    %ebx
801025bc:	5d                   	pop    %ebp
801025bd:	c3                   	ret    
801025be:	66 90                	xchg   %ax,%ax
801025c0:	83 e0 7f             	and    $0x7f,%eax
801025c3:	85 db                	test   %ebx,%ebx
801025c5:	0f 44 d0             	cmove  %eax,%edx
801025c8:	0f b6 82 a0 74 10 80 	movzbl -0x7fef8b60(%edx),%eax
801025cf:	83 c8 40             	or     $0x40,%eax
801025d2:	0f b6 c0             	movzbl %al,%eax
801025d5:	f7 d0                	not    %eax
801025d7:	21 c1                	and    %eax,%ecx
801025d9:	31 c0                	xor    %eax,%eax
801025db:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
801025e1:	5b                   	pop    %ebx
801025e2:	5d                   	pop    %ebp
801025e3:	c3                   	ret    
801025e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025e8:	83 c9 40             	or     $0x40,%ecx
801025eb:	31 c0                	xor    %eax,%eax
801025ed:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
801025f3:	c3                   	ret    
801025f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025f8:	8d 48 bf             	lea    -0x41(%eax),%ecx
801025fb:	8d 50 20             	lea    0x20(%eax),%edx
801025fe:	5b                   	pop    %ebx
801025ff:	83 f9 1a             	cmp    $0x1a,%ecx
80102602:	0f 42 c2             	cmovb  %edx,%eax
80102605:	5d                   	pop    %ebp
80102606:	c3                   	ret    
80102607:	89 f6                	mov    %esi,%esi
80102609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102610:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102615:	c3                   	ret    
80102616:	8d 76 00             	lea    0x0(%esi),%esi
80102619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102620 <kbdintr>:
80102620:	55                   	push   %ebp
80102621:	89 e5                	mov    %esp,%ebp
80102623:	83 ec 14             	sub    $0x14,%esp
80102626:	68 40 25 10 80       	push   $0x80102540
8010262b:	e8 e0 e1 ff ff       	call   80100810 <consoleintr>
80102630:	83 c4 10             	add    $0x10,%esp
80102633:	c9                   	leave  
80102634:	c3                   	ret    
80102635:	66 90                	xchg   %ax,%ax
80102637:	66 90                	xchg   %ax,%ax
80102639:	66 90                	xchg   %ax,%ax
8010263b:	66 90                	xchg   %ax,%ax
8010263d:	66 90                	xchg   %ax,%ax
8010263f:	90                   	nop

80102640 <lapicinit>:
80102640:	a1 7c 26 11 80       	mov    0x8011267c,%eax
80102645:	55                   	push   %ebp
80102646:	89 e5                	mov    %esp,%ebp
80102648:	85 c0                	test   %eax,%eax
8010264a:	0f 84 c8 00 00 00    	je     80102718 <lapicinit+0xd8>
80102650:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102657:	01 00 00 
8010265a:	8b 50 20             	mov    0x20(%eax),%edx
8010265d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102664:	00 00 00 
80102667:	8b 50 20             	mov    0x20(%eax),%edx
8010266a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102671:	00 02 00 
80102674:	8b 50 20             	mov    0x20(%eax),%edx
80102677:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010267e:	96 98 00 
80102681:	8b 50 20             	mov    0x20(%eax),%edx
80102684:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010268b:	00 01 00 
8010268e:	8b 50 20             	mov    0x20(%eax),%edx
80102691:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102698:	00 01 00 
8010269b:	8b 50 20             	mov    0x20(%eax),%edx
8010269e:	8b 50 30             	mov    0x30(%eax),%edx
801026a1:	c1 ea 10             	shr    $0x10,%edx
801026a4:	80 fa 03             	cmp    $0x3,%dl
801026a7:	77 77                	ja     80102720 <lapicinit+0xe0>
801026a9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801026b0:	00 00 00 
801026b3:	8b 50 20             	mov    0x20(%eax),%edx
801026b6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026bd:	00 00 00 
801026c0:	8b 50 20             	mov    0x20(%eax),%edx
801026c3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026ca:	00 00 00 
801026cd:	8b 50 20             	mov    0x20(%eax),%edx
801026d0:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801026d7:	00 00 00 
801026da:	8b 50 20             	mov    0x20(%eax),%edx
801026dd:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801026e4:	00 00 00 
801026e7:	8b 50 20             	mov    0x20(%eax),%edx
801026ea:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026f1:	85 08 00 
801026f4:	8b 50 20             	mov    0x20(%eax),%edx
801026f7:	89 f6                	mov    %esi,%esi
801026f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102700:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102706:	80 e6 10             	and    $0x10,%dh
80102709:	75 f5                	jne    80102700 <lapicinit+0xc0>
8010270b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102712:	00 00 00 
80102715:	8b 40 20             	mov    0x20(%eax),%eax
80102718:	5d                   	pop    %ebp
80102719:	c3                   	ret    
8010271a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102720:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102727:	00 01 00 
8010272a:	8b 50 20             	mov    0x20(%eax),%edx
8010272d:	e9 77 ff ff ff       	jmp    801026a9 <lapicinit+0x69>
80102732:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102740 <lapicid>:
80102740:	8b 15 7c 26 11 80    	mov    0x8011267c,%edx
80102746:	55                   	push   %ebp
80102747:	31 c0                	xor    %eax,%eax
80102749:	89 e5                	mov    %esp,%ebp
8010274b:	85 d2                	test   %edx,%edx
8010274d:	74 06                	je     80102755 <lapicid+0x15>
8010274f:	8b 42 20             	mov    0x20(%edx),%eax
80102752:	c1 e8 18             	shr    $0x18,%eax
80102755:	5d                   	pop    %ebp
80102756:	c3                   	ret    
80102757:	89 f6                	mov    %esi,%esi
80102759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102760 <lapiceoi>:
80102760:	a1 7c 26 11 80       	mov    0x8011267c,%eax
80102765:	55                   	push   %ebp
80102766:	89 e5                	mov    %esp,%ebp
80102768:	85 c0                	test   %eax,%eax
8010276a:	74 0d                	je     80102779 <lapiceoi+0x19>
8010276c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102773:	00 00 00 
80102776:	8b 40 20             	mov    0x20(%eax),%eax
80102779:	5d                   	pop    %ebp
8010277a:	c3                   	ret    
8010277b:	90                   	nop
8010277c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102780 <microdelay>:
80102780:	55                   	push   %ebp
80102781:	89 e5                	mov    %esp,%ebp
80102783:	5d                   	pop    %ebp
80102784:	c3                   	ret    
80102785:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102790 <lapicstartap>:
80102790:	55                   	push   %ebp
80102791:	b8 0f 00 00 00       	mov    $0xf,%eax
80102796:	ba 70 00 00 00       	mov    $0x70,%edx
8010279b:	89 e5                	mov    %esp,%ebp
8010279d:	53                   	push   %ebx
8010279e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801027a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801027a4:	ee                   	out    %al,(%dx)
801027a5:	b8 0a 00 00 00       	mov    $0xa,%eax
801027aa:	ba 71 00 00 00       	mov    $0x71,%edx
801027af:	ee                   	out    %al,(%dx)
801027b0:	31 c0                	xor    %eax,%eax
801027b2:	c1 e3 18             	shl    $0x18,%ebx
801027b5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
801027bb:	89 c8                	mov    %ecx,%eax
801027bd:	c1 e9 0c             	shr    $0xc,%ecx
801027c0:	c1 e8 04             	shr    $0x4,%eax
801027c3:	89 da                	mov    %ebx,%edx
801027c5:	80 cd 06             	or     $0x6,%ch
801027c8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
801027ce:	a1 7c 26 11 80       	mov    0x8011267c,%eax
801027d3:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
801027d9:	8b 58 20             	mov    0x20(%eax),%ebx
801027dc:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801027e3:	c5 00 00 
801027e6:	8b 58 20             	mov    0x20(%eax),%ebx
801027e9:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027f0:	85 00 00 
801027f3:	8b 58 20             	mov    0x20(%eax),%ebx
801027f6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027fc:	8b 58 20             	mov    0x20(%eax),%ebx
801027ff:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102805:	8b 58 20             	mov    0x20(%eax),%ebx
80102808:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010280e:	8b 50 20             	mov    0x20(%eax),%edx
80102811:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102817:	8b 40 20             	mov    0x20(%eax),%eax
8010281a:	5b                   	pop    %ebx
8010281b:	5d                   	pop    %ebp
8010281c:	c3                   	ret    
8010281d:	8d 76 00             	lea    0x0(%esi),%esi

80102820 <cmostime>:
80102820:	55                   	push   %ebp
80102821:	b8 0b 00 00 00       	mov    $0xb,%eax
80102826:	ba 70 00 00 00       	mov    $0x70,%edx
8010282b:	89 e5                	mov    %esp,%ebp
8010282d:	57                   	push   %edi
8010282e:	56                   	push   %esi
8010282f:	53                   	push   %ebx
80102830:	83 ec 4c             	sub    $0x4c,%esp
80102833:	ee                   	out    %al,(%dx)
80102834:	ba 71 00 00 00       	mov    $0x71,%edx
80102839:	ec                   	in     (%dx),%al
8010283a:	83 e0 04             	and    $0x4,%eax
8010283d:	bb 70 00 00 00       	mov    $0x70,%ebx
80102842:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102845:	8d 76 00             	lea    0x0(%esi),%esi
80102848:	31 c0                	xor    %eax,%eax
8010284a:	89 da                	mov    %ebx,%edx
8010284c:	ee                   	out    %al,(%dx)
8010284d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102852:	89 ca                	mov    %ecx,%edx
80102854:	ec                   	in     (%dx),%al
80102855:	88 45 b7             	mov    %al,-0x49(%ebp)
80102858:	89 da                	mov    %ebx,%edx
8010285a:	b8 02 00 00 00       	mov    $0x2,%eax
8010285f:	ee                   	out    %al,(%dx)
80102860:	89 ca                	mov    %ecx,%edx
80102862:	ec                   	in     (%dx),%al
80102863:	88 45 b6             	mov    %al,-0x4a(%ebp)
80102866:	89 da                	mov    %ebx,%edx
80102868:	b8 04 00 00 00       	mov    $0x4,%eax
8010286d:	ee                   	out    %al,(%dx)
8010286e:	89 ca                	mov    %ecx,%edx
80102870:	ec                   	in     (%dx),%al
80102871:	88 45 b5             	mov    %al,-0x4b(%ebp)
80102874:	89 da                	mov    %ebx,%edx
80102876:	b8 07 00 00 00       	mov    $0x7,%eax
8010287b:	ee                   	out    %al,(%dx)
8010287c:	89 ca                	mov    %ecx,%edx
8010287e:	ec                   	in     (%dx),%al
8010287f:	88 45 b4             	mov    %al,-0x4c(%ebp)
80102882:	89 da                	mov    %ebx,%edx
80102884:	b8 08 00 00 00       	mov    $0x8,%eax
80102889:	ee                   	out    %al,(%dx)
8010288a:	89 ca                	mov    %ecx,%edx
8010288c:	ec                   	in     (%dx),%al
8010288d:	89 c7                	mov    %eax,%edi
8010288f:	89 da                	mov    %ebx,%edx
80102891:	b8 09 00 00 00       	mov    $0x9,%eax
80102896:	ee                   	out    %al,(%dx)
80102897:	89 ca                	mov    %ecx,%edx
80102899:	ec                   	in     (%dx),%al
8010289a:	89 c6                	mov    %eax,%esi
8010289c:	89 da                	mov    %ebx,%edx
8010289e:	b8 0a 00 00 00       	mov    $0xa,%eax
801028a3:	ee                   	out    %al,(%dx)
801028a4:	89 ca                	mov    %ecx,%edx
801028a6:	ec                   	in     (%dx),%al
801028a7:	84 c0                	test   %al,%al
801028a9:	78 9d                	js     80102848 <cmostime+0x28>
801028ab:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
801028af:	89 fa                	mov    %edi,%edx
801028b1:	0f b6 fa             	movzbl %dl,%edi
801028b4:	89 f2                	mov    %esi,%edx
801028b6:	0f b6 f2             	movzbl %dl,%esi
801028b9:	89 7d c8             	mov    %edi,-0x38(%ebp)
801028bc:	89 da                	mov    %ebx,%edx
801028be:	89 75 cc             	mov    %esi,-0x34(%ebp)
801028c1:	89 45 b8             	mov    %eax,-0x48(%ebp)
801028c4:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
801028c8:	89 45 bc             	mov    %eax,-0x44(%ebp)
801028cb:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
801028cf:	89 45 c0             	mov    %eax,-0x40(%ebp)
801028d2:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
801028d6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801028d9:	31 c0                	xor    %eax,%eax
801028db:	ee                   	out    %al,(%dx)
801028dc:	89 ca                	mov    %ecx,%edx
801028de:	ec                   	in     (%dx),%al
801028df:	0f b6 c0             	movzbl %al,%eax
801028e2:	89 da                	mov    %ebx,%edx
801028e4:	89 45 d0             	mov    %eax,-0x30(%ebp)
801028e7:	b8 02 00 00 00       	mov    $0x2,%eax
801028ec:	ee                   	out    %al,(%dx)
801028ed:	89 ca                	mov    %ecx,%edx
801028ef:	ec                   	in     (%dx),%al
801028f0:	0f b6 c0             	movzbl %al,%eax
801028f3:	89 da                	mov    %ebx,%edx
801028f5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801028f8:	b8 04 00 00 00       	mov    $0x4,%eax
801028fd:	ee                   	out    %al,(%dx)
801028fe:	89 ca                	mov    %ecx,%edx
80102900:	ec                   	in     (%dx),%al
80102901:	0f b6 c0             	movzbl %al,%eax
80102904:	89 da                	mov    %ebx,%edx
80102906:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102909:	b8 07 00 00 00       	mov    $0x7,%eax
8010290e:	ee                   	out    %al,(%dx)
8010290f:	89 ca                	mov    %ecx,%edx
80102911:	ec                   	in     (%dx),%al
80102912:	0f b6 c0             	movzbl %al,%eax
80102915:	89 da                	mov    %ebx,%edx
80102917:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010291a:	b8 08 00 00 00       	mov    $0x8,%eax
8010291f:	ee                   	out    %al,(%dx)
80102920:	89 ca                	mov    %ecx,%edx
80102922:	ec                   	in     (%dx),%al
80102923:	0f b6 c0             	movzbl %al,%eax
80102926:	89 da                	mov    %ebx,%edx
80102928:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010292b:	b8 09 00 00 00       	mov    $0x9,%eax
80102930:	ee                   	out    %al,(%dx)
80102931:	89 ca                	mov    %ecx,%edx
80102933:	ec                   	in     (%dx),%al
80102934:	0f b6 c0             	movzbl %al,%eax
80102937:	83 ec 04             	sub    $0x4,%esp
8010293a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010293d:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102940:	6a 18                	push   $0x18
80102942:	50                   	push   %eax
80102943:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102946:	50                   	push   %eax
80102947:	e8 94 1c 00 00       	call   801045e0 <memcmp>
8010294c:	83 c4 10             	add    $0x10,%esp
8010294f:	85 c0                	test   %eax,%eax
80102951:	0f 85 f1 fe ff ff    	jne    80102848 <cmostime+0x28>
80102957:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
8010295b:	75 78                	jne    801029d5 <cmostime+0x1b5>
8010295d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102960:	89 c2                	mov    %eax,%edx
80102962:	83 e0 0f             	and    $0xf,%eax
80102965:	c1 ea 04             	shr    $0x4,%edx
80102968:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010296b:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010296e:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102971:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102974:	89 c2                	mov    %eax,%edx
80102976:	83 e0 0f             	and    $0xf,%eax
80102979:	c1 ea 04             	shr    $0x4,%edx
8010297c:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010297f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102982:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102985:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102988:	89 c2                	mov    %eax,%edx
8010298a:	83 e0 0f             	and    $0xf,%eax
8010298d:	c1 ea 04             	shr    $0x4,%edx
80102990:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102993:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102996:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102999:	8b 45 c4             	mov    -0x3c(%ebp),%eax
8010299c:	89 c2                	mov    %eax,%edx
8010299e:	83 e0 0f             	and    $0xf,%eax
801029a1:	c1 ea 04             	shr    $0x4,%edx
801029a4:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029a7:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029aa:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801029ad:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029b0:	89 c2                	mov    %eax,%edx
801029b2:	83 e0 0f             	and    $0xf,%eax
801029b5:	c1 ea 04             	shr    $0x4,%edx
801029b8:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029bb:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029be:	89 45 c8             	mov    %eax,-0x38(%ebp)
801029c1:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029c4:	89 c2                	mov    %eax,%edx
801029c6:	83 e0 0f             	and    $0xf,%eax
801029c9:	c1 ea 04             	shr    $0x4,%edx
801029cc:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029cf:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029d2:	89 45 cc             	mov    %eax,-0x34(%ebp)
801029d5:	8b 75 08             	mov    0x8(%ebp),%esi
801029d8:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029db:	89 06                	mov    %eax,(%esi)
801029dd:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029e0:	89 46 04             	mov    %eax,0x4(%esi)
801029e3:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029e6:	89 46 08             	mov    %eax,0x8(%esi)
801029e9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029ec:	89 46 0c             	mov    %eax,0xc(%esi)
801029ef:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029f2:	89 46 10             	mov    %eax,0x10(%esi)
801029f5:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029f8:	89 46 14             	mov    %eax,0x14(%esi)
801029fb:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
80102a02:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a05:	5b                   	pop    %ebx
80102a06:	5e                   	pop    %esi
80102a07:	5f                   	pop    %edi
80102a08:	5d                   	pop    %ebp
80102a09:	c3                   	ret    
80102a0a:	66 90                	xchg   %ax,%ax
80102a0c:	66 90                	xchg   %ax,%ax
80102a0e:	66 90                	xchg   %ax,%ax

80102a10 <install_trans>:
80102a10:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102a16:	85 c9                	test   %ecx,%ecx
80102a18:	0f 8e 8a 00 00 00    	jle    80102aa8 <install_trans+0x98>
80102a1e:	55                   	push   %ebp
80102a1f:	89 e5                	mov    %esp,%ebp
80102a21:	57                   	push   %edi
80102a22:	56                   	push   %esi
80102a23:	53                   	push   %ebx
80102a24:	31 db                	xor    %ebx,%ebx
80102a26:	83 ec 0c             	sub    $0xc,%esp
80102a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a30:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102a35:	83 ec 08             	sub    $0x8,%esp
80102a38:	01 d8                	add    %ebx,%eax
80102a3a:	83 c0 01             	add    $0x1,%eax
80102a3d:	50                   	push   %eax
80102a3e:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102a44:	e8 87 d6 ff ff       	call   801000d0 <bread>
80102a49:	89 c7                	mov    %eax,%edi
80102a4b:	58                   	pop    %eax
80102a4c:	5a                   	pop    %edx
80102a4d:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102a54:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102a5a:	83 c3 01             	add    $0x1,%ebx
80102a5d:	e8 6e d6 ff ff       	call   801000d0 <bread>
80102a62:	89 c6                	mov    %eax,%esi
80102a64:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a67:	83 c4 0c             	add    $0xc,%esp
80102a6a:	68 00 02 00 00       	push   $0x200
80102a6f:	50                   	push   %eax
80102a70:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a73:	50                   	push   %eax
80102a74:	e8 c7 1b 00 00       	call   80104640 <memmove>
80102a79:	89 34 24             	mov    %esi,(%esp)
80102a7c:	e8 1f d7 ff ff       	call   801001a0 <bwrite>
80102a81:	89 3c 24             	mov    %edi,(%esp)
80102a84:	e8 57 d7 ff ff       	call   801001e0 <brelse>
80102a89:	89 34 24             	mov    %esi,(%esp)
80102a8c:	e8 4f d7 ff ff       	call   801001e0 <brelse>
80102a91:	83 c4 10             	add    $0x10,%esp
80102a94:	39 1d c8 26 11 80    	cmp    %ebx,0x801126c8
80102a9a:	7f 94                	jg     80102a30 <install_trans+0x20>
80102a9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a9f:	5b                   	pop    %ebx
80102aa0:	5e                   	pop    %esi
80102aa1:	5f                   	pop    %edi
80102aa2:	5d                   	pop    %ebp
80102aa3:	c3                   	ret    
80102aa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102aa8:	f3 c3                	repz ret 
80102aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102ab0 <write_head>:
80102ab0:	55                   	push   %ebp
80102ab1:	89 e5                	mov    %esp,%ebp
80102ab3:	56                   	push   %esi
80102ab4:	53                   	push   %ebx
80102ab5:	83 ec 08             	sub    $0x8,%esp
80102ab8:	ff 35 b4 26 11 80    	pushl  0x801126b4
80102abe:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102ac4:	e8 07 d6 ff ff       	call   801000d0 <bread>
80102ac9:	8b 1d c8 26 11 80    	mov    0x801126c8,%ebx
80102acf:	83 c4 10             	add    $0x10,%esp
80102ad2:	89 c6                	mov    %eax,%esi
80102ad4:	85 db                	test   %ebx,%ebx
80102ad6:	89 58 5c             	mov    %ebx,0x5c(%eax)
80102ad9:	7e 16                	jle    80102af1 <write_head+0x41>
80102adb:	c1 e3 02             	shl    $0x2,%ebx
80102ade:	31 d2                	xor    %edx,%edx
80102ae0:	8b 8a cc 26 11 80    	mov    -0x7feed934(%edx),%ecx
80102ae6:	89 4c 16 60          	mov    %ecx,0x60(%esi,%edx,1)
80102aea:	83 c2 04             	add    $0x4,%edx
80102aed:	39 da                	cmp    %ebx,%edx
80102aef:	75 ef                	jne    80102ae0 <write_head+0x30>
80102af1:	83 ec 0c             	sub    $0xc,%esp
80102af4:	56                   	push   %esi
80102af5:	e8 a6 d6 ff ff       	call   801001a0 <bwrite>
80102afa:	89 34 24             	mov    %esi,(%esp)
80102afd:	e8 de d6 ff ff       	call   801001e0 <brelse>
80102b02:	83 c4 10             	add    $0x10,%esp
80102b05:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102b08:	5b                   	pop    %ebx
80102b09:	5e                   	pop    %esi
80102b0a:	5d                   	pop    %ebp
80102b0b:	c3                   	ret    
80102b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102b10 <initlog>:
80102b10:	55                   	push   %ebp
80102b11:	89 e5                	mov    %esp,%ebp
80102b13:	53                   	push   %ebx
80102b14:	83 ec 2c             	sub    $0x2c,%esp
80102b17:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102b1a:	68 a0 75 10 80       	push   $0x801075a0
80102b1f:	68 80 26 11 80       	push   $0x80112680
80102b24:	e8 17 18 00 00       	call   80104340 <initlock>
80102b29:	58                   	pop    %eax
80102b2a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102b2d:	5a                   	pop    %edx
80102b2e:	50                   	push   %eax
80102b2f:	53                   	push   %ebx
80102b30:	e8 9b e8 ff ff       	call   801013d0 <readsb>
80102b35:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102b38:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102b3b:	59                   	pop    %ecx
80102b3c:	89 1d c4 26 11 80    	mov    %ebx,0x801126c4
80102b42:	89 15 b8 26 11 80    	mov    %edx,0x801126b8
80102b48:	a3 b4 26 11 80       	mov    %eax,0x801126b4
80102b4d:	5a                   	pop    %edx
80102b4e:	50                   	push   %eax
80102b4f:	53                   	push   %ebx
80102b50:	e8 7b d5 ff ff       	call   801000d0 <bread>
80102b55:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102b58:	83 c4 10             	add    $0x10,%esp
80102b5b:	85 db                	test   %ebx,%ebx
80102b5d:	89 1d c8 26 11 80    	mov    %ebx,0x801126c8
80102b63:	7e 1c                	jle    80102b81 <initlog+0x71>
80102b65:	c1 e3 02             	shl    $0x2,%ebx
80102b68:	31 d2                	xor    %edx,%edx
80102b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b70:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b74:	83 c2 04             	add    $0x4,%edx
80102b77:	89 8a c8 26 11 80    	mov    %ecx,-0x7feed938(%edx)
80102b7d:	39 d3                	cmp    %edx,%ebx
80102b7f:	75 ef                	jne    80102b70 <initlog+0x60>
80102b81:	83 ec 0c             	sub    $0xc,%esp
80102b84:	50                   	push   %eax
80102b85:	e8 56 d6 ff ff       	call   801001e0 <brelse>
80102b8a:	e8 81 fe ff ff       	call   80102a10 <install_trans>
80102b8f:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102b96:	00 00 00 
80102b99:	e8 12 ff ff ff       	call   80102ab0 <write_head>
80102b9e:	83 c4 10             	add    $0x10,%esp
80102ba1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102ba4:	c9                   	leave  
80102ba5:	c3                   	ret    
80102ba6:	8d 76 00             	lea    0x0(%esi),%esi
80102ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bb0 <begin_op>:
80102bb0:	55                   	push   %ebp
80102bb1:	89 e5                	mov    %esp,%ebp
80102bb3:	83 ec 14             	sub    $0x14,%esp
80102bb6:	68 80 26 11 80       	push   $0x80112680
80102bbb:	e8 c0 18 00 00       	call   80104480 <acquire>
80102bc0:	83 c4 10             	add    $0x10,%esp
80102bc3:	eb 18                	jmp    80102bdd <begin_op+0x2d>
80102bc5:	8d 76 00             	lea    0x0(%esi),%esi
80102bc8:	83 ec 08             	sub    $0x8,%esp
80102bcb:	68 80 26 11 80       	push   $0x80112680
80102bd0:	68 80 26 11 80       	push   $0x80112680
80102bd5:	e8 b6 11 00 00       	call   80103d90 <sleep>
80102bda:	83 c4 10             	add    $0x10,%esp
80102bdd:	a1 c0 26 11 80       	mov    0x801126c0,%eax
80102be2:	85 c0                	test   %eax,%eax
80102be4:	75 e2                	jne    80102bc8 <begin_op+0x18>
80102be6:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102beb:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102bf1:	83 c0 01             	add    $0x1,%eax
80102bf4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102bf7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102bfa:	83 fa 1e             	cmp    $0x1e,%edx
80102bfd:	7f c9                	jg     80102bc8 <begin_op+0x18>
80102bff:	83 ec 0c             	sub    $0xc,%esp
80102c02:	a3 bc 26 11 80       	mov    %eax,0x801126bc
80102c07:	68 80 26 11 80       	push   $0x80112680
80102c0c:	e8 2f 19 00 00       	call   80104540 <release>
80102c11:	83 c4 10             	add    $0x10,%esp
80102c14:	c9                   	leave  
80102c15:	c3                   	ret    
80102c16:	8d 76 00             	lea    0x0(%esi),%esi
80102c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c20 <end_op>:
80102c20:	55                   	push   %ebp
80102c21:	89 e5                	mov    %esp,%ebp
80102c23:	57                   	push   %edi
80102c24:	56                   	push   %esi
80102c25:	53                   	push   %ebx
80102c26:	83 ec 18             	sub    $0x18,%esp
80102c29:	68 80 26 11 80       	push   $0x80112680
80102c2e:	e8 4d 18 00 00       	call   80104480 <acquire>
80102c33:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102c38:	8b 35 c0 26 11 80    	mov    0x801126c0,%esi
80102c3e:	83 c4 10             	add    $0x10,%esp
80102c41:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102c44:	85 f6                	test   %esi,%esi
80102c46:	89 1d bc 26 11 80    	mov    %ebx,0x801126bc
80102c4c:	0f 85 1a 01 00 00    	jne    80102d6c <end_op+0x14c>
80102c52:	85 db                	test   %ebx,%ebx
80102c54:	0f 85 ee 00 00 00    	jne    80102d48 <end_op+0x128>
80102c5a:	83 ec 0c             	sub    $0xc,%esp
80102c5d:	c7 05 c0 26 11 80 01 	movl   $0x1,0x801126c0
80102c64:	00 00 00 
80102c67:	68 80 26 11 80       	push   $0x80112680
80102c6c:	e8 cf 18 00 00       	call   80104540 <release>
80102c71:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102c77:	83 c4 10             	add    $0x10,%esp
80102c7a:	85 c9                	test   %ecx,%ecx
80102c7c:	0f 8e 85 00 00 00    	jle    80102d07 <end_op+0xe7>
80102c82:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102c87:	83 ec 08             	sub    $0x8,%esp
80102c8a:	01 d8                	add    %ebx,%eax
80102c8c:	83 c0 01             	add    $0x1,%eax
80102c8f:	50                   	push   %eax
80102c90:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102c96:	e8 35 d4 ff ff       	call   801000d0 <bread>
80102c9b:	89 c6                	mov    %eax,%esi
80102c9d:	58                   	pop    %eax
80102c9e:	5a                   	pop    %edx
80102c9f:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102ca6:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102cac:	83 c3 01             	add    $0x1,%ebx
80102caf:	e8 1c d4 ff ff       	call   801000d0 <bread>
80102cb4:	89 c7                	mov    %eax,%edi
80102cb6:	8d 40 5c             	lea    0x5c(%eax),%eax
80102cb9:	83 c4 0c             	add    $0xc,%esp
80102cbc:	68 00 02 00 00       	push   $0x200
80102cc1:	50                   	push   %eax
80102cc2:	8d 46 5c             	lea    0x5c(%esi),%eax
80102cc5:	50                   	push   %eax
80102cc6:	e8 75 19 00 00       	call   80104640 <memmove>
80102ccb:	89 34 24             	mov    %esi,(%esp)
80102cce:	e8 cd d4 ff ff       	call   801001a0 <bwrite>
80102cd3:	89 3c 24             	mov    %edi,(%esp)
80102cd6:	e8 05 d5 ff ff       	call   801001e0 <brelse>
80102cdb:	89 34 24             	mov    %esi,(%esp)
80102cde:	e8 fd d4 ff ff       	call   801001e0 <brelse>
80102ce3:	83 c4 10             	add    $0x10,%esp
80102ce6:	3b 1d c8 26 11 80    	cmp    0x801126c8,%ebx
80102cec:	7c 94                	jl     80102c82 <end_op+0x62>
80102cee:	e8 bd fd ff ff       	call   80102ab0 <write_head>
80102cf3:	e8 18 fd ff ff       	call   80102a10 <install_trans>
80102cf8:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102cff:	00 00 00 
80102d02:	e8 a9 fd ff ff       	call   80102ab0 <write_head>
80102d07:	83 ec 0c             	sub    $0xc,%esp
80102d0a:	68 80 26 11 80       	push   $0x80112680
80102d0f:	e8 6c 17 00 00       	call   80104480 <acquire>
80102d14:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102d1b:	c7 05 c0 26 11 80 00 	movl   $0x0,0x801126c0
80102d22:	00 00 00 
80102d25:	e8 16 12 00 00       	call   80103f40 <wakeup>
80102d2a:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102d31:	e8 0a 18 00 00       	call   80104540 <release>
80102d36:	83 c4 10             	add    $0x10,%esp
80102d39:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d3c:	5b                   	pop    %ebx
80102d3d:	5e                   	pop    %esi
80102d3e:	5f                   	pop    %edi
80102d3f:	5d                   	pop    %ebp
80102d40:	c3                   	ret    
80102d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102d48:	83 ec 0c             	sub    $0xc,%esp
80102d4b:	68 80 26 11 80       	push   $0x80112680
80102d50:	e8 eb 11 00 00       	call   80103f40 <wakeup>
80102d55:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102d5c:	e8 df 17 00 00       	call   80104540 <release>
80102d61:	83 c4 10             	add    $0x10,%esp
80102d64:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d67:	5b                   	pop    %ebx
80102d68:	5e                   	pop    %esi
80102d69:	5f                   	pop    %edi
80102d6a:	5d                   	pop    %ebp
80102d6b:	c3                   	ret    
80102d6c:	83 ec 0c             	sub    $0xc,%esp
80102d6f:	68 a4 75 10 80       	push   $0x801075a4
80102d74:	e8 17 d6 ff ff       	call   80100390 <panic>
80102d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102d80 <log_write>:
80102d80:	55                   	push   %ebp
80102d81:	89 e5                	mov    %esp,%ebp
80102d83:	53                   	push   %ebx
80102d84:	83 ec 04             	sub    $0x4,%esp
80102d87:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102d8d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d90:	83 fa 1d             	cmp    $0x1d,%edx
80102d93:	0f 8f 9d 00 00 00    	jg     80102e36 <log_write+0xb6>
80102d99:	a1 b8 26 11 80       	mov    0x801126b8,%eax
80102d9e:	83 e8 01             	sub    $0x1,%eax
80102da1:	39 c2                	cmp    %eax,%edx
80102da3:	0f 8d 8d 00 00 00    	jge    80102e36 <log_write+0xb6>
80102da9:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102dae:	85 c0                	test   %eax,%eax
80102db0:	0f 8e 8d 00 00 00    	jle    80102e43 <log_write+0xc3>
80102db6:	83 ec 0c             	sub    $0xc,%esp
80102db9:	68 80 26 11 80       	push   $0x80112680
80102dbe:	e8 bd 16 00 00       	call   80104480 <acquire>
80102dc3:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102dc9:	83 c4 10             	add    $0x10,%esp
80102dcc:	83 f9 00             	cmp    $0x0,%ecx
80102dcf:	7e 57                	jle    80102e28 <log_write+0xa8>
80102dd1:	8b 53 08             	mov    0x8(%ebx),%edx
80102dd4:	31 c0                	xor    %eax,%eax
80102dd6:	3b 15 cc 26 11 80    	cmp    0x801126cc,%edx
80102ddc:	75 0b                	jne    80102de9 <log_write+0x69>
80102dde:	eb 38                	jmp    80102e18 <log_write+0x98>
80102de0:	39 14 85 cc 26 11 80 	cmp    %edx,-0x7feed934(,%eax,4)
80102de7:	74 2f                	je     80102e18 <log_write+0x98>
80102de9:	83 c0 01             	add    $0x1,%eax
80102dec:	39 c1                	cmp    %eax,%ecx
80102dee:	75 f0                	jne    80102de0 <log_write+0x60>
80102df0:	89 14 85 cc 26 11 80 	mov    %edx,-0x7feed934(,%eax,4)
80102df7:	83 c0 01             	add    $0x1,%eax
80102dfa:	a3 c8 26 11 80       	mov    %eax,0x801126c8
80102dff:	83 0b 04             	orl    $0x4,(%ebx)
80102e02:	c7 45 08 80 26 11 80 	movl   $0x80112680,0x8(%ebp)
80102e09:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e0c:	c9                   	leave  
80102e0d:	e9 2e 17 00 00       	jmp    80104540 <release>
80102e12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102e18:	89 14 85 cc 26 11 80 	mov    %edx,-0x7feed934(,%eax,4)
80102e1f:	eb de                	jmp    80102dff <log_write+0x7f>
80102e21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102e28:	8b 43 08             	mov    0x8(%ebx),%eax
80102e2b:	a3 cc 26 11 80       	mov    %eax,0x801126cc
80102e30:	75 cd                	jne    80102dff <log_write+0x7f>
80102e32:	31 c0                	xor    %eax,%eax
80102e34:	eb c1                	jmp    80102df7 <log_write+0x77>
80102e36:	83 ec 0c             	sub    $0xc,%esp
80102e39:	68 b3 75 10 80       	push   $0x801075b3
80102e3e:	e8 4d d5 ff ff       	call   80100390 <panic>
80102e43:	83 ec 0c             	sub    $0xc,%esp
80102e46:	68 c9 75 10 80       	push   $0x801075c9
80102e4b:	e8 40 d5 ff ff       	call   80100390 <panic>

80102e50 <mpmain>:
80102e50:	55                   	push   %ebp
80102e51:	89 e5                	mov    %esp,%ebp
80102e53:	53                   	push   %ebx
80102e54:	83 ec 04             	sub    $0x4,%esp
80102e57:	e8 64 09 00 00       	call   801037c0 <cpuid>
80102e5c:	89 c3                	mov    %eax,%ebx
80102e5e:	e8 5d 09 00 00       	call   801037c0 <cpuid>
80102e63:	83 ec 04             	sub    $0x4,%esp
80102e66:	53                   	push   %ebx
80102e67:	50                   	push   %eax
80102e68:	68 e4 75 10 80       	push   $0x801075e4
80102e6d:	e8 ee d7 ff ff       	call   80100660 <cprintf>
80102e72:	e8 a9 29 00 00       	call   80105820 <idtinit>
80102e77:	e8 c4 08 00 00       	call   80103740 <mycpu>
80102e7c:	89 c2                	mov    %eax,%edx
80102e7e:	b8 01 00 00 00       	mov    $0x1,%eax
80102e83:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80102e8a:	e8 11 0c 00 00       	call   80103aa0 <scheduler>
80102e8f:	90                   	nop

80102e90 <mpenter>:
80102e90:	55                   	push   %ebp
80102e91:	89 e5                	mov    %esp,%ebp
80102e93:	83 ec 08             	sub    $0x8,%esp
80102e96:	e8 e5 3a 00 00       	call   80106980 <switchkvm>
80102e9b:	e8 e0 39 00 00       	call   80106880 <seginit>
80102ea0:	e8 9b f7 ff ff       	call   80102640 <lapicinit>
80102ea5:	e8 a6 ff ff ff       	call   80102e50 <mpmain>
80102eaa:	66 90                	xchg   %ax,%ax
80102eac:	66 90                	xchg   %ax,%ax
80102eae:	66 90                	xchg   %ax,%ax

80102eb0 <main>:
80102eb0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102eb4:	83 e4 f0             	and    $0xfffffff0,%esp
80102eb7:	ff 71 fc             	pushl  -0x4(%ecx)
80102eba:	55                   	push   %ebp
80102ebb:	89 e5                	mov    %esp,%ebp
80102ebd:	53                   	push   %ebx
80102ebe:	51                   	push   %ecx
80102ebf:	83 ec 08             	sub    $0x8,%esp
80102ec2:	68 00 00 40 80       	push   $0x80400000
80102ec7:	68 a8 54 11 80       	push   $0x801154a8
80102ecc:	e8 2f f5 ff ff       	call   80102400 <kinit1>
80102ed1:	e8 4a 3f 00 00       	call   80106e20 <kvmalloc>
80102ed6:	e8 75 01 00 00       	call   80103050 <mpinit>
80102edb:	e8 60 f7 ff ff       	call   80102640 <lapicinit>
80102ee0:	e8 9b 39 00 00       	call   80106880 <seginit>
80102ee5:	e8 46 03 00 00       	call   80103230 <picinit>
80102eea:	e8 41 f3 ff ff       	call   80102230 <ioapicinit>
80102eef:	e8 cc da ff ff       	call   801009c0 <consoleinit>
80102ef4:	e8 57 2c 00 00       	call   80105b50 <uartinit>
80102ef9:	e8 22 08 00 00       	call   80103720 <pinit>
80102efe:	e8 9d 28 00 00       	call   801057a0 <tvinit>
80102f03:	e8 38 d1 ff ff       	call   80100040 <binit>
80102f08:	e8 53 de ff ff       	call   80100d60 <fileinit>
80102f0d:	e8 fe f0 ff ff       	call   80102010 <ideinit>
80102f12:	83 c4 0c             	add    $0xc,%esp
80102f15:	68 8a 00 00 00       	push   $0x8a
80102f1a:	68 8c a4 10 80       	push   $0x8010a48c
80102f1f:	68 00 70 00 80       	push   $0x80007000
80102f24:	e8 17 17 00 00       	call   80104640 <memmove>
80102f29:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102f30:	00 00 00 
80102f33:	83 c4 10             	add    $0x10,%esp
80102f36:	05 80 27 11 80       	add    $0x80112780,%eax
80102f3b:	3d 80 27 11 80       	cmp    $0x80112780,%eax
80102f40:	76 71                	jbe    80102fb3 <main+0x103>
80102f42:	bb 80 27 11 80       	mov    $0x80112780,%ebx
80102f47:	89 f6                	mov    %esi,%esi
80102f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102f50:	e8 eb 07 00 00       	call   80103740 <mycpu>
80102f55:	39 d8                	cmp    %ebx,%eax
80102f57:	74 41                	je     80102f9a <main+0xea>
80102f59:	e8 72 f5 ff ff       	call   801024d0 <kalloc>
80102f5e:	05 00 10 00 00       	add    $0x1000,%eax
80102f63:	c7 05 f8 6f 00 80 90 	movl   $0x80102e90,0x80006ff8
80102f6a:	2e 10 80 
80102f6d:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f74:	90 10 00 
80102f77:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102f7c:	0f b6 03             	movzbl (%ebx),%eax
80102f7f:	83 ec 08             	sub    $0x8,%esp
80102f82:	68 00 70 00 00       	push   $0x7000
80102f87:	50                   	push   %eax
80102f88:	e8 03 f8 ff ff       	call   80102790 <lapicstartap>
80102f8d:	83 c4 10             	add    $0x10,%esp
80102f90:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f96:	85 c0                	test   %eax,%eax
80102f98:	74 f6                	je     80102f90 <main+0xe0>
80102f9a:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102fa1:	00 00 00 
80102fa4:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102faa:	05 80 27 11 80       	add    $0x80112780,%eax
80102faf:	39 c3                	cmp    %eax,%ebx
80102fb1:	72 9d                	jb     80102f50 <main+0xa0>
80102fb3:	83 ec 08             	sub    $0x8,%esp
80102fb6:	68 00 00 00 8e       	push   $0x8e000000
80102fbb:	68 00 00 40 80       	push   $0x80400000
80102fc0:	e8 ab f4 ff ff       	call   80102470 <kinit2>
80102fc5:	e8 46 08 00 00       	call   80103810 <userinit>
80102fca:	e8 81 fe ff ff       	call   80102e50 <mpmain>
80102fcf:	90                   	nop

80102fd0 <mpsearch1>:
80102fd0:	55                   	push   %ebp
80102fd1:	89 e5                	mov    %esp,%ebp
80102fd3:	57                   	push   %edi
80102fd4:	56                   	push   %esi
80102fd5:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80102fdb:	53                   	push   %ebx
80102fdc:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
80102fdf:	83 ec 0c             	sub    $0xc,%esp
80102fe2:	39 de                	cmp    %ebx,%esi
80102fe4:	72 10                	jb     80102ff6 <mpsearch1+0x26>
80102fe6:	eb 50                	jmp    80103038 <mpsearch1+0x68>
80102fe8:	90                   	nop
80102fe9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ff0:	39 fb                	cmp    %edi,%ebx
80102ff2:	89 fe                	mov    %edi,%esi
80102ff4:	76 42                	jbe    80103038 <mpsearch1+0x68>
80102ff6:	83 ec 04             	sub    $0x4,%esp
80102ff9:	8d 7e 10             	lea    0x10(%esi),%edi
80102ffc:	6a 04                	push   $0x4
80102ffe:	68 f8 75 10 80       	push   $0x801075f8
80103003:	56                   	push   %esi
80103004:	e8 d7 15 00 00       	call   801045e0 <memcmp>
80103009:	83 c4 10             	add    $0x10,%esp
8010300c:	85 c0                	test   %eax,%eax
8010300e:	75 e0                	jne    80102ff0 <mpsearch1+0x20>
80103010:	89 f1                	mov    %esi,%ecx
80103012:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103018:	0f b6 11             	movzbl (%ecx),%edx
8010301b:	83 c1 01             	add    $0x1,%ecx
8010301e:	01 d0                	add    %edx,%eax
80103020:	39 f9                	cmp    %edi,%ecx
80103022:	75 f4                	jne    80103018 <mpsearch1+0x48>
80103024:	84 c0                	test   %al,%al
80103026:	75 c8                	jne    80102ff0 <mpsearch1+0x20>
80103028:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010302b:	89 f0                	mov    %esi,%eax
8010302d:	5b                   	pop    %ebx
8010302e:	5e                   	pop    %esi
8010302f:	5f                   	pop    %edi
80103030:	5d                   	pop    %ebp
80103031:	c3                   	ret    
80103032:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103038:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010303b:	31 f6                	xor    %esi,%esi
8010303d:	89 f0                	mov    %esi,%eax
8010303f:	5b                   	pop    %ebx
80103040:	5e                   	pop    %esi
80103041:	5f                   	pop    %edi
80103042:	5d                   	pop    %ebp
80103043:	c3                   	ret    
80103044:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010304a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103050 <mpinit>:
80103050:	55                   	push   %ebp
80103051:	89 e5                	mov    %esp,%ebp
80103053:	57                   	push   %edi
80103054:	56                   	push   %esi
80103055:	53                   	push   %ebx
80103056:	83 ec 1c             	sub    $0x1c,%esp
80103059:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103060:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103067:	c1 e0 08             	shl    $0x8,%eax
8010306a:	09 d0                	or     %edx,%eax
8010306c:	c1 e0 04             	shl    $0x4,%eax
8010306f:	85 c0                	test   %eax,%eax
80103071:	75 1b                	jne    8010308e <mpinit+0x3e>
80103073:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010307a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103081:	c1 e0 08             	shl    $0x8,%eax
80103084:	09 d0                	or     %edx,%eax
80103086:	c1 e0 0a             	shl    $0xa,%eax
80103089:	2d 00 04 00 00       	sub    $0x400,%eax
8010308e:	ba 00 04 00 00       	mov    $0x400,%edx
80103093:	e8 38 ff ff ff       	call   80102fd0 <mpsearch1>
80103098:	85 c0                	test   %eax,%eax
8010309a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010309d:	0f 84 3d 01 00 00    	je     801031e0 <mpinit+0x190>
801030a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801030a6:	8b 58 04             	mov    0x4(%eax),%ebx
801030a9:	85 db                	test   %ebx,%ebx
801030ab:	0f 84 4f 01 00 00    	je     80103200 <mpinit+0x1b0>
801030b1:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
801030b7:	83 ec 04             	sub    $0x4,%esp
801030ba:	6a 04                	push   $0x4
801030bc:	68 15 76 10 80       	push   $0x80107615
801030c1:	56                   	push   %esi
801030c2:	e8 19 15 00 00       	call   801045e0 <memcmp>
801030c7:	83 c4 10             	add    $0x10,%esp
801030ca:	85 c0                	test   %eax,%eax
801030cc:	0f 85 2e 01 00 00    	jne    80103200 <mpinit+0x1b0>
801030d2:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
801030d9:	3c 01                	cmp    $0x1,%al
801030db:	0f 95 c2             	setne  %dl
801030de:	3c 04                	cmp    $0x4,%al
801030e0:	0f 95 c0             	setne  %al
801030e3:	20 c2                	and    %al,%dl
801030e5:	0f 85 15 01 00 00    	jne    80103200 <mpinit+0x1b0>
801030eb:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
801030f2:	66 85 ff             	test   %di,%di
801030f5:	74 1a                	je     80103111 <mpinit+0xc1>
801030f7:	89 f0                	mov    %esi,%eax
801030f9:	01 f7                	add    %esi,%edi
801030fb:	31 d2                	xor    %edx,%edx
801030fd:	8d 76 00             	lea    0x0(%esi),%esi
80103100:	0f b6 08             	movzbl (%eax),%ecx
80103103:	83 c0 01             	add    $0x1,%eax
80103106:	01 ca                	add    %ecx,%edx
80103108:	39 c7                	cmp    %eax,%edi
8010310a:	75 f4                	jne    80103100 <mpinit+0xb0>
8010310c:	84 d2                	test   %dl,%dl
8010310e:	0f 95 c2             	setne  %dl
80103111:	85 f6                	test   %esi,%esi
80103113:	0f 84 e7 00 00 00    	je     80103200 <mpinit+0x1b0>
80103119:	84 d2                	test   %dl,%dl
8010311b:	0f 85 df 00 00 00    	jne    80103200 <mpinit+0x1b0>
80103121:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
80103127:	a3 7c 26 11 80       	mov    %eax,0x8011267c
8010312c:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
80103133:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
80103139:	bb 01 00 00 00       	mov    $0x1,%ebx
8010313e:	01 d6                	add    %edx,%esi
80103140:	39 c6                	cmp    %eax,%esi
80103142:	76 23                	jbe    80103167 <mpinit+0x117>
80103144:	0f b6 10             	movzbl (%eax),%edx
80103147:	80 fa 04             	cmp    $0x4,%dl
8010314a:	0f 87 ca 00 00 00    	ja     8010321a <mpinit+0x1ca>
80103150:	ff 24 95 3c 76 10 80 	jmp    *-0x7fef89c4(,%edx,4)
80103157:	89 f6                	mov    %esi,%esi
80103159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103160:	83 c0 08             	add    $0x8,%eax
80103163:	39 c6                	cmp    %eax,%esi
80103165:	77 dd                	ja     80103144 <mpinit+0xf4>
80103167:	85 db                	test   %ebx,%ebx
80103169:	0f 84 9e 00 00 00    	je     8010320d <mpinit+0x1bd>
8010316f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103172:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103176:	74 15                	je     8010318d <mpinit+0x13d>
80103178:	b8 70 00 00 00       	mov    $0x70,%eax
8010317d:	ba 22 00 00 00       	mov    $0x22,%edx
80103182:	ee                   	out    %al,(%dx)
80103183:	ba 23 00 00 00       	mov    $0x23,%edx
80103188:	ec                   	in     (%dx),%al
80103189:	83 c8 01             	or     $0x1,%eax
8010318c:	ee                   	out    %al,(%dx)
8010318d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103190:	5b                   	pop    %ebx
80103191:	5e                   	pop    %esi
80103192:	5f                   	pop    %edi
80103193:	5d                   	pop    %ebp
80103194:	c3                   	ret    
80103195:	8d 76 00             	lea    0x0(%esi),%esi
80103198:	8b 0d 00 2d 11 80    	mov    0x80112d00,%ecx
8010319e:	83 f9 07             	cmp    $0x7,%ecx
801031a1:	7f 19                	jg     801031bc <mpinit+0x16c>
801031a3:	0f b6 50 01          	movzbl 0x1(%eax),%edx
801031a7:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
801031ad:	83 c1 01             	add    $0x1,%ecx
801031b0:	89 0d 00 2d 11 80    	mov    %ecx,0x80112d00
801031b6:	88 97 80 27 11 80    	mov    %dl,-0x7feed880(%edi)
801031bc:	83 c0 14             	add    $0x14,%eax
801031bf:	e9 7c ff ff ff       	jmp    80103140 <mpinit+0xf0>
801031c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801031c8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
801031cc:	83 c0 08             	add    $0x8,%eax
801031cf:	88 15 60 27 11 80    	mov    %dl,0x80112760
801031d5:	e9 66 ff ff ff       	jmp    80103140 <mpinit+0xf0>
801031da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801031e0:	ba 00 00 01 00       	mov    $0x10000,%edx
801031e5:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801031ea:	e8 e1 fd ff ff       	call   80102fd0 <mpsearch1>
801031ef:	85 c0                	test   %eax,%eax
801031f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801031f4:	0f 85 a9 fe ff ff    	jne    801030a3 <mpinit+0x53>
801031fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103200:	83 ec 0c             	sub    $0xc,%esp
80103203:	68 fd 75 10 80       	push   $0x801075fd
80103208:	e8 83 d1 ff ff       	call   80100390 <panic>
8010320d:	83 ec 0c             	sub    $0xc,%esp
80103210:	68 1c 76 10 80       	push   $0x8010761c
80103215:	e8 76 d1 ff ff       	call   80100390 <panic>
8010321a:	31 db                	xor    %ebx,%ebx
8010321c:	e9 26 ff ff ff       	jmp    80103147 <mpinit+0xf7>
80103221:	66 90                	xchg   %ax,%ax
80103223:	66 90                	xchg   %ax,%ax
80103225:	66 90                	xchg   %ax,%ax
80103227:	66 90                	xchg   %ax,%ax
80103229:	66 90                	xchg   %ax,%ax
8010322b:	66 90                	xchg   %ax,%ax
8010322d:	66 90                	xchg   %ax,%ax
8010322f:	90                   	nop

80103230 <picinit>:
80103230:	55                   	push   %ebp
80103231:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103236:	ba 21 00 00 00       	mov    $0x21,%edx
8010323b:	89 e5                	mov    %esp,%ebp
8010323d:	ee                   	out    %al,(%dx)
8010323e:	ba a1 00 00 00       	mov    $0xa1,%edx
80103243:	ee                   	out    %al,(%dx)
80103244:	5d                   	pop    %ebp
80103245:	c3                   	ret    
80103246:	66 90                	xchg   %ax,%ax
80103248:	66 90                	xchg   %ax,%ax
8010324a:	66 90                	xchg   %ax,%ax
8010324c:	66 90                	xchg   %ax,%ax
8010324e:	66 90                	xchg   %ax,%ax

80103250 <pipealloc>:
80103250:	55                   	push   %ebp
80103251:	89 e5                	mov    %esp,%ebp
80103253:	57                   	push   %edi
80103254:	56                   	push   %esi
80103255:	53                   	push   %ebx
80103256:	83 ec 0c             	sub    $0xc,%esp
80103259:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010325c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010325f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103265:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010326b:	e8 10 db ff ff       	call   80100d80 <filealloc>
80103270:	85 c0                	test   %eax,%eax
80103272:	89 03                	mov    %eax,(%ebx)
80103274:	74 22                	je     80103298 <pipealloc+0x48>
80103276:	e8 05 db ff ff       	call   80100d80 <filealloc>
8010327b:	85 c0                	test   %eax,%eax
8010327d:	89 06                	mov    %eax,(%esi)
8010327f:	74 3f                	je     801032c0 <pipealloc+0x70>
80103281:	e8 4a f2 ff ff       	call   801024d0 <kalloc>
80103286:	85 c0                	test   %eax,%eax
80103288:	89 c7                	mov    %eax,%edi
8010328a:	75 54                	jne    801032e0 <pipealloc+0x90>
8010328c:	8b 03                	mov    (%ebx),%eax
8010328e:	85 c0                	test   %eax,%eax
80103290:	75 34                	jne    801032c6 <pipealloc+0x76>
80103292:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103298:	8b 06                	mov    (%esi),%eax
8010329a:	85 c0                	test   %eax,%eax
8010329c:	74 0c                	je     801032aa <pipealloc+0x5a>
8010329e:	83 ec 0c             	sub    $0xc,%esp
801032a1:	50                   	push   %eax
801032a2:	e8 99 db ff ff       	call   80100e40 <fileclose>
801032a7:	83 c4 10             	add    $0x10,%esp
801032aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801032ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801032b2:	5b                   	pop    %ebx
801032b3:	5e                   	pop    %esi
801032b4:	5f                   	pop    %edi
801032b5:	5d                   	pop    %ebp
801032b6:	c3                   	ret    
801032b7:	89 f6                	mov    %esi,%esi
801032b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801032c0:	8b 03                	mov    (%ebx),%eax
801032c2:	85 c0                	test   %eax,%eax
801032c4:	74 e4                	je     801032aa <pipealloc+0x5a>
801032c6:	83 ec 0c             	sub    $0xc,%esp
801032c9:	50                   	push   %eax
801032ca:	e8 71 db ff ff       	call   80100e40 <fileclose>
801032cf:	8b 06                	mov    (%esi),%eax
801032d1:	83 c4 10             	add    $0x10,%esp
801032d4:	85 c0                	test   %eax,%eax
801032d6:	75 c6                	jne    8010329e <pipealloc+0x4e>
801032d8:	eb d0                	jmp    801032aa <pipealloc+0x5a>
801032da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801032e0:	83 ec 08             	sub    $0x8,%esp
801032e3:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801032ea:	00 00 00 
801032ed:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801032f4:	00 00 00 
801032f7:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801032fe:	00 00 00 
80103301:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103308:	00 00 00 
8010330b:	68 50 76 10 80       	push   $0x80107650
80103310:	50                   	push   %eax
80103311:	e8 2a 10 00 00       	call   80104340 <initlock>
80103316:	8b 03                	mov    (%ebx),%eax
80103318:	83 c4 10             	add    $0x10,%esp
8010331b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103321:	8b 03                	mov    (%ebx),%eax
80103323:	c6 40 08 01          	movb   $0x1,0x8(%eax)
80103327:	8b 03                	mov    (%ebx),%eax
80103329:	c6 40 09 00          	movb   $0x0,0x9(%eax)
8010332d:	8b 03                	mov    (%ebx),%eax
8010332f:	89 78 0c             	mov    %edi,0xc(%eax)
80103332:	8b 06                	mov    (%esi),%eax
80103334:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
8010333a:	8b 06                	mov    (%esi),%eax
8010333c:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80103340:	8b 06                	mov    (%esi),%eax
80103342:	c6 40 09 01          	movb   $0x1,0x9(%eax)
80103346:	8b 06                	mov    (%esi),%eax
80103348:	89 78 0c             	mov    %edi,0xc(%eax)
8010334b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010334e:	31 c0                	xor    %eax,%eax
80103350:	5b                   	pop    %ebx
80103351:	5e                   	pop    %esi
80103352:	5f                   	pop    %edi
80103353:	5d                   	pop    %ebp
80103354:	c3                   	ret    
80103355:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103360 <pipeclose>:
80103360:	55                   	push   %ebp
80103361:	89 e5                	mov    %esp,%ebp
80103363:	56                   	push   %esi
80103364:	53                   	push   %ebx
80103365:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103368:	8b 75 0c             	mov    0xc(%ebp),%esi
8010336b:	83 ec 0c             	sub    $0xc,%esp
8010336e:	53                   	push   %ebx
8010336f:	e8 0c 11 00 00       	call   80104480 <acquire>
80103374:	83 c4 10             	add    $0x10,%esp
80103377:	85 f6                	test   %esi,%esi
80103379:	74 45                	je     801033c0 <pipeclose+0x60>
8010337b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103381:	83 ec 0c             	sub    $0xc,%esp
80103384:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010338b:	00 00 00 
8010338e:	50                   	push   %eax
8010338f:	e8 ac 0b 00 00       	call   80103f40 <wakeup>
80103394:	83 c4 10             	add    $0x10,%esp
80103397:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010339d:	85 d2                	test   %edx,%edx
8010339f:	75 0a                	jne    801033ab <pipeclose+0x4b>
801033a1:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801033a7:	85 c0                	test   %eax,%eax
801033a9:	74 35                	je     801033e0 <pipeclose+0x80>
801033ab:	89 5d 08             	mov    %ebx,0x8(%ebp)
801033ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
801033b1:	5b                   	pop    %ebx
801033b2:	5e                   	pop    %esi
801033b3:	5d                   	pop    %ebp
801033b4:	e9 87 11 00 00       	jmp    80104540 <release>
801033b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801033c0:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
801033c6:	83 ec 0c             	sub    $0xc,%esp
801033c9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801033d0:	00 00 00 
801033d3:	50                   	push   %eax
801033d4:	e8 67 0b 00 00       	call   80103f40 <wakeup>
801033d9:	83 c4 10             	add    $0x10,%esp
801033dc:	eb b9                	jmp    80103397 <pipeclose+0x37>
801033de:	66 90                	xchg   %ax,%ax
801033e0:	83 ec 0c             	sub    $0xc,%esp
801033e3:	53                   	push   %ebx
801033e4:	e8 57 11 00 00       	call   80104540 <release>
801033e9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801033ec:	83 c4 10             	add    $0x10,%esp
801033ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
801033f2:	5b                   	pop    %ebx
801033f3:	5e                   	pop    %esi
801033f4:	5d                   	pop    %ebp
801033f5:	e9 26 ef ff ff       	jmp    80102320 <kfree>
801033fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103400 <pipewrite>:
80103400:	55                   	push   %ebp
80103401:	89 e5                	mov    %esp,%ebp
80103403:	57                   	push   %edi
80103404:	56                   	push   %esi
80103405:	53                   	push   %ebx
80103406:	83 ec 28             	sub    $0x28,%esp
80103409:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010340c:	53                   	push   %ebx
8010340d:	e8 6e 10 00 00       	call   80104480 <acquire>
80103412:	8b 45 10             	mov    0x10(%ebp),%eax
80103415:	83 c4 10             	add    $0x10,%esp
80103418:	85 c0                	test   %eax,%eax
8010341a:	0f 8e c9 00 00 00    	jle    801034e9 <pipewrite+0xe9>
80103420:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103423:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80103429:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
8010342f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103432:	03 4d 10             	add    0x10(%ebp),%ecx
80103435:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80103438:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
8010343e:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
80103444:	39 d0                	cmp    %edx,%eax
80103446:	75 71                	jne    801034b9 <pipewrite+0xb9>
80103448:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010344e:	85 c0                	test   %eax,%eax
80103450:	74 4e                	je     801034a0 <pipewrite+0xa0>
80103452:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80103458:	eb 3a                	jmp    80103494 <pipewrite+0x94>
8010345a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103460:	83 ec 0c             	sub    $0xc,%esp
80103463:	57                   	push   %edi
80103464:	e8 d7 0a 00 00       	call   80103f40 <wakeup>
80103469:	5a                   	pop    %edx
8010346a:	59                   	pop    %ecx
8010346b:	53                   	push   %ebx
8010346c:	56                   	push   %esi
8010346d:	e8 1e 09 00 00       	call   80103d90 <sleep>
80103472:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103478:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010347e:	83 c4 10             	add    $0x10,%esp
80103481:	05 00 02 00 00       	add    $0x200,%eax
80103486:	39 c2                	cmp    %eax,%edx
80103488:	75 36                	jne    801034c0 <pipewrite+0xc0>
8010348a:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103490:	85 c0                	test   %eax,%eax
80103492:	74 0c                	je     801034a0 <pipewrite+0xa0>
80103494:	e8 47 03 00 00       	call   801037e0 <myproc>
80103499:	8b 40 24             	mov    0x24(%eax),%eax
8010349c:	85 c0                	test   %eax,%eax
8010349e:	74 c0                	je     80103460 <pipewrite+0x60>
801034a0:	83 ec 0c             	sub    $0xc,%esp
801034a3:	53                   	push   %ebx
801034a4:	e8 97 10 00 00       	call   80104540 <release>
801034a9:	83 c4 10             	add    $0x10,%esp
801034ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801034b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801034b4:	5b                   	pop    %ebx
801034b5:	5e                   	pop    %esi
801034b6:	5f                   	pop    %edi
801034b7:	5d                   	pop    %ebp
801034b8:	c3                   	ret    
801034b9:	89 c2                	mov    %eax,%edx
801034bb:	90                   	nop
801034bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801034c0:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801034c3:	8d 42 01             	lea    0x1(%edx),%eax
801034c6:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801034cc:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
801034d2:	83 c6 01             	add    $0x1,%esi
801034d5:	0f b6 4e ff          	movzbl -0x1(%esi),%ecx
801034d9:	3b 75 e0             	cmp    -0x20(%ebp),%esi
801034dc:	89 75 e4             	mov    %esi,-0x1c(%ebp)
801034df:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
801034e3:	0f 85 4f ff ff ff    	jne    80103438 <pipewrite+0x38>
801034e9:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801034ef:	83 ec 0c             	sub    $0xc,%esp
801034f2:	50                   	push   %eax
801034f3:	e8 48 0a 00 00       	call   80103f40 <wakeup>
801034f8:	89 1c 24             	mov    %ebx,(%esp)
801034fb:	e8 40 10 00 00       	call   80104540 <release>
80103500:	83 c4 10             	add    $0x10,%esp
80103503:	8b 45 10             	mov    0x10(%ebp),%eax
80103506:	eb a9                	jmp    801034b1 <pipewrite+0xb1>
80103508:	90                   	nop
80103509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103510 <piperead>:
80103510:	55                   	push   %ebp
80103511:	89 e5                	mov    %esp,%ebp
80103513:	57                   	push   %edi
80103514:	56                   	push   %esi
80103515:	53                   	push   %ebx
80103516:	83 ec 18             	sub    $0x18,%esp
80103519:	8b 75 08             	mov    0x8(%ebp),%esi
8010351c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010351f:	56                   	push   %esi
80103520:	e8 5b 0f 00 00       	call   80104480 <acquire>
80103525:	83 c4 10             	add    $0x10,%esp
80103528:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
8010352e:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103534:	75 6a                	jne    801035a0 <piperead+0x90>
80103536:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
8010353c:	85 db                	test   %ebx,%ebx
8010353e:	0f 84 c4 00 00 00    	je     80103608 <piperead+0xf8>
80103544:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
8010354a:	eb 2d                	jmp    80103579 <piperead+0x69>
8010354c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103550:	83 ec 08             	sub    $0x8,%esp
80103553:	56                   	push   %esi
80103554:	53                   	push   %ebx
80103555:	e8 36 08 00 00       	call   80103d90 <sleep>
8010355a:	83 c4 10             	add    $0x10,%esp
8010355d:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103563:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103569:	75 35                	jne    801035a0 <piperead+0x90>
8010356b:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103571:	85 d2                	test   %edx,%edx
80103573:	0f 84 8f 00 00 00    	je     80103608 <piperead+0xf8>
80103579:	e8 62 02 00 00       	call   801037e0 <myproc>
8010357e:	8b 48 24             	mov    0x24(%eax),%ecx
80103581:	85 c9                	test   %ecx,%ecx
80103583:	74 cb                	je     80103550 <piperead+0x40>
80103585:	83 ec 0c             	sub    $0xc,%esp
80103588:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010358d:	56                   	push   %esi
8010358e:	e8 ad 0f 00 00       	call   80104540 <release>
80103593:	83 c4 10             	add    $0x10,%esp
80103596:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103599:	89 d8                	mov    %ebx,%eax
8010359b:	5b                   	pop    %ebx
8010359c:	5e                   	pop    %esi
8010359d:	5f                   	pop    %edi
8010359e:	5d                   	pop    %ebp
8010359f:	c3                   	ret    
801035a0:	8b 45 10             	mov    0x10(%ebp),%eax
801035a3:	85 c0                	test   %eax,%eax
801035a5:	7e 61                	jle    80103608 <piperead+0xf8>
801035a7:	31 db                	xor    %ebx,%ebx
801035a9:	eb 13                	jmp    801035be <piperead+0xae>
801035ab:	90                   	nop
801035ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801035b0:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801035b6:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801035bc:	74 1f                	je     801035dd <piperead+0xcd>
801035be:	8d 41 01             	lea    0x1(%ecx),%eax
801035c1:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801035c7:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
801035cd:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
801035d2:	88 04 1f             	mov    %al,(%edi,%ebx,1)
801035d5:	83 c3 01             	add    $0x1,%ebx
801035d8:	39 5d 10             	cmp    %ebx,0x10(%ebp)
801035db:	75 d3                	jne    801035b0 <piperead+0xa0>
801035dd:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
801035e3:	83 ec 0c             	sub    $0xc,%esp
801035e6:	50                   	push   %eax
801035e7:	e8 54 09 00 00       	call   80103f40 <wakeup>
801035ec:	89 34 24             	mov    %esi,(%esp)
801035ef:	e8 4c 0f 00 00       	call   80104540 <release>
801035f4:	83 c4 10             	add    $0x10,%esp
801035f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801035fa:	89 d8                	mov    %ebx,%eax
801035fc:	5b                   	pop    %ebx
801035fd:	5e                   	pop    %esi
801035fe:	5f                   	pop    %edi
801035ff:	5d                   	pop    %ebp
80103600:	c3                   	ret    
80103601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103608:	31 db                	xor    %ebx,%ebx
8010360a:	eb d1                	jmp    801035dd <piperead+0xcd>
8010360c:	66 90                	xchg   %ax,%ax
8010360e:	66 90                	xchg   %ax,%ax

80103610 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103610:	55                   	push   %ebp
80103611:	89 e5                	mov    %esp,%ebp
80103613:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103614:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103619:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
8010361c:	68 20 2d 11 80       	push   $0x80112d20
80103621:	e8 5a 0e 00 00       	call   80104480 <acquire>
80103626:	83 c4 10             	add    $0x10,%esp
80103629:	eb 10                	jmp    8010363b <allocproc+0x2b>
8010362b:	90                   	nop
8010362c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103630:	83 c3 7c             	add    $0x7c,%ebx
80103633:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103639:	74 75                	je     801036b0 <allocproc+0xa0>
    if(p->state == UNUSED)
8010363b:	8b 43 0c             	mov    0xc(%ebx),%eax
8010363e:	85 c0                	test   %eax,%eax
80103640:	75 ee                	jne    80103630 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103642:	a1 04 a0 10 80       	mov    0x8010a004,%eax

  release(&ptable.lock);
80103647:	83 ec 0c             	sub    $0xc,%esp

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
8010364a:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;

  release(&ptable.lock);
80103651:	68 20 2d 11 80       	push   $0x80112d20
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103656:	8d 50 01             	lea    0x1(%eax),%edx
80103659:	89 43 10             	mov    %eax,0x10(%ebx)
8010365c:	89 15 04 a0 10 80    	mov    %edx,0x8010a004

  release(&ptable.lock);
80103662:	e8 d9 0e 00 00       	call   80104540 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80103667:	e8 64 ee ff ff       	call   801024d0 <kalloc>
8010366c:	83 c4 10             	add    $0x10,%esp
8010366f:	85 c0                	test   %eax,%eax
80103671:	89 43 08             	mov    %eax,0x8(%ebx)
80103674:	74 51                	je     801036c7 <allocproc+0xb7>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103676:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010367c:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
8010367f:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103684:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
80103687:	c7 40 14 91 57 10 80 	movl   $0x80105791,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010368e:	6a 14                	push   $0x14
80103690:	6a 00                	push   $0x0
80103692:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
80103693:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103696:	e8 f5 0e 00 00       	call   80104590 <memset>
  p->context->eip = (uint)forkret;
8010369b:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
8010369e:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
801036a1:	c7 40 10 d0 36 10 80 	movl   $0x801036d0,0x10(%eax)

  return p;
801036a8:	89 d8                	mov    %ebx,%eax
}
801036aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801036ad:	c9                   	leave  
801036ae:	c3                   	ret    
801036af:	90                   	nop

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
801036b0:	83 ec 0c             	sub    $0xc,%esp
801036b3:	68 20 2d 11 80       	push   $0x80112d20
801036b8:	e8 83 0e 00 00       	call   80104540 <release>
  return 0;
801036bd:	83 c4 10             	add    $0x10,%esp
801036c0:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
801036c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801036c5:	c9                   	leave  
801036c6:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
801036c7:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
801036ce:	eb da                	jmp    801036aa <allocproc+0x9a>

801036d0 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
801036d0:	55                   	push   %ebp
801036d1:	89 e5                	mov    %esp,%ebp
801036d3:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
801036d6:	68 20 2d 11 80       	push   $0x80112d20
801036db:	e8 60 0e 00 00       	call   80104540 <release>

  if (first) {
801036e0:	a1 00 a0 10 80       	mov    0x8010a000,%eax
801036e5:	83 c4 10             	add    $0x10,%esp
801036e8:	85 c0                	test   %eax,%eax
801036ea:	75 04                	jne    801036f0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
801036ec:	c9                   	leave  
801036ed:	c3                   	ret    
801036ee:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
801036f0:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
801036f3:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
801036fa:	00 00 00 
    iinit(ROOTDEV);
801036fd:	6a 01                	push   $0x1
801036ff:	e8 8c dd ff ff       	call   80101490 <iinit>
    initlog(ROOTDEV);
80103704:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010370b:	e8 00 f4 ff ff       	call   80102b10 <initlog>
80103710:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
80103713:	c9                   	leave  
80103714:	c3                   	ret    
80103715:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103720 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
80103720:	55                   	push   %ebp
80103721:	89 e5                	mov    %esp,%ebp
80103723:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
80103726:	68 55 76 10 80       	push   $0x80107655
8010372b:	68 20 2d 11 80       	push   $0x80112d20
80103730:	e8 0b 0c 00 00       	call   80104340 <initlock>
}
80103735:	83 c4 10             	add    $0x10,%esp
80103738:	c9                   	leave  
80103739:	c3                   	ret    
8010373a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103740 <mycpu>:

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
80103740:	55                   	push   %ebp
80103741:	89 e5                	mov    %esp,%ebp
80103743:	56                   	push   %esi
80103744:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103745:	9c                   	pushf  
80103746:	58                   	pop    %eax
  int apicid, i;
  
  if(readeflags()&FL_IF)
80103747:	f6 c4 02             	test   $0x2,%ah
8010374a:	75 5b                	jne    801037a7 <mycpu+0x67>
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
8010374c:	e8 ef ef ff ff       	call   80102740 <lapicid>
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103751:	8b 35 00 2d 11 80    	mov    0x80112d00,%esi
80103757:	85 f6                	test   %esi,%esi
80103759:	7e 3f                	jle    8010379a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
8010375b:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
80103762:	39 d0                	cmp    %edx,%eax
80103764:	74 30                	je     80103796 <mycpu+0x56>
80103766:	b9 30 28 11 80       	mov    $0x80112830,%ecx
8010376b:	31 d2                	xor    %edx,%edx
8010376d:	8d 76 00             	lea    0x0(%esi),%esi
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103770:	83 c2 01             	add    $0x1,%edx
80103773:	39 f2                	cmp    %esi,%edx
80103775:	74 23                	je     8010379a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
80103777:	0f b6 19             	movzbl (%ecx),%ebx
8010377a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103780:	39 d8                	cmp    %ebx,%eax
80103782:	75 ec                	jne    80103770 <mycpu+0x30>
      return &cpus[i];
80103784:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
  }
  panic("unknown apicid\n");
}
8010378a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010378d:	5b                   	pop    %ebx
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
8010378e:	05 80 27 11 80       	add    $0x80112780,%eax
  }
  panic("unknown apicid\n");
}
80103793:	5e                   	pop    %esi
80103794:	5d                   	pop    %ebp
80103795:	c3                   	ret    
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103796:	31 d2                	xor    %edx,%edx
80103798:	eb ea                	jmp    80103784 <mycpu+0x44>
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
8010379a:	83 ec 0c             	sub    $0xc,%esp
8010379d:	68 5c 76 10 80       	push   $0x8010765c
801037a2:	e8 e9 cb ff ff       	call   80100390 <panic>
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
801037a7:	83 ec 0c             	sub    $0xc,%esp
801037aa:	68 8c 77 10 80       	push   $0x8010778c
801037af:	e8 dc cb ff ff       	call   80100390 <panic>
801037b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037c0 <cpuid>:
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
801037c0:	55                   	push   %ebp
801037c1:	89 e5                	mov    %esp,%ebp
801037c3:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
801037c6:	e8 75 ff ff ff       	call   80103740 <mycpu>
801037cb:	2d 80 27 11 80       	sub    $0x80112780,%eax
}
801037d0:	c9                   	leave  
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
801037d1:	c1 f8 04             	sar    $0x4,%eax
801037d4:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
801037da:	c3                   	ret    
801037db:	90                   	nop
801037dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801037e0 <myproc>:
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
801037e0:	55                   	push   %ebp
801037e1:	89 e5                	mov    %esp,%ebp
801037e3:	53                   	push   %ebx
801037e4:	83 ec 04             	sub    $0x4,%esp
  struct cpu *c;
  struct proc *p;
  pushcli();
801037e7:	e8 c4 0b 00 00       	call   801043b0 <pushcli>
  c = mycpu();
801037ec:	e8 4f ff ff ff       	call   80103740 <mycpu>
  p = c->proc;
801037f1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801037f7:	e8 f4 0b 00 00       	call   801043f0 <popcli>
  return p;
}
801037fc:	83 c4 04             	add    $0x4,%esp
801037ff:	89 d8                	mov    %ebx,%eax
80103801:	5b                   	pop    %ebx
80103802:	5d                   	pop    %ebp
80103803:	c3                   	ret    
80103804:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010380a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103810 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
80103810:	55                   	push   %ebp
80103811:	89 e5                	mov    %esp,%ebp
80103813:	53                   	push   %ebx
80103814:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
80103817:	e8 f4 fd ff ff       	call   80103610 <allocproc>
8010381c:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
8010381e:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
  if((p->pgdir = setupkvm()) == 0)
80103823:	e8 78 35 00 00       	call   80106da0 <setupkvm>
80103828:	85 c0                	test   %eax,%eax
8010382a:	89 43 04             	mov    %eax,0x4(%ebx)
8010382d:	0f 84 bd 00 00 00    	je     801038f0 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103833:	83 ec 04             	sub    $0x4,%esp
80103836:	68 2c 00 00 00       	push   $0x2c
8010383b:	68 60 a4 10 80       	push   $0x8010a460
80103840:	50                   	push   %eax
80103841:	e8 6a 32 00 00       	call   80106ab0 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
80103846:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
80103849:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010384f:	6a 4c                	push   $0x4c
80103851:	6a 00                	push   $0x0
80103853:	ff 73 18             	pushl  0x18(%ebx)
80103856:	e8 35 0d 00 00       	call   80104590 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010385b:	8b 43 18             	mov    0x18(%ebx),%eax
8010385e:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103863:	b9 23 00 00 00       	mov    $0x23,%ecx
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103868:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010386b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010386f:	8b 43 18             	mov    0x18(%ebx),%eax
80103872:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103876:	8b 43 18             	mov    0x18(%ebx),%eax
80103879:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010387d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103881:	8b 43 18             	mov    0x18(%ebx),%eax
80103884:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103888:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010388c:	8b 43 18             	mov    0x18(%ebx),%eax
8010388f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103896:	8b 43 18             	mov    0x18(%ebx),%eax
80103899:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
801038a0:	8b 43 18             	mov    0x18(%ebx),%eax
801038a3:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
801038aa:	8d 43 6c             	lea    0x6c(%ebx),%eax
801038ad:	6a 10                	push   $0x10
801038af:	68 85 76 10 80       	push   $0x80107685
801038b4:	50                   	push   %eax
801038b5:	e8 b6 0e 00 00       	call   80104770 <safestrcpy>
  p->cwd = namei("/");
801038ba:	c7 04 24 8e 76 10 80 	movl   $0x8010768e,(%esp)
801038c1:	e8 2a e6 ff ff       	call   80101ef0 <namei>
801038c6:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
801038c9:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801038d0:	e8 ab 0b 00 00       	call   80104480 <acquire>

  p->state = RUNNABLE;
801038d5:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
801038dc:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801038e3:	e8 58 0c 00 00       	call   80104540 <release>
}
801038e8:	83 c4 10             	add    $0x10,%esp
801038eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038ee:	c9                   	leave  
801038ef:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
801038f0:	83 ec 0c             	sub    $0xc,%esp
801038f3:	68 6c 76 10 80       	push   $0x8010766c
801038f8:	e8 93 ca ff ff       	call   80100390 <panic>
801038fd:	8d 76 00             	lea    0x0(%esi),%esi

80103900 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103900:	55                   	push   %ebp
80103901:	89 e5                	mov    %esp,%ebp
80103903:	56                   	push   %esi
80103904:	53                   	push   %ebx
80103905:	8b 75 08             	mov    0x8(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103908:	e8 a3 0a 00 00       	call   801043b0 <pushcli>
  c = mycpu();
8010390d:	e8 2e fe ff ff       	call   80103740 <mycpu>
  p = c->proc;
80103912:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103918:	e8 d3 0a 00 00       	call   801043f0 <popcli>
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
8010391d:	83 fe 00             	cmp    $0x0,%esi
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
80103920:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
80103922:	7e 34                	jle    80103958 <growproc+0x58>
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103924:	83 ec 04             	sub    $0x4,%esp
80103927:	01 c6                	add    %eax,%esi
80103929:	56                   	push   %esi
8010392a:	50                   	push   %eax
8010392b:	ff 73 04             	pushl  0x4(%ebx)
8010392e:	e8 bd 32 00 00       	call   80106bf0 <allocuvm>
80103933:	83 c4 10             	add    $0x10,%esp
80103936:	85 c0                	test   %eax,%eax
80103938:	74 36                	je     80103970 <growproc+0x70>
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
8010393a:	83 ec 0c             	sub    $0xc,%esp
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
8010393d:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
8010393f:	53                   	push   %ebx
80103940:	e8 5b 30 00 00       	call   801069a0 <switchuvm>
  return 0;
80103945:	83 c4 10             	add    $0x10,%esp
80103948:	31 c0                	xor    %eax,%eax
}
8010394a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010394d:	5b                   	pop    %ebx
8010394e:	5e                   	pop    %esi
8010394f:	5d                   	pop    %ebp
80103950:	c3                   	ret    
80103951:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
80103958:	74 e0                	je     8010393a <growproc+0x3a>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
8010395a:	83 ec 04             	sub    $0x4,%esp
8010395d:	01 c6                	add    %eax,%esi
8010395f:	56                   	push   %esi
80103960:	50                   	push   %eax
80103961:	ff 73 04             	pushl  0x4(%ebx)
80103964:	e8 87 33 00 00       	call   80106cf0 <deallocuvm>
80103969:	83 c4 10             	add    $0x10,%esp
8010396c:	85 c0                	test   %eax,%eax
8010396e:	75 ca                	jne    8010393a <growproc+0x3a>
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
80103970:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103975:	eb d3                	jmp    8010394a <growproc+0x4a>
80103977:	89 f6                	mov    %esi,%esi
80103979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103980 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103980:	55                   	push   %ebp
80103981:	89 e5                	mov    %esp,%ebp
80103983:	57                   	push   %edi
80103984:	56                   	push   %esi
80103985:	53                   	push   %ebx
80103986:	83 ec 1c             	sub    $0x1c,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103989:	e8 22 0a 00 00       	call   801043b0 <pushcli>
  c = mycpu();
8010398e:	e8 ad fd ff ff       	call   80103740 <mycpu>
  p = c->proc;
80103993:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103999:	e8 52 0a 00 00       	call   801043f0 <popcli>
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
8010399e:	e8 6d fc ff ff       	call   80103610 <allocproc>
801039a3:	85 c0                	test   %eax,%eax
801039a5:	89 c7                	mov    %eax,%edi
801039a7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801039aa:	0f 84 b5 00 00 00    	je     80103a65 <fork+0xe5>
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm_cow(curproc->pgdir, curproc->sz)) == 0){
801039b0:	83 ec 08             	sub    $0x8,%esp
801039b3:	ff 33                	pushl  (%ebx)
801039b5:	ff 73 04             	pushl  0x4(%ebx)
801039b8:	e8 b3 34 00 00       	call   80106e70 <copyuvm_cow>
801039bd:	83 c4 10             	add    $0x10,%esp
801039c0:	85 c0                	test   %eax,%eax
801039c2:	89 47 04             	mov    %eax,0x4(%edi)
801039c5:	0f 84 a1 00 00 00    	je     80103a6c <fork+0xec>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
801039cb:	8b 03                	mov    (%ebx),%eax
801039cd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801039d0:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
801039d2:	89 59 14             	mov    %ebx,0x14(%ecx)
  *np->tf = *curproc->tf;
801039d5:	89 c8                	mov    %ecx,%eax
801039d7:	8b 79 18             	mov    0x18(%ecx),%edi
801039da:	8b 73 18             	mov    0x18(%ebx),%esi
801039dd:	b9 13 00 00 00       	mov    $0x13,%ecx
801039e2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
801039e4:	31 f6                	xor    %esi,%esi
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
801039e6:	8b 40 18             	mov    0x18(%eax),%eax
801039e9:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
801039f0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
801039f4:	85 c0                	test   %eax,%eax
801039f6:	74 13                	je     80103a0b <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
801039f8:	83 ec 0c             	sub    $0xc,%esp
801039fb:	50                   	push   %eax
801039fc:	e8 ef d3 ff ff       	call   80100df0 <filedup>
80103a01:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103a04:	83 c4 10             	add    $0x10,%esp
80103a07:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103a0b:	83 c6 01             	add    $0x1,%esi
80103a0e:	83 fe 10             	cmp    $0x10,%esi
80103a11:	75 dd                	jne    801039f0 <fork+0x70>
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
80103a13:	83 ec 0c             	sub    $0xc,%esp
80103a16:	ff 73 68             	pushl  0x68(%ebx)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103a19:	83 c3 6c             	add    $0x6c,%ebx
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
80103a1c:	e8 3f dc ff ff       	call   80101660 <idup>
80103a21:	8b 7d e4             	mov    -0x1c(%ebp),%edi

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103a24:	83 c4 0c             	add    $0xc,%esp
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
80103a27:	89 47 68             	mov    %eax,0x68(%edi)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103a2a:	8d 47 6c             	lea    0x6c(%edi),%eax
80103a2d:	6a 10                	push   $0x10
80103a2f:	53                   	push   %ebx
80103a30:	50                   	push   %eax
80103a31:	e8 3a 0d 00 00       	call   80104770 <safestrcpy>

  pid = np->pid;
80103a36:	8b 5f 10             	mov    0x10(%edi),%ebx

  acquire(&ptable.lock);
80103a39:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103a40:	e8 3b 0a 00 00       	call   80104480 <acquire>

  np->state = RUNNABLE;
80103a45:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)

  release(&ptable.lock);
80103a4c:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103a53:	e8 e8 0a 00 00       	call   80104540 <release>

  return pid;
80103a58:	83 c4 10             	add    $0x10,%esp
80103a5b:	89 d8                	mov    %ebx,%eax
}
80103a5d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103a60:	5b                   	pop    %ebx
80103a61:	5e                   	pop    %esi
80103a62:	5f                   	pop    %edi
80103a63:	5d                   	pop    %ebp
80103a64:	c3                   	ret    
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103a65:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a6a:	eb f1                	jmp    80103a5d <fork+0xdd>
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm_cow(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
80103a6c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103a6f:	83 ec 0c             	sub    $0xc,%esp
80103a72:	ff 77 08             	pushl  0x8(%edi)
80103a75:	e8 a6 e8 ff ff       	call   80102320 <kfree>
    np->kstack = 0;
80103a7a:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%edi)
    np->state = UNUSED;
80103a81:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
    return -1;
80103a88:	83 c4 10             	add    $0x10,%esp
80103a8b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a90:	eb cb                	jmp    80103a5d <fork+0xdd>
80103a92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103aa0 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103aa0:	55                   	push   %ebp
80103aa1:	89 e5                	mov    %esp,%ebp
80103aa3:	57                   	push   %edi
80103aa4:	56                   	push   %esi
80103aa5:	53                   	push   %ebx
80103aa6:	83 ec 0c             	sub    $0xc,%esp
  struct proc *p;
  struct cpu *c = mycpu();
80103aa9:	e8 92 fc ff ff       	call   80103740 <mycpu>
80103aae:	8d 78 04             	lea    0x4(%eax),%edi
80103ab1:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103ab3:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103aba:	00 00 00 
80103abd:	8d 76 00             	lea    0x0(%esi),%esi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103ac0:	fb                   	sti    
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103ac1:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ac4:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103ac9:	68 20 2d 11 80       	push   $0x80112d20
80103ace:	e8 ad 09 00 00       	call   80104480 <acquire>
80103ad3:	83 c4 10             	add    $0x10,%esp
80103ad6:	eb 13                	jmp    80103aeb <scheduler+0x4b>
80103ad8:	90                   	nop
80103ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ae0:	83 c3 7c             	add    $0x7c,%ebx
80103ae3:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103ae9:	74 45                	je     80103b30 <scheduler+0x90>
      if(p->state != RUNNABLE)
80103aeb:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103aef:	75 ef                	jne    80103ae0 <scheduler+0x40>

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
80103af1:	83 ec 0c             	sub    $0xc,%esp
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
80103af4:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103afa:	53                   	push   %ebx
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103afb:	83 c3 7c             	add    $0x7c,%ebx

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
80103afe:	e8 9d 2e 00 00       	call   801069a0 <switchuvm>
      p->state = RUNNING;

      swtch(&(c->scheduler), p->context);
80103b03:	58                   	pop    %eax
80103b04:	5a                   	pop    %edx
80103b05:	ff 73 a0             	pushl  -0x60(%ebx)
80103b08:	57                   	push   %edi
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;
80103b09:	c7 43 90 04 00 00 00 	movl   $0x4,-0x70(%ebx)

      swtch(&(c->scheduler), p->context);
80103b10:	e8 b6 0c 00 00       	call   801047cb <swtch>
      switchkvm();
80103b15:	e8 66 2e 00 00       	call   80106980 <switchkvm>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103b1a:	83 c4 10             	add    $0x10,%esp
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b1d:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
      swtch(&(c->scheduler), p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103b23:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103b2a:	00 00 00 
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b2d:	75 bc                	jne    80103aeb <scheduler+0x4b>
80103b2f:	90                   	nop

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
    }
    release(&ptable.lock);
80103b30:	83 ec 0c             	sub    $0xc,%esp
80103b33:	68 20 2d 11 80       	push   $0x80112d20
80103b38:	e8 03 0a 00 00       	call   80104540 <release>

  }
80103b3d:	83 c4 10             	add    $0x10,%esp
80103b40:	e9 7b ff ff ff       	jmp    80103ac0 <scheduler+0x20>
80103b45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b50 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103b50:	55                   	push   %ebp
80103b51:	89 e5                	mov    %esp,%ebp
80103b53:	56                   	push   %esi
80103b54:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103b55:	e8 56 08 00 00       	call   801043b0 <pushcli>
  c = mycpu();
80103b5a:	e8 e1 fb ff ff       	call   80103740 <mycpu>
  p = c->proc;
80103b5f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103b65:	e8 86 08 00 00       	call   801043f0 <popcli>
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
80103b6a:	83 ec 0c             	sub    $0xc,%esp
80103b6d:	68 20 2d 11 80       	push   $0x80112d20
80103b72:	e8 d9 08 00 00       	call   80104450 <holding>
80103b77:	83 c4 10             	add    $0x10,%esp
80103b7a:	85 c0                	test   %eax,%eax
80103b7c:	74 4f                	je     80103bcd <sched+0x7d>
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
80103b7e:	e8 bd fb ff ff       	call   80103740 <mycpu>
80103b83:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103b8a:	75 68                	jne    80103bf4 <sched+0xa4>
    panic("sched locks");
  if(p->state == RUNNING)
80103b8c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103b90:	74 55                	je     80103be7 <sched+0x97>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103b92:	9c                   	pushf  
80103b93:	58                   	pop    %eax
    panic("sched running");
  if(readeflags()&FL_IF)
80103b94:	f6 c4 02             	test   $0x2,%ah
80103b97:	75 41                	jne    80103bda <sched+0x8a>
    panic("sched interruptible");
  intena = mycpu()->intena;
80103b99:	e8 a2 fb ff ff       	call   80103740 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103b9e:	83 c3 1c             	add    $0x1c,%ebx
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
80103ba1:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103ba7:	e8 94 fb ff ff       	call   80103740 <mycpu>
80103bac:	83 ec 08             	sub    $0x8,%esp
80103baf:	ff 70 04             	pushl  0x4(%eax)
80103bb2:	53                   	push   %ebx
80103bb3:	e8 13 0c 00 00       	call   801047cb <swtch>
  mycpu()->intena = intena;
80103bb8:	e8 83 fb ff ff       	call   80103740 <mycpu>
}
80103bbd:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
80103bc0:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103bc6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103bc9:	5b                   	pop    %ebx
80103bca:	5e                   	pop    %esi
80103bcb:	5d                   	pop    %ebp
80103bcc:	c3                   	ret    
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103bcd:	83 ec 0c             	sub    $0xc,%esp
80103bd0:	68 90 76 10 80       	push   $0x80107690
80103bd5:	e8 b6 c7 ff ff       	call   80100390 <panic>
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103bda:	83 ec 0c             	sub    $0xc,%esp
80103bdd:	68 bc 76 10 80       	push   $0x801076bc
80103be2:	e8 a9 c7 ff ff       	call   80100390 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
80103be7:	83 ec 0c             	sub    $0xc,%esp
80103bea:	68 ae 76 10 80       	push   $0x801076ae
80103bef:	e8 9c c7 ff ff       	call   80100390 <panic>
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
80103bf4:	83 ec 0c             	sub    $0xc,%esp
80103bf7:	68 a2 76 10 80       	push   $0x801076a2
80103bfc:	e8 8f c7 ff ff       	call   80100390 <panic>
80103c01:	eb 0d                	jmp    80103c10 <exit>
80103c03:	90                   	nop
80103c04:	90                   	nop
80103c05:	90                   	nop
80103c06:	90                   	nop
80103c07:	90                   	nop
80103c08:	90                   	nop
80103c09:	90                   	nop
80103c0a:	90                   	nop
80103c0b:	90                   	nop
80103c0c:	90                   	nop
80103c0d:	90                   	nop
80103c0e:	90                   	nop
80103c0f:	90                   	nop

80103c10 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103c10:	55                   	push   %ebp
80103c11:	89 e5                	mov    %esp,%ebp
80103c13:	57                   	push   %edi
80103c14:	56                   	push   %esi
80103c15:	53                   	push   %ebx
80103c16:	83 ec 0c             	sub    $0xc,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103c19:	e8 92 07 00 00       	call   801043b0 <pushcli>
  c = mycpu();
80103c1e:	e8 1d fb ff ff       	call   80103740 <mycpu>
  p = c->proc;
80103c23:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103c29:	e8 c2 07 00 00       	call   801043f0 <popcli>
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
80103c2e:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103c34:	8d 5e 28             	lea    0x28(%esi),%ebx
80103c37:	8d 7e 68             	lea    0x68(%esi),%edi
80103c3a:	0f 84 e7 00 00 00    	je     80103d27 <exit+0x117>
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
80103c40:	8b 03                	mov    (%ebx),%eax
80103c42:	85 c0                	test   %eax,%eax
80103c44:	74 12                	je     80103c58 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103c46:	83 ec 0c             	sub    $0xc,%esp
80103c49:	50                   	push   %eax
80103c4a:	e8 f1 d1 ff ff       	call   80100e40 <fileclose>
      curproc->ofile[fd] = 0;
80103c4f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103c55:	83 c4 10             	add    $0x10,%esp
80103c58:	83 c3 04             	add    $0x4,%ebx

  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103c5b:	39 df                	cmp    %ebx,%edi
80103c5d:	75 e1                	jne    80103c40 <exit+0x30>
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
80103c5f:	e8 4c ef ff ff       	call   80102bb0 <begin_op>
  iput(curproc->cwd);
80103c64:	83 ec 0c             	sub    $0xc,%esp
80103c67:	ff 76 68             	pushl  0x68(%esi)
80103c6a:	e8 51 db ff ff       	call   801017c0 <iput>
  end_op();
80103c6f:	e8 ac ef ff ff       	call   80102c20 <end_op>
  curproc->cwd = 0;
80103c74:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)

  acquire(&ptable.lock);
80103c7b:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103c82:	e8 f9 07 00 00       	call   80104480 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);
80103c87:	8b 56 14             	mov    0x14(%esi),%edx
80103c8a:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c8d:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103c92:	eb 0e                	jmp    80103ca2 <exit+0x92>
80103c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c98:	83 c0 7c             	add    $0x7c,%eax
80103c9b:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103ca0:	74 1c                	je     80103cbe <exit+0xae>
    if(p->state == SLEEPING && p->chan == chan)
80103ca2:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103ca6:	75 f0                	jne    80103c98 <exit+0x88>
80103ca8:	3b 50 20             	cmp    0x20(%eax),%edx
80103cab:	75 eb                	jne    80103c98 <exit+0x88>
      p->state = RUNNABLE;
80103cad:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103cb4:	83 c0 7c             	add    $0x7c,%eax
80103cb7:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103cbc:	75 e4                	jne    80103ca2 <exit+0x92>
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103cbe:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
80103cc4:	ba 54 2d 11 80       	mov    $0x80112d54,%edx
80103cc9:	eb 10                	jmp    80103cdb <exit+0xcb>
80103ccb:	90                   	nop
80103ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103cd0:	83 c2 7c             	add    $0x7c,%edx
80103cd3:	81 fa 54 4c 11 80    	cmp    $0x80114c54,%edx
80103cd9:	74 33                	je     80103d0e <exit+0xfe>
    if(p->parent == curproc){
80103cdb:	39 72 14             	cmp    %esi,0x14(%edx)
80103cde:	75 f0                	jne    80103cd0 <exit+0xc0>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103ce0:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103ce4:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103ce7:	75 e7                	jne    80103cd0 <exit+0xc0>
80103ce9:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103cee:	eb 0a                	jmp    80103cfa <exit+0xea>
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103cf0:	83 c0 7c             	add    $0x7c,%eax
80103cf3:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103cf8:	74 d6                	je     80103cd0 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103cfa:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103cfe:	75 f0                	jne    80103cf0 <exit+0xe0>
80103d00:	3b 48 20             	cmp    0x20(%eax),%ecx
80103d03:	75 eb                	jne    80103cf0 <exit+0xe0>
      p->state = RUNNABLE;
80103d05:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103d0c:	eb e2                	jmp    80103cf0 <exit+0xe0>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
80103d0e:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103d15:	e8 36 fe ff ff       	call   80103b50 <sched>
  panic("zombie exit");
80103d1a:	83 ec 0c             	sub    $0xc,%esp
80103d1d:	68 dd 76 10 80       	push   $0x801076dd
80103d22:	e8 69 c6 ff ff       	call   80100390 <panic>
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
    panic("init exiting");
80103d27:	83 ec 0c             	sub    $0xc,%esp
80103d2a:	68 d0 76 10 80       	push   $0x801076d0
80103d2f:	e8 5c c6 ff ff       	call   80100390 <panic>
80103d34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103d3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103d40 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103d40:	55                   	push   %ebp
80103d41:	89 e5                	mov    %esp,%ebp
80103d43:	53                   	push   %ebx
80103d44:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103d47:	68 20 2d 11 80       	push   $0x80112d20
80103d4c:	e8 2f 07 00 00       	call   80104480 <acquire>
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103d51:	e8 5a 06 00 00       	call   801043b0 <pushcli>
  c = mycpu();
80103d56:	e8 e5 f9 ff ff       	call   80103740 <mycpu>
  p = c->proc;
80103d5b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d61:	e8 8a 06 00 00       	call   801043f0 <popcli>
// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
80103d66:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103d6d:	e8 de fd ff ff       	call   80103b50 <sched>
  release(&ptable.lock);
80103d72:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103d79:	e8 c2 07 00 00       	call   80104540 <release>
}
80103d7e:	83 c4 10             	add    $0x10,%esp
80103d81:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d84:	c9                   	leave  
80103d85:	c3                   	ret    
80103d86:	8d 76 00             	lea    0x0(%esi),%esi
80103d89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103d90 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103d90:	55                   	push   %ebp
80103d91:	89 e5                	mov    %esp,%ebp
80103d93:	57                   	push   %edi
80103d94:	56                   	push   %esi
80103d95:	53                   	push   %ebx
80103d96:	83 ec 0c             	sub    $0xc,%esp
80103d99:	8b 7d 08             	mov    0x8(%ebp),%edi
80103d9c:	8b 75 0c             	mov    0xc(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103d9f:	e8 0c 06 00 00       	call   801043b0 <pushcli>
  c = mycpu();
80103da4:	e8 97 f9 ff ff       	call   80103740 <mycpu>
  p = c->proc;
80103da9:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103daf:	e8 3c 06 00 00       	call   801043f0 <popcli>
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
80103db4:	85 db                	test   %ebx,%ebx
80103db6:	0f 84 87 00 00 00    	je     80103e43 <sleep+0xb3>
    panic("sleep");

  if(lk == 0)
80103dbc:	85 f6                	test   %esi,%esi
80103dbe:	74 76                	je     80103e36 <sleep+0xa6>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103dc0:	81 fe 20 2d 11 80    	cmp    $0x80112d20,%esi
80103dc6:	74 50                	je     80103e18 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103dc8:	83 ec 0c             	sub    $0xc,%esp
80103dcb:	68 20 2d 11 80       	push   $0x80112d20
80103dd0:	e8 ab 06 00 00       	call   80104480 <acquire>
    release(lk);
80103dd5:	89 34 24             	mov    %esi,(%esp)
80103dd8:	e8 63 07 00 00       	call   80104540 <release>
  }
  // Go to sleep.
  p->chan = chan;
80103ddd:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103de0:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103de7:	e8 64 fd ff ff       	call   80103b50 <sched>

  // Tidy up.
  p->chan = 0;
80103dec:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103df3:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103dfa:	e8 41 07 00 00       	call   80104540 <release>
    acquire(lk);
80103dff:	89 75 08             	mov    %esi,0x8(%ebp)
80103e02:	83 c4 10             	add    $0x10,%esp
  }
}
80103e05:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103e08:	5b                   	pop    %ebx
80103e09:	5e                   	pop    %esi
80103e0a:	5f                   	pop    %edi
80103e0b:	5d                   	pop    %ebp
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103e0c:	e9 6f 06 00 00       	jmp    80104480 <acquire>
80103e11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
80103e18:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103e1b:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103e22:	e8 29 fd ff ff       	call   80103b50 <sched>

  // Tidy up.
  p->chan = 0;
80103e27:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103e2e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103e31:	5b                   	pop    %ebx
80103e32:	5e                   	pop    %esi
80103e33:	5f                   	pop    %edi
80103e34:	5d                   	pop    %ebp
80103e35:	c3                   	ret    
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103e36:	83 ec 0c             	sub    $0xc,%esp
80103e39:	68 ef 76 10 80       	push   $0x801076ef
80103e3e:	e8 4d c5 ff ff       	call   80100390 <panic>
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");
80103e43:	83 ec 0c             	sub    $0xc,%esp
80103e46:	68 e9 76 10 80       	push   $0x801076e9
80103e4b:	e8 40 c5 ff ff       	call   80100390 <panic>

80103e50 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103e50:	55                   	push   %ebp
80103e51:	89 e5                	mov    %esp,%ebp
80103e53:	56                   	push   %esi
80103e54:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103e55:	e8 56 05 00 00       	call   801043b0 <pushcli>
  c = mycpu();
80103e5a:	e8 e1 f8 ff ff       	call   80103740 <mycpu>
  p = c->proc;
80103e5f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103e65:	e8 86 05 00 00       	call   801043f0 <popcli>
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
80103e6a:	83 ec 0c             	sub    $0xc,%esp
80103e6d:	68 20 2d 11 80       	push   $0x80112d20
80103e72:	e8 09 06 00 00       	call   80104480 <acquire>
80103e77:	83 c4 10             	add    $0x10,%esp
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103e7a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e7c:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80103e81:	eb 10                	jmp    80103e93 <wait+0x43>
80103e83:	90                   	nop
80103e84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e88:	83 c3 7c             	add    $0x7c,%ebx
80103e8b:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103e91:	74 1d                	je     80103eb0 <wait+0x60>
      if(p->parent != curproc)
80103e93:	39 73 14             	cmp    %esi,0x14(%ebx)
80103e96:	75 f0                	jne    80103e88 <wait+0x38>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103e98:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103e9c:	74 30                	je     80103ece <wait+0x7e>
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e9e:	83 c3 7c             	add    $0x7c,%ebx
      if(p->parent != curproc)
        continue;
      havekids = 1;
80103ea1:	b8 01 00 00 00       	mov    $0x1,%eax
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ea6:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103eac:	75 e5                	jne    80103e93 <wait+0x43>
80103eae:	66 90                	xchg   %ax,%ax
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
80103eb0:	85 c0                	test   %eax,%eax
80103eb2:	74 70                	je     80103f24 <wait+0xd4>
80103eb4:	8b 46 24             	mov    0x24(%esi),%eax
80103eb7:	85 c0                	test   %eax,%eax
80103eb9:	75 69                	jne    80103f24 <wait+0xd4>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103ebb:	83 ec 08             	sub    $0x8,%esp
80103ebe:	68 20 2d 11 80       	push   $0x80112d20
80103ec3:	56                   	push   %esi
80103ec4:	e8 c7 fe ff ff       	call   80103d90 <sleep>
  }
80103ec9:	83 c4 10             	add    $0x10,%esp
80103ecc:	eb ac                	jmp    80103e7a <wait+0x2a>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80103ece:	83 ec 0c             	sub    $0xc,%esp
80103ed1:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80103ed4:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103ed7:	e8 44 e4 ff ff       	call   80102320 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80103edc:	5a                   	pop    %edx
80103edd:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80103ee0:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103ee7:	e8 34 2e 00 00       	call   80106d20 <freevm>
        p->pid = 0;
80103eec:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103ef3:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103efa:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103efe:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103f05:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103f0c:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103f13:	e8 28 06 00 00       	call   80104540 <release>
        return pid;
80103f18:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103f1b:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80103f1e:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103f20:	5b                   	pop    %ebx
80103f21:	5e                   	pop    %esi
80103f22:	5d                   	pop    %ebp
80103f23:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
80103f24:	83 ec 0c             	sub    $0xc,%esp
80103f27:	68 20 2d 11 80       	push   $0x80112d20
80103f2c:	e8 0f 06 00 00       	call   80104540 <release>
      return -1;
80103f31:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103f34:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
80103f37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103f3c:	5b                   	pop    %ebx
80103f3d:	5e                   	pop    %esi
80103f3e:	5d                   	pop    %ebp
80103f3f:	c3                   	ret    

80103f40 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103f40:	55                   	push   %ebp
80103f41:	89 e5                	mov    %esp,%ebp
80103f43:	53                   	push   %ebx
80103f44:	83 ec 10             	sub    $0x10,%esp
80103f47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103f4a:	68 20 2d 11 80       	push   $0x80112d20
80103f4f:	e8 2c 05 00 00       	call   80104480 <acquire>
80103f54:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f57:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103f5c:	eb 0c                	jmp    80103f6a <wakeup+0x2a>
80103f5e:	66 90                	xchg   %ax,%ax
80103f60:	83 c0 7c             	add    $0x7c,%eax
80103f63:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103f68:	74 1c                	je     80103f86 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
80103f6a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f6e:	75 f0                	jne    80103f60 <wakeup+0x20>
80103f70:	3b 58 20             	cmp    0x20(%eax),%ebx
80103f73:	75 eb                	jne    80103f60 <wakeup+0x20>
      p->state = RUNNABLE;
80103f75:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f7c:	83 c0 7c             	add    $0x7c,%eax
80103f7f:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103f84:	75 e4                	jne    80103f6a <wakeup+0x2a>
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f86:	c7 45 08 20 2d 11 80 	movl   $0x80112d20,0x8(%ebp)
}
80103f8d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f90:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f91:	e9 aa 05 00 00       	jmp    80104540 <release>
80103f96:	8d 76 00             	lea    0x0(%esi),%esi
80103f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103fa0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80103fa0:	55                   	push   %ebp
80103fa1:	89 e5                	mov    %esp,%ebp
80103fa3:	53                   	push   %ebx
80103fa4:	83 ec 10             	sub    $0x10,%esp
80103fa7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
80103faa:	68 20 2d 11 80       	push   $0x80112d20
80103faf:	e8 cc 04 00 00       	call   80104480 <acquire>
80103fb4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fb7:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103fbc:	eb 0c                	jmp    80103fca <kill+0x2a>
80103fbe:	66 90                	xchg   %ax,%ax
80103fc0:	83 c0 7c             	add    $0x7c,%eax
80103fc3:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103fc8:	74 3e                	je     80104008 <kill+0x68>
    if(p->pid == pid){
80103fca:	39 58 10             	cmp    %ebx,0x10(%eax)
80103fcd:	75 f1                	jne    80103fc0 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103fcf:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
80103fd3:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103fda:	74 1c                	je     80103ff8 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
80103fdc:	83 ec 0c             	sub    $0xc,%esp
80103fdf:	68 20 2d 11 80       	push   $0x80112d20
80103fe4:	e8 57 05 00 00       	call   80104540 <release>
      return 0;
80103fe9:	83 c4 10             	add    $0x10,%esp
80103fec:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80103fee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103ff1:	c9                   	leave  
80103ff2:	c3                   	ret    
80103ff3:	90                   	nop
80103ff4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
80103ff8:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103fff:	eb db                	jmp    80103fdc <kill+0x3c>
80104001:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80104008:	83 ec 0c             	sub    $0xc,%esp
8010400b:	68 20 2d 11 80       	push   $0x80112d20
80104010:	e8 2b 05 00 00       	call   80104540 <release>
  return -1;
80104015:	83 c4 10             	add    $0x10,%esp
80104018:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010401d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104020:	c9                   	leave  
80104021:	c3                   	ret    
80104022:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104030 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104030:	55                   	push   %ebp
80104031:	89 e5                	mov    %esp,%ebp
80104033:	57                   	push   %edi
80104034:	56                   	push   %esi
80104035:	53                   	push   %ebx
80104036:	be c0 2d 11 80       	mov    $0x80112dc0,%esi
8010403b:	83 ec 4c             	sub    $0x4c,%esp
8010403e:	66 90                	xchg   %ax,%ax
  char *state;
  pte_t* pte;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
80104040:	8b 56 a0             	mov    -0x60(%esi),%edx
80104043:	85 d2                	test   %edx,%edx
80104045:	0f 84 4d 01 00 00    	je     80104198 <procdump+0x168>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
8010404b:	83 fa 05             	cmp    $0x5,%edx
      state = states[p->state];
    else
      state = "???";
8010404e:	b9 00 77 10 80       	mov    $0x80107700,%ecx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104053:	77 11                	ja     80104066 <procdump+0x36>
80104055:	8b 0c 95 b4 77 10 80 	mov    -0x7fef884c(,%edx,4),%ecx
      state = states[p->state];
    else
      state = "???";
8010405c:	ba 00 77 10 80       	mov    $0x80107700,%edx
80104061:	85 c9                	test   %ecx,%ecx
80104063:	0f 44 ca             	cmove  %edx,%ecx

    cprintf("%d %s %s", p->pid, state, p->name);
80104066:	56                   	push   %esi
80104067:	51                   	push   %ecx
80104068:	ff 76 a4             	pushl  -0x5c(%esi)
8010406b:	68 0b 77 10 80       	push   $0x8010770b
80104070:	e8 eb c5 ff ff       	call   80100660 <cprintf>

    if(p->state == SLEEPING){
80104075:	83 c4 10             	add    $0x10,%esp
80104078:	83 7e a0 02          	cmpl   $0x2,-0x60(%esi)
8010407c:	0f 84 2d 01 00 00    	je     801041af <procdump+0x17f>
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104082:	83 ec 0c             	sub    $0xc,%esp
80104085:	68 db 7a 10 80       	push   $0x80107adb
8010408a:	e8 d1 c5 ff ff       	call   80100660 <cprintf>


	for (uint i = 0; i < p->sz; i += PGSIZE) {
8010408f:	8b 46 94             	mov    -0x6c(%esi),%eax
80104092:	83 c4 10             	add    $0x10,%esp
80104095:	85 c0                	test   %eax,%eax
80104097:	0f 84 fb 00 00 00    	je     80104198 <procdump+0x168>
{
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
8010409d:	8b 56 98             	mov    -0x68(%esi),%edx
801040a0:	8b 12                	mov    (%edx),%edx
801040a2:	f6 c2 01             	test   $0x1,%dl
801040a5:	74 71                	je     80104118 <procdump+0xe8>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801040a7:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
    cprintf("\n");


	for (uint i = 0; i < p->sz; i += PGSIZE) {
		// 
		if((pte = walkpgdir(p->pgdir, (void *) i, 0)) == 0)
801040ad:	81 c2 00 00 00 80    	add    $0x80000000,%edx
801040b3:	74 63                	je     80104118 <procdump+0xe8>
801040b5:	31 db                	xor    %ebx,%ebx
801040b7:	89 f6                	mov    %esi,%esi
801040b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	      panic("copyuvm: pte should exist");
	    
	    if(!(*pte & PTE_P))
801040c0:	8b 3a                	mov    (%edx),%edi
801040c2:	f7 c7 01 00 00 00    	test   $0x1,%edi
801040c8:	0f 84 2c 01 00 00    	je     801041fa <procdump+0x1ca>
	      panic("copyuvm: page not present");
		
		if((*pte & PTE_U) && (*pte & PTE_P)){
801040ce:	89 f8                	mov    %edi,%eax
801040d0:	83 e0 05             	and    $0x5,%eax
801040d3:	83 f8 05             	cmp    $0x5,%eax
801040d6:	74 50                	je     80104128 <procdump+0xf8>
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");


	for (uint i = 0; i < p->sz; i += PGSIZE) {
801040d8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801040de:	39 5e 94             	cmp    %ebx,-0x6c(%esi)
801040e1:	0f 86 b1 00 00 00    	jbe    80104198 <procdump+0x168>
{
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
801040e7:	8b 46 98             	mov    -0x68(%esi),%eax
801040ea:	89 da                	mov    %ebx,%edx
801040ec:	c1 ea 16             	shr    $0x16,%edx
801040ef:	8b 04 90             	mov    (%eax,%edx,4),%eax
801040f2:	a8 01                	test   $0x1,%al
801040f4:	74 22                	je     80104118 <procdump+0xe8>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
801040f6:	89 da                	mov    %ebx,%edx
801040f8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801040fd:	c1 ea 0a             	shr    $0xa,%edx
80104100:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80104106:	8d 94 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%edx
    cprintf("\n");


	for (uint i = 0; i < p->sz; i += PGSIZE) {
		// 
		if((pte = walkpgdir(p->pgdir, (void *) i, 0)) == 0)
8010410d:	85 d2                	test   %edx,%edx
8010410f:	75 af                	jne    801040c0 <procdump+0x90>
80104111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	      panic("copyuvm: pte should exist");
80104118:	83 ec 0c             	sub    $0xc,%esp
8010411b:	68 14 77 10 80       	push   $0x80107714
80104120:	e8 6b c2 ff ff       	call   80100390 <panic>
80104125:	8d 76 00             	lea    0x0(%esi),%esi
	    if(!(*pte & PTE_P))
	      panic("copyuvm: page not present");
		
		if((*pte & PTE_U) && (*pte & PTE_P)){
			uint temp = PTE_ADDR(*pte) >> 12;
			cprintf("| %d", PTX(i));
80104128:	89 d8                	mov    %ebx,%eax
8010412a:	83 ec 08             	sub    $0x8,%esp
8010412d:	89 55 b4             	mov    %edx,-0x4c(%ebp)
80104130:	c1 e8 0c             	shr    $0xc,%eax
			cprintf("| %d        ",temp);
80104133:	c1 ef 0c             	shr    $0xc,%edi
	    if(!(*pte & PTE_P))
	      panic("copyuvm: page not present");
		
		if((*pte & PTE_U) && (*pte & PTE_P)){
			uint temp = PTE_ADDR(*pte) >> 12;
			cprintf("| %d", PTX(i));
80104136:	25 ff 03 00 00       	and    $0x3ff,%eax
8010413b:	50                   	push   %eax
8010413c:	68 48 77 10 80       	push   $0x80107748
80104141:	e8 1a c5 ff ff       	call   80100660 <cprintf>
			cprintf("| %d        ",temp);
80104146:	58                   	pop    %eax
80104147:	5a                   	pop    %edx
80104148:	57                   	push   %edi
80104149:	68 4d 77 10 80       	push   $0x8010774d
8010414e:	e8 0d c5 ff ff       	call   80100660 <cprintf>
			cprintf("| %s", (*pte & PTE_W) ? "Yes" : "No");
80104153:	8b 55 b4             	mov    -0x4c(%ebp),%edx
80104156:	b8 08 77 10 80       	mov    $0x80107708,%eax
8010415b:	59                   	pop    %ecx
8010415c:	b9 04 77 10 80       	mov    $0x80107704,%ecx
80104161:	f6 02 02             	testb  $0x2,(%edx)
80104164:	5f                   	pop    %edi
80104165:	0f 45 c1             	cmovne %ecx,%eax
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");


	for (uint i = 0; i < p->sz; i += PGSIZE) {
80104168:	81 c3 00 10 00 00    	add    $0x1000,%ebx
		
		if((*pte & PTE_U) && (*pte & PTE_P)){
			uint temp = PTE_ADDR(*pte) >> 12;
			cprintf("| %d", PTX(i));
			cprintf("| %d        ",temp);
			cprintf("| %s", (*pte & PTE_W) ? "Yes" : "No");
8010416e:	50                   	push   %eax
8010416f:	68 5a 77 10 80       	push   $0x8010775a
80104174:	e8 e7 c4 ff ff       	call   80100660 <cprintf>
			cprintf("|\n");
80104179:	c7 04 24 5f 77 10 80 	movl   $0x8010775f,(%esp)
80104180:	e8 db c4 ff ff       	call   80100660 <cprintf>
80104185:	83 c4 10             	add    $0x10,%esp
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");


	for (uint i = 0; i < p->sz; i += PGSIZE) {
80104188:	39 5e 94             	cmp    %ebx,-0x6c(%esi)
8010418b:	0f 87 56 ff ff ff    	ja     801040e7 <procdump+0xb7>
80104191:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104198:	83 c6 7c             	add    $0x7c,%esi
  struct proc *p;
  char *state;
  pte_t* pte;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010419b:	81 fe c0 4c 11 80    	cmp    $0x80114cc0,%esi
801041a1:	0f 85 99 fe ff ff    	jne    80104040 <procdump+0x10>
			cprintf("|\n");
		}
		
	 }
  }
}
801041a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801041aa:	5b                   	pop    %ebx
801041ab:	5e                   	pop    %esi
801041ac:	5f                   	pop    %edi
801041ad:	5d                   	pop    %ebp
801041ae:	c3                   	ret    
      state = "???";

    cprintf("%d %s %s", p->pid, state, p->name);

    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
801041af:	8b 56 b0             	mov    -0x50(%esi),%edx
801041b2:	8d 45 c0             	lea    -0x40(%ebp),%eax
801041b5:	83 ec 08             	sub    $0x8,%esp
801041b8:	8d 5d c0             	lea    -0x40(%ebp),%ebx
801041bb:	50                   	push   %eax
801041bc:	8b 52 0c             	mov    0xc(%edx),%edx
801041bf:	83 c2 08             	add    $0x8,%edx
801041c2:	52                   	push   %edx
801041c3:	e8 98 01 00 00       	call   80104360 <getcallerpcs>
801041c8:	83 c4 10             	add    $0x10,%esp
801041cb:	90                   	nop
801041cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
801041d0:	8b 03                	mov    (%ebx),%eax
801041d2:	85 c0                	test   %eax,%eax
801041d4:	0f 84 a8 fe ff ff    	je     80104082 <procdump+0x52>
        cprintf(" %p", pc[i]);
801041da:	83 ec 08             	sub    $0x8,%esp
801041dd:	83 c3 04             	add    $0x4,%ebx
801041e0:	50                   	push   %eax
801041e1:	68 41 71 10 80       	push   $0x80107141
801041e6:	e8 75 c4 ff ff       	call   80100660 <cprintf>

    cprintf("%d %s %s", p->pid, state, p->name);

    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
801041eb:	8d 45 e8             	lea    -0x18(%ebp),%eax
801041ee:	83 c4 10             	add    $0x10,%esp
801041f1:	39 d8                	cmp    %ebx,%eax
801041f3:	75 db                	jne    801041d0 <procdump+0x1a0>
801041f5:	e9 88 fe ff ff       	jmp    80104082 <procdump+0x52>
		// 
		if((pte = walkpgdir(p->pgdir, (void *) i, 0)) == 0)
	      panic("copyuvm: pte should exist");
	    
	    if(!(*pte & PTE_P))
	      panic("copyuvm: page not present");
801041fa:	83 ec 0c             	sub    $0xc,%esp
801041fd:	68 2e 77 10 80       	push   $0x8010772e
80104202:	e8 89 c1 ff ff       	call   80100390 <panic>
80104207:	66 90                	xchg   %ax,%ax
80104209:	66 90                	xchg   %ax,%ax
8010420b:	66 90                	xchg   %ax,%ax
8010420d:	66 90                	xchg   %ax,%ax
8010420f:	90                   	nop

80104210 <initsleeplock>:
80104210:	55                   	push   %ebp
80104211:	89 e5                	mov    %esp,%ebp
80104213:	53                   	push   %ebx
80104214:	83 ec 0c             	sub    $0xc,%esp
80104217:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010421a:	68 cc 77 10 80       	push   $0x801077cc
8010421f:	8d 43 04             	lea    0x4(%ebx),%eax
80104222:	50                   	push   %eax
80104223:	e8 18 01 00 00       	call   80104340 <initlock>
80104228:	8b 45 0c             	mov    0xc(%ebp),%eax
8010422b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104231:	83 c4 10             	add    $0x10,%esp
80104234:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
8010423b:	89 43 38             	mov    %eax,0x38(%ebx)
8010423e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104241:	c9                   	leave  
80104242:	c3                   	ret    
80104243:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104250 <acquiresleep>:
80104250:	55                   	push   %ebp
80104251:	89 e5                	mov    %esp,%ebp
80104253:	56                   	push   %esi
80104254:	53                   	push   %ebx
80104255:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104258:	83 ec 0c             	sub    $0xc,%esp
8010425b:	8d 73 04             	lea    0x4(%ebx),%esi
8010425e:	56                   	push   %esi
8010425f:	e8 1c 02 00 00       	call   80104480 <acquire>
80104264:	8b 13                	mov    (%ebx),%edx
80104266:	83 c4 10             	add    $0x10,%esp
80104269:	85 d2                	test   %edx,%edx
8010426b:	74 16                	je     80104283 <acquiresleep+0x33>
8010426d:	8d 76 00             	lea    0x0(%esi),%esi
80104270:	83 ec 08             	sub    $0x8,%esp
80104273:	56                   	push   %esi
80104274:	53                   	push   %ebx
80104275:	e8 16 fb ff ff       	call   80103d90 <sleep>
8010427a:	8b 03                	mov    (%ebx),%eax
8010427c:	83 c4 10             	add    $0x10,%esp
8010427f:	85 c0                	test   %eax,%eax
80104281:	75 ed                	jne    80104270 <acquiresleep+0x20>
80104283:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80104289:	e8 52 f5 ff ff       	call   801037e0 <myproc>
8010428e:	8b 40 10             	mov    0x10(%eax),%eax
80104291:	89 43 3c             	mov    %eax,0x3c(%ebx)
80104294:	89 75 08             	mov    %esi,0x8(%ebp)
80104297:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010429a:	5b                   	pop    %ebx
8010429b:	5e                   	pop    %esi
8010429c:	5d                   	pop    %ebp
8010429d:	e9 9e 02 00 00       	jmp    80104540 <release>
801042a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801042a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801042b0 <releasesleep>:
801042b0:	55                   	push   %ebp
801042b1:	89 e5                	mov    %esp,%ebp
801042b3:	56                   	push   %esi
801042b4:	53                   	push   %ebx
801042b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042b8:	83 ec 0c             	sub    $0xc,%esp
801042bb:	8d 73 04             	lea    0x4(%ebx),%esi
801042be:	56                   	push   %esi
801042bf:	e8 bc 01 00 00       	call   80104480 <acquire>
801042c4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801042ca:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801042d1:	89 1c 24             	mov    %ebx,(%esp)
801042d4:	e8 67 fc ff ff       	call   80103f40 <wakeup>
801042d9:	89 75 08             	mov    %esi,0x8(%ebp)
801042dc:	83 c4 10             	add    $0x10,%esp
801042df:	8d 65 f8             	lea    -0x8(%ebp),%esp
801042e2:	5b                   	pop    %ebx
801042e3:	5e                   	pop    %esi
801042e4:	5d                   	pop    %ebp
801042e5:	e9 56 02 00 00       	jmp    80104540 <release>
801042ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801042f0 <holdingsleep>:
801042f0:	55                   	push   %ebp
801042f1:	89 e5                	mov    %esp,%ebp
801042f3:	57                   	push   %edi
801042f4:	56                   	push   %esi
801042f5:	53                   	push   %ebx
801042f6:	31 ff                	xor    %edi,%edi
801042f8:	83 ec 18             	sub    $0x18,%esp
801042fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042fe:	8d 73 04             	lea    0x4(%ebx),%esi
80104301:	56                   	push   %esi
80104302:	e8 79 01 00 00       	call   80104480 <acquire>
80104307:	8b 03                	mov    (%ebx),%eax
80104309:	83 c4 10             	add    $0x10,%esp
8010430c:	85 c0                	test   %eax,%eax
8010430e:	74 13                	je     80104323 <holdingsleep+0x33>
80104310:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80104313:	e8 c8 f4 ff ff       	call   801037e0 <myproc>
80104318:	39 58 10             	cmp    %ebx,0x10(%eax)
8010431b:	0f 94 c0             	sete   %al
8010431e:	0f b6 c0             	movzbl %al,%eax
80104321:	89 c7                	mov    %eax,%edi
80104323:	83 ec 0c             	sub    $0xc,%esp
80104326:	56                   	push   %esi
80104327:	e8 14 02 00 00       	call   80104540 <release>
8010432c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010432f:	89 f8                	mov    %edi,%eax
80104331:	5b                   	pop    %ebx
80104332:	5e                   	pop    %esi
80104333:	5f                   	pop    %edi
80104334:	5d                   	pop    %ebp
80104335:	c3                   	ret    
80104336:	66 90                	xchg   %ax,%ax
80104338:	66 90                	xchg   %ax,%ax
8010433a:	66 90                	xchg   %ax,%ax
8010433c:	66 90                	xchg   %ax,%ax
8010433e:	66 90                	xchg   %ax,%ax

80104340 <initlock>:
80104340:	55                   	push   %ebp
80104341:	89 e5                	mov    %esp,%ebp
80104343:	8b 45 08             	mov    0x8(%ebp),%eax
80104346:	8b 55 0c             	mov    0xc(%ebp),%edx
80104349:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010434f:	89 50 04             	mov    %edx,0x4(%eax)
80104352:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80104359:	5d                   	pop    %ebp
8010435a:	c3                   	ret    
8010435b:	90                   	nop
8010435c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104360 <getcallerpcs>:
80104360:	55                   	push   %ebp
80104361:	31 d2                	xor    %edx,%edx
80104363:	89 e5                	mov    %esp,%ebp
80104365:	53                   	push   %ebx
80104366:	8b 45 08             	mov    0x8(%ebp),%eax
80104369:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010436c:	83 e8 08             	sub    $0x8,%eax
8010436f:	90                   	nop
80104370:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80104376:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010437c:	77 1a                	ja     80104398 <getcallerpcs+0x38>
8010437e:	8b 58 04             	mov    0x4(%eax),%ebx
80104381:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
80104384:	83 c2 01             	add    $0x1,%edx
80104387:	8b 00                	mov    (%eax),%eax
80104389:	83 fa 0a             	cmp    $0xa,%edx
8010438c:	75 e2                	jne    80104370 <getcallerpcs+0x10>
8010438e:	5b                   	pop    %ebx
8010438f:	5d                   	pop    %ebp
80104390:	c3                   	ret    
80104391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104398:	8d 04 91             	lea    (%ecx,%edx,4),%eax
8010439b:	83 c1 28             	add    $0x28,%ecx
8010439e:	66 90                	xchg   %ax,%ax
801043a0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801043a6:	83 c0 04             	add    $0x4,%eax
801043a9:	39 c1                	cmp    %eax,%ecx
801043ab:	75 f3                	jne    801043a0 <getcallerpcs+0x40>
801043ad:	5b                   	pop    %ebx
801043ae:	5d                   	pop    %ebp
801043af:	c3                   	ret    

801043b0 <pushcli>:
801043b0:	55                   	push   %ebp
801043b1:	89 e5                	mov    %esp,%ebp
801043b3:	53                   	push   %ebx
801043b4:	83 ec 04             	sub    $0x4,%esp
801043b7:	9c                   	pushf  
801043b8:	5b                   	pop    %ebx
801043b9:	fa                   	cli    
801043ba:	e8 81 f3 ff ff       	call   80103740 <mycpu>
801043bf:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
801043c5:	85 c0                	test   %eax,%eax
801043c7:	75 11                	jne    801043da <pushcli+0x2a>
801043c9:	81 e3 00 02 00 00    	and    $0x200,%ebx
801043cf:	e8 6c f3 ff ff       	call   80103740 <mycpu>
801043d4:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
801043da:	e8 61 f3 ff ff       	call   80103740 <mycpu>
801043df:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
801043e6:	83 c4 04             	add    $0x4,%esp
801043e9:	5b                   	pop    %ebx
801043ea:	5d                   	pop    %ebp
801043eb:	c3                   	ret    
801043ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801043f0 <popcli>:
801043f0:	55                   	push   %ebp
801043f1:	89 e5                	mov    %esp,%ebp
801043f3:	83 ec 08             	sub    $0x8,%esp
801043f6:	9c                   	pushf  
801043f7:	58                   	pop    %eax
801043f8:	f6 c4 02             	test   $0x2,%ah
801043fb:	75 35                	jne    80104432 <popcli+0x42>
801043fd:	e8 3e f3 ff ff       	call   80103740 <mycpu>
80104402:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80104409:	78 34                	js     8010443f <popcli+0x4f>
8010440b:	e8 30 f3 ff ff       	call   80103740 <mycpu>
80104410:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104416:	85 d2                	test   %edx,%edx
80104418:	74 06                	je     80104420 <popcli+0x30>
8010441a:	c9                   	leave  
8010441b:	c3                   	ret    
8010441c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104420:	e8 1b f3 ff ff       	call   80103740 <mycpu>
80104425:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010442b:	85 c0                	test   %eax,%eax
8010442d:	74 eb                	je     8010441a <popcli+0x2a>
8010442f:	fb                   	sti    
80104430:	c9                   	leave  
80104431:	c3                   	ret    
80104432:	83 ec 0c             	sub    $0xc,%esp
80104435:	68 d7 77 10 80       	push   $0x801077d7
8010443a:	e8 51 bf ff ff       	call   80100390 <panic>
8010443f:	83 ec 0c             	sub    $0xc,%esp
80104442:	68 ee 77 10 80       	push   $0x801077ee
80104447:	e8 44 bf ff ff       	call   80100390 <panic>
8010444c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104450 <holding>:
80104450:	55                   	push   %ebp
80104451:	89 e5                	mov    %esp,%ebp
80104453:	56                   	push   %esi
80104454:	53                   	push   %ebx
80104455:	8b 75 08             	mov    0x8(%ebp),%esi
80104458:	31 db                	xor    %ebx,%ebx
8010445a:	e8 51 ff ff ff       	call   801043b0 <pushcli>
8010445f:	8b 06                	mov    (%esi),%eax
80104461:	85 c0                	test   %eax,%eax
80104463:	74 10                	je     80104475 <holding+0x25>
80104465:	8b 5e 08             	mov    0x8(%esi),%ebx
80104468:	e8 d3 f2 ff ff       	call   80103740 <mycpu>
8010446d:	39 c3                	cmp    %eax,%ebx
8010446f:	0f 94 c3             	sete   %bl
80104472:	0f b6 db             	movzbl %bl,%ebx
80104475:	e8 76 ff ff ff       	call   801043f0 <popcli>
8010447a:	89 d8                	mov    %ebx,%eax
8010447c:	5b                   	pop    %ebx
8010447d:	5e                   	pop    %esi
8010447e:	5d                   	pop    %ebp
8010447f:	c3                   	ret    

80104480 <acquire>:
80104480:	55                   	push   %ebp
80104481:	89 e5                	mov    %esp,%ebp
80104483:	56                   	push   %esi
80104484:	53                   	push   %ebx
80104485:	e8 26 ff ff ff       	call   801043b0 <pushcli>
8010448a:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010448d:	83 ec 0c             	sub    $0xc,%esp
80104490:	53                   	push   %ebx
80104491:	e8 ba ff ff ff       	call   80104450 <holding>
80104496:	83 c4 10             	add    $0x10,%esp
80104499:	85 c0                	test   %eax,%eax
8010449b:	0f 85 83 00 00 00    	jne    80104524 <acquire+0xa4>
801044a1:	89 c6                	mov    %eax,%esi
801044a3:	ba 01 00 00 00       	mov    $0x1,%edx
801044a8:	eb 09                	jmp    801044b3 <acquire+0x33>
801044aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801044b0:	8b 5d 08             	mov    0x8(%ebp),%ebx
801044b3:	89 d0                	mov    %edx,%eax
801044b5:	f0 87 03             	lock xchg %eax,(%ebx)
801044b8:	85 c0                	test   %eax,%eax
801044ba:	75 f4                	jne    801044b0 <acquire+0x30>
801044bc:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801044c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801044c4:	e8 77 f2 ff ff       	call   80103740 <mycpu>
801044c9:	8d 53 0c             	lea    0xc(%ebx),%edx
801044cc:	89 43 08             	mov    %eax,0x8(%ebx)
801044cf:	89 e8                	mov    %ebp,%eax
801044d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044d8:	8d 88 00 00 00 80    	lea    -0x80000000(%eax),%ecx
801044de:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
801044e4:	77 1a                	ja     80104500 <acquire+0x80>
801044e6:	8b 48 04             	mov    0x4(%eax),%ecx
801044e9:	89 0c b2             	mov    %ecx,(%edx,%esi,4)
801044ec:	83 c6 01             	add    $0x1,%esi
801044ef:	8b 00                	mov    (%eax),%eax
801044f1:	83 fe 0a             	cmp    $0xa,%esi
801044f4:	75 e2                	jne    801044d8 <acquire+0x58>
801044f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801044f9:	5b                   	pop    %ebx
801044fa:	5e                   	pop    %esi
801044fb:	5d                   	pop    %ebp
801044fc:	c3                   	ret    
801044fd:	8d 76 00             	lea    0x0(%esi),%esi
80104500:	8d 04 b2             	lea    (%edx,%esi,4),%eax
80104503:	83 c2 28             	add    $0x28,%edx
80104506:	8d 76 00             	lea    0x0(%esi),%esi
80104509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104510:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104516:	83 c0 04             	add    $0x4,%eax
80104519:	39 d0                	cmp    %edx,%eax
8010451b:	75 f3                	jne    80104510 <acquire+0x90>
8010451d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104520:	5b                   	pop    %ebx
80104521:	5e                   	pop    %esi
80104522:	5d                   	pop    %ebp
80104523:	c3                   	ret    
80104524:	83 ec 0c             	sub    $0xc,%esp
80104527:	68 f5 77 10 80       	push   $0x801077f5
8010452c:	e8 5f be ff ff       	call   80100390 <panic>
80104531:	eb 0d                	jmp    80104540 <release>
80104533:	90                   	nop
80104534:	90                   	nop
80104535:	90                   	nop
80104536:	90                   	nop
80104537:	90                   	nop
80104538:	90                   	nop
80104539:	90                   	nop
8010453a:	90                   	nop
8010453b:	90                   	nop
8010453c:	90                   	nop
8010453d:	90                   	nop
8010453e:	90                   	nop
8010453f:	90                   	nop

80104540 <release>:
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	53                   	push   %ebx
80104544:	83 ec 10             	sub    $0x10,%esp
80104547:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010454a:	53                   	push   %ebx
8010454b:	e8 00 ff ff ff       	call   80104450 <holding>
80104550:	83 c4 10             	add    $0x10,%esp
80104553:	85 c0                	test   %eax,%eax
80104555:	74 22                	je     80104579 <release+0x39>
80104557:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
8010455e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80104565:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
8010456a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104570:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104573:	c9                   	leave  
80104574:	e9 77 fe ff ff       	jmp    801043f0 <popcli>
80104579:	83 ec 0c             	sub    $0xc,%esp
8010457c:	68 fd 77 10 80       	push   $0x801077fd
80104581:	e8 0a be ff ff       	call   80100390 <panic>
80104586:	66 90                	xchg   %ax,%ax
80104588:	66 90                	xchg   %ax,%ax
8010458a:	66 90                	xchg   %ax,%ax
8010458c:	66 90                	xchg   %ax,%ax
8010458e:	66 90                	xchg   %ax,%ax

80104590 <memset>:
80104590:	55                   	push   %ebp
80104591:	89 e5                	mov    %esp,%ebp
80104593:	57                   	push   %edi
80104594:	53                   	push   %ebx
80104595:	8b 55 08             	mov    0x8(%ebp),%edx
80104598:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010459b:	f6 c2 03             	test   $0x3,%dl
8010459e:	75 05                	jne    801045a5 <memset+0x15>
801045a0:	f6 c1 03             	test   $0x3,%cl
801045a3:	74 13                	je     801045b8 <memset+0x28>
801045a5:	89 d7                	mov    %edx,%edi
801045a7:	8b 45 0c             	mov    0xc(%ebp),%eax
801045aa:	fc                   	cld    
801045ab:	f3 aa                	rep stos %al,%es:(%edi)
801045ad:	5b                   	pop    %ebx
801045ae:	89 d0                	mov    %edx,%eax
801045b0:	5f                   	pop    %edi
801045b1:	5d                   	pop    %ebp
801045b2:	c3                   	ret    
801045b3:	90                   	nop
801045b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045b8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
801045bc:	c1 e9 02             	shr    $0x2,%ecx
801045bf:	89 f8                	mov    %edi,%eax
801045c1:	89 fb                	mov    %edi,%ebx
801045c3:	c1 e0 18             	shl    $0x18,%eax
801045c6:	c1 e3 10             	shl    $0x10,%ebx
801045c9:	09 d8                	or     %ebx,%eax
801045cb:	09 f8                	or     %edi,%eax
801045cd:	c1 e7 08             	shl    $0x8,%edi
801045d0:	09 f8                	or     %edi,%eax
801045d2:	89 d7                	mov    %edx,%edi
801045d4:	fc                   	cld    
801045d5:	f3 ab                	rep stos %eax,%es:(%edi)
801045d7:	5b                   	pop    %ebx
801045d8:	89 d0                	mov    %edx,%eax
801045da:	5f                   	pop    %edi
801045db:	5d                   	pop    %ebp
801045dc:	c3                   	ret    
801045dd:	8d 76 00             	lea    0x0(%esi),%esi

801045e0 <memcmp>:
801045e0:	55                   	push   %ebp
801045e1:	89 e5                	mov    %esp,%ebp
801045e3:	57                   	push   %edi
801045e4:	56                   	push   %esi
801045e5:	53                   	push   %ebx
801045e6:	8b 5d 10             	mov    0x10(%ebp),%ebx
801045e9:	8b 75 08             	mov    0x8(%ebp),%esi
801045ec:	8b 7d 0c             	mov    0xc(%ebp),%edi
801045ef:	85 db                	test   %ebx,%ebx
801045f1:	74 29                	je     8010461c <memcmp+0x3c>
801045f3:	0f b6 16             	movzbl (%esi),%edx
801045f6:	0f b6 0f             	movzbl (%edi),%ecx
801045f9:	38 d1                	cmp    %dl,%cl
801045fb:	75 2b                	jne    80104628 <memcmp+0x48>
801045fd:	b8 01 00 00 00       	mov    $0x1,%eax
80104602:	eb 14                	jmp    80104618 <memcmp+0x38>
80104604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104608:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
8010460c:	83 c0 01             	add    $0x1,%eax
8010460f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80104614:	38 ca                	cmp    %cl,%dl
80104616:	75 10                	jne    80104628 <memcmp+0x48>
80104618:	39 d8                	cmp    %ebx,%eax
8010461a:	75 ec                	jne    80104608 <memcmp+0x28>
8010461c:	5b                   	pop    %ebx
8010461d:	31 c0                	xor    %eax,%eax
8010461f:	5e                   	pop    %esi
80104620:	5f                   	pop    %edi
80104621:	5d                   	pop    %ebp
80104622:	c3                   	ret    
80104623:	90                   	nop
80104624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104628:	0f b6 c2             	movzbl %dl,%eax
8010462b:	5b                   	pop    %ebx
8010462c:	29 c8                	sub    %ecx,%eax
8010462e:	5e                   	pop    %esi
8010462f:	5f                   	pop    %edi
80104630:	5d                   	pop    %ebp
80104631:	c3                   	ret    
80104632:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104640 <memmove>:
80104640:	55                   	push   %ebp
80104641:	89 e5                	mov    %esp,%ebp
80104643:	56                   	push   %esi
80104644:	53                   	push   %ebx
80104645:	8b 45 08             	mov    0x8(%ebp),%eax
80104648:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010464b:	8b 75 10             	mov    0x10(%ebp),%esi
8010464e:	39 c3                	cmp    %eax,%ebx
80104650:	73 26                	jae    80104678 <memmove+0x38>
80104652:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
80104655:	39 c8                	cmp    %ecx,%eax
80104657:	73 1f                	jae    80104678 <memmove+0x38>
80104659:	85 f6                	test   %esi,%esi
8010465b:	8d 56 ff             	lea    -0x1(%esi),%edx
8010465e:	74 0f                	je     8010466f <memmove+0x2f>
80104660:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104664:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104667:	83 ea 01             	sub    $0x1,%edx
8010466a:	83 fa ff             	cmp    $0xffffffff,%edx
8010466d:	75 f1                	jne    80104660 <memmove+0x20>
8010466f:	5b                   	pop    %ebx
80104670:	5e                   	pop    %esi
80104671:	5d                   	pop    %ebp
80104672:	c3                   	ret    
80104673:	90                   	nop
80104674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104678:	31 d2                	xor    %edx,%edx
8010467a:	85 f6                	test   %esi,%esi
8010467c:	74 f1                	je     8010466f <memmove+0x2f>
8010467e:	66 90                	xchg   %ax,%ax
80104680:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104684:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104687:	83 c2 01             	add    $0x1,%edx
8010468a:	39 d6                	cmp    %edx,%esi
8010468c:	75 f2                	jne    80104680 <memmove+0x40>
8010468e:	5b                   	pop    %ebx
8010468f:	5e                   	pop    %esi
80104690:	5d                   	pop    %ebp
80104691:	c3                   	ret    
80104692:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046a0 <memcpy>:
801046a0:	55                   	push   %ebp
801046a1:	89 e5                	mov    %esp,%ebp
801046a3:	5d                   	pop    %ebp
801046a4:	eb 9a                	jmp    80104640 <memmove>
801046a6:	8d 76 00             	lea    0x0(%esi),%esi
801046a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046b0 <strncmp>:
801046b0:	55                   	push   %ebp
801046b1:	89 e5                	mov    %esp,%ebp
801046b3:	57                   	push   %edi
801046b4:	56                   	push   %esi
801046b5:	8b 7d 10             	mov    0x10(%ebp),%edi
801046b8:	53                   	push   %ebx
801046b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
801046bc:	8b 75 0c             	mov    0xc(%ebp),%esi
801046bf:	85 ff                	test   %edi,%edi
801046c1:	74 2f                	je     801046f2 <strncmp+0x42>
801046c3:	0f b6 01             	movzbl (%ecx),%eax
801046c6:	0f b6 1e             	movzbl (%esi),%ebx
801046c9:	84 c0                	test   %al,%al
801046cb:	74 37                	je     80104704 <strncmp+0x54>
801046cd:	38 c3                	cmp    %al,%bl
801046cf:	75 33                	jne    80104704 <strncmp+0x54>
801046d1:	01 f7                	add    %esi,%edi
801046d3:	eb 13                	jmp    801046e8 <strncmp+0x38>
801046d5:	8d 76 00             	lea    0x0(%esi),%esi
801046d8:	0f b6 01             	movzbl (%ecx),%eax
801046db:	84 c0                	test   %al,%al
801046dd:	74 21                	je     80104700 <strncmp+0x50>
801046df:	0f b6 1a             	movzbl (%edx),%ebx
801046e2:	89 d6                	mov    %edx,%esi
801046e4:	38 d8                	cmp    %bl,%al
801046e6:	75 1c                	jne    80104704 <strncmp+0x54>
801046e8:	8d 56 01             	lea    0x1(%esi),%edx
801046eb:	83 c1 01             	add    $0x1,%ecx
801046ee:	39 fa                	cmp    %edi,%edx
801046f0:	75 e6                	jne    801046d8 <strncmp+0x28>
801046f2:	5b                   	pop    %ebx
801046f3:	31 c0                	xor    %eax,%eax
801046f5:	5e                   	pop    %esi
801046f6:	5f                   	pop    %edi
801046f7:	5d                   	pop    %ebp
801046f8:	c3                   	ret    
801046f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104700:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
80104704:	29 d8                	sub    %ebx,%eax
80104706:	5b                   	pop    %ebx
80104707:	5e                   	pop    %esi
80104708:	5f                   	pop    %edi
80104709:	5d                   	pop    %ebp
8010470a:	c3                   	ret    
8010470b:	90                   	nop
8010470c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104710 <strncpy>:
80104710:	55                   	push   %ebp
80104711:	89 e5                	mov    %esp,%ebp
80104713:	56                   	push   %esi
80104714:	53                   	push   %ebx
80104715:	8b 45 08             	mov    0x8(%ebp),%eax
80104718:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010471b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010471e:	89 c2                	mov    %eax,%edx
80104720:	eb 19                	jmp    8010473b <strncpy+0x2b>
80104722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104728:	83 c3 01             	add    $0x1,%ebx
8010472b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010472f:	83 c2 01             	add    $0x1,%edx
80104732:	84 c9                	test   %cl,%cl
80104734:	88 4a ff             	mov    %cl,-0x1(%edx)
80104737:	74 09                	je     80104742 <strncpy+0x32>
80104739:	89 f1                	mov    %esi,%ecx
8010473b:	85 c9                	test   %ecx,%ecx
8010473d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104740:	7f e6                	jg     80104728 <strncpy+0x18>
80104742:	31 c9                	xor    %ecx,%ecx
80104744:	85 f6                	test   %esi,%esi
80104746:	7e 17                	jle    8010475f <strncpy+0x4f>
80104748:	90                   	nop
80104749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104750:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104754:	89 f3                	mov    %esi,%ebx
80104756:	83 c1 01             	add    $0x1,%ecx
80104759:	29 cb                	sub    %ecx,%ebx
8010475b:	85 db                	test   %ebx,%ebx
8010475d:	7f f1                	jg     80104750 <strncpy+0x40>
8010475f:	5b                   	pop    %ebx
80104760:	5e                   	pop    %esi
80104761:	5d                   	pop    %ebp
80104762:	c3                   	ret    
80104763:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104770 <safestrcpy>:
80104770:	55                   	push   %ebp
80104771:	89 e5                	mov    %esp,%ebp
80104773:	56                   	push   %esi
80104774:	53                   	push   %ebx
80104775:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104778:	8b 45 08             	mov    0x8(%ebp),%eax
8010477b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010477e:	85 c9                	test   %ecx,%ecx
80104780:	7e 26                	jle    801047a8 <safestrcpy+0x38>
80104782:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104786:	89 c1                	mov    %eax,%ecx
80104788:	eb 17                	jmp    801047a1 <safestrcpy+0x31>
8010478a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104790:	83 c2 01             	add    $0x1,%edx
80104793:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104797:	83 c1 01             	add    $0x1,%ecx
8010479a:	84 db                	test   %bl,%bl
8010479c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010479f:	74 04                	je     801047a5 <safestrcpy+0x35>
801047a1:	39 f2                	cmp    %esi,%edx
801047a3:	75 eb                	jne    80104790 <safestrcpy+0x20>
801047a5:	c6 01 00             	movb   $0x0,(%ecx)
801047a8:	5b                   	pop    %ebx
801047a9:	5e                   	pop    %esi
801047aa:	5d                   	pop    %ebp
801047ab:	c3                   	ret    
801047ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801047b0 <strlen>:
801047b0:	55                   	push   %ebp
801047b1:	31 c0                	xor    %eax,%eax
801047b3:	89 e5                	mov    %esp,%ebp
801047b5:	8b 55 08             	mov    0x8(%ebp),%edx
801047b8:	80 3a 00             	cmpb   $0x0,(%edx)
801047bb:	74 0c                	je     801047c9 <strlen+0x19>
801047bd:	8d 76 00             	lea    0x0(%esi),%esi
801047c0:	83 c0 01             	add    $0x1,%eax
801047c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801047c7:	75 f7                	jne    801047c0 <strlen+0x10>
801047c9:	5d                   	pop    %ebp
801047ca:	c3                   	ret    

801047cb <swtch>:
801047cb:	8b 44 24 04          	mov    0x4(%esp),%eax
801047cf:	8b 54 24 08          	mov    0x8(%esp),%edx
801047d3:	55                   	push   %ebp
801047d4:	53                   	push   %ebx
801047d5:	56                   	push   %esi
801047d6:	57                   	push   %edi
801047d7:	89 20                	mov    %esp,(%eax)
801047d9:	89 d4                	mov    %edx,%esp
801047db:	5f                   	pop    %edi
801047dc:	5e                   	pop    %esi
801047dd:	5b                   	pop    %ebx
801047de:	5d                   	pop    %ebp
801047df:	c3                   	ret    

801047e0 <fetchint>:
801047e0:	55                   	push   %ebp
801047e1:	89 e5                	mov    %esp,%ebp
801047e3:	53                   	push   %ebx
801047e4:	83 ec 04             	sub    $0x4,%esp
801047e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801047ea:	e8 f1 ef ff ff       	call   801037e0 <myproc>
801047ef:	8b 00                	mov    (%eax),%eax
801047f1:	39 d8                	cmp    %ebx,%eax
801047f3:	76 1b                	jbe    80104810 <fetchint+0x30>
801047f5:	8d 53 04             	lea    0x4(%ebx),%edx
801047f8:	39 d0                	cmp    %edx,%eax
801047fa:	72 14                	jb     80104810 <fetchint+0x30>
801047fc:	8b 45 0c             	mov    0xc(%ebp),%eax
801047ff:	8b 13                	mov    (%ebx),%edx
80104801:	89 10                	mov    %edx,(%eax)
80104803:	31 c0                	xor    %eax,%eax
80104805:	83 c4 04             	add    $0x4,%esp
80104808:	5b                   	pop    %ebx
80104809:	5d                   	pop    %ebp
8010480a:	c3                   	ret    
8010480b:	90                   	nop
8010480c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104810:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104815:	eb ee                	jmp    80104805 <fetchint+0x25>
80104817:	89 f6                	mov    %esi,%esi
80104819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104820 <fetchstr>:
80104820:	55                   	push   %ebp
80104821:	89 e5                	mov    %esp,%ebp
80104823:	53                   	push   %ebx
80104824:	83 ec 04             	sub    $0x4,%esp
80104827:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010482a:	e8 b1 ef ff ff       	call   801037e0 <myproc>
8010482f:	39 18                	cmp    %ebx,(%eax)
80104831:	76 29                	jbe    8010485c <fetchstr+0x3c>
80104833:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104836:	89 da                	mov    %ebx,%edx
80104838:	89 19                	mov    %ebx,(%ecx)
8010483a:	8b 00                	mov    (%eax),%eax
8010483c:	39 c3                	cmp    %eax,%ebx
8010483e:	73 1c                	jae    8010485c <fetchstr+0x3c>
80104840:	80 3b 00             	cmpb   $0x0,(%ebx)
80104843:	75 10                	jne    80104855 <fetchstr+0x35>
80104845:	eb 39                	jmp    80104880 <fetchstr+0x60>
80104847:	89 f6                	mov    %esi,%esi
80104849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104850:	80 3a 00             	cmpb   $0x0,(%edx)
80104853:	74 1b                	je     80104870 <fetchstr+0x50>
80104855:	83 c2 01             	add    $0x1,%edx
80104858:	39 d0                	cmp    %edx,%eax
8010485a:	77 f4                	ja     80104850 <fetchstr+0x30>
8010485c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104861:	83 c4 04             	add    $0x4,%esp
80104864:	5b                   	pop    %ebx
80104865:	5d                   	pop    %ebp
80104866:	c3                   	ret    
80104867:	89 f6                	mov    %esi,%esi
80104869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104870:	83 c4 04             	add    $0x4,%esp
80104873:	89 d0                	mov    %edx,%eax
80104875:	29 d8                	sub    %ebx,%eax
80104877:	5b                   	pop    %ebx
80104878:	5d                   	pop    %ebp
80104879:	c3                   	ret    
8010487a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104880:	31 c0                	xor    %eax,%eax
80104882:	eb dd                	jmp    80104861 <fetchstr+0x41>
80104884:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010488a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104890 <argint>:
80104890:	55                   	push   %ebp
80104891:	89 e5                	mov    %esp,%ebp
80104893:	56                   	push   %esi
80104894:	53                   	push   %ebx
80104895:	e8 46 ef ff ff       	call   801037e0 <myproc>
8010489a:	8b 40 18             	mov    0x18(%eax),%eax
8010489d:	8b 55 08             	mov    0x8(%ebp),%edx
801048a0:	8b 40 44             	mov    0x44(%eax),%eax
801048a3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
801048a6:	e8 35 ef ff ff       	call   801037e0 <myproc>
801048ab:	8b 00                	mov    (%eax),%eax
801048ad:	8d 73 04             	lea    0x4(%ebx),%esi
801048b0:	39 c6                	cmp    %eax,%esi
801048b2:	73 1c                	jae    801048d0 <argint+0x40>
801048b4:	8d 53 08             	lea    0x8(%ebx),%edx
801048b7:	39 d0                	cmp    %edx,%eax
801048b9:	72 15                	jb     801048d0 <argint+0x40>
801048bb:	8b 45 0c             	mov    0xc(%ebp),%eax
801048be:	8b 53 04             	mov    0x4(%ebx),%edx
801048c1:	89 10                	mov    %edx,(%eax)
801048c3:	31 c0                	xor    %eax,%eax
801048c5:	5b                   	pop    %ebx
801048c6:	5e                   	pop    %esi
801048c7:	5d                   	pop    %ebp
801048c8:	c3                   	ret    
801048c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801048d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801048d5:	eb ee                	jmp    801048c5 <argint+0x35>
801048d7:	89 f6                	mov    %esi,%esi
801048d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048e0 <argptr>:
801048e0:	55                   	push   %ebp
801048e1:	89 e5                	mov    %esp,%ebp
801048e3:	56                   	push   %esi
801048e4:	53                   	push   %ebx
801048e5:	83 ec 10             	sub    $0x10,%esp
801048e8:	8b 5d 10             	mov    0x10(%ebp),%ebx
801048eb:	e8 f0 ee ff ff       	call   801037e0 <myproc>
801048f0:	89 c6                	mov    %eax,%esi
801048f2:	8d 45 f4             	lea    -0xc(%ebp),%eax
801048f5:	83 ec 08             	sub    $0x8,%esp
801048f8:	50                   	push   %eax
801048f9:	ff 75 08             	pushl  0x8(%ebp)
801048fc:	e8 8f ff ff ff       	call   80104890 <argint>
80104901:	83 c4 10             	add    $0x10,%esp
80104904:	85 c0                	test   %eax,%eax
80104906:	78 28                	js     80104930 <argptr+0x50>
80104908:	85 db                	test   %ebx,%ebx
8010490a:	78 24                	js     80104930 <argptr+0x50>
8010490c:	8b 16                	mov    (%esi),%edx
8010490e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104911:	39 c2                	cmp    %eax,%edx
80104913:	76 1b                	jbe    80104930 <argptr+0x50>
80104915:	01 c3                	add    %eax,%ebx
80104917:	39 da                	cmp    %ebx,%edx
80104919:	72 15                	jb     80104930 <argptr+0x50>
8010491b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010491e:	89 02                	mov    %eax,(%edx)
80104920:	31 c0                	xor    %eax,%eax
80104922:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104925:	5b                   	pop    %ebx
80104926:	5e                   	pop    %esi
80104927:	5d                   	pop    %ebp
80104928:	c3                   	ret    
80104929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104930:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104935:	eb eb                	jmp    80104922 <argptr+0x42>
80104937:	89 f6                	mov    %esi,%esi
80104939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104940 <argstr>:
80104940:	55                   	push   %ebp
80104941:	89 e5                	mov    %esp,%ebp
80104943:	83 ec 20             	sub    $0x20,%esp
80104946:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104949:	50                   	push   %eax
8010494a:	ff 75 08             	pushl  0x8(%ebp)
8010494d:	e8 3e ff ff ff       	call   80104890 <argint>
80104952:	83 c4 10             	add    $0x10,%esp
80104955:	85 c0                	test   %eax,%eax
80104957:	78 17                	js     80104970 <argstr+0x30>
80104959:	83 ec 08             	sub    $0x8,%esp
8010495c:	ff 75 0c             	pushl  0xc(%ebp)
8010495f:	ff 75 f4             	pushl  -0xc(%ebp)
80104962:	e8 b9 fe ff ff       	call   80104820 <fetchstr>
80104967:	83 c4 10             	add    $0x10,%esp
8010496a:	c9                   	leave  
8010496b:	c3                   	ret    
8010496c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104970:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104975:	c9                   	leave  
80104976:	c3                   	ret    
80104977:	89 f6                	mov    %esi,%esi
80104979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104980 <syscall>:
80104980:	55                   	push   %ebp
80104981:	89 e5                	mov    %esp,%ebp
80104983:	53                   	push   %ebx
80104984:	83 ec 04             	sub    $0x4,%esp
80104987:	e8 54 ee ff ff       	call   801037e0 <myproc>
8010498c:	89 c3                	mov    %eax,%ebx
8010498e:	8b 40 18             	mov    0x18(%eax),%eax
80104991:	8b 40 1c             	mov    0x1c(%eax),%eax
80104994:	8d 50 ff             	lea    -0x1(%eax),%edx
80104997:	83 fa 15             	cmp    $0x15,%edx
8010499a:	77 1c                	ja     801049b8 <syscall+0x38>
8010499c:	8b 14 85 40 78 10 80 	mov    -0x7fef87c0(,%eax,4),%edx
801049a3:	85 d2                	test   %edx,%edx
801049a5:	74 11                	je     801049b8 <syscall+0x38>
801049a7:	ff d2                	call   *%edx
801049a9:	8b 53 18             	mov    0x18(%ebx),%edx
801049ac:	89 42 1c             	mov    %eax,0x1c(%edx)
801049af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801049b2:	c9                   	leave  
801049b3:	c3                   	ret    
801049b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801049b8:	50                   	push   %eax
801049b9:	8d 43 6c             	lea    0x6c(%ebx),%eax
801049bc:	50                   	push   %eax
801049bd:	ff 73 10             	pushl  0x10(%ebx)
801049c0:	68 05 78 10 80       	push   $0x80107805
801049c5:	e8 96 bc ff ff       	call   80100660 <cprintf>
801049ca:	8b 43 18             	mov    0x18(%ebx),%eax
801049cd:	83 c4 10             	add    $0x10,%esp
801049d0:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
801049d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801049da:	c9                   	leave  
801049db:	c3                   	ret    
801049dc:	66 90                	xchg   %ax,%ax
801049de:	66 90                	xchg   %ax,%ax

801049e0 <create>:
801049e0:	55                   	push   %ebp
801049e1:	89 e5                	mov    %esp,%ebp
801049e3:	57                   	push   %edi
801049e4:	56                   	push   %esi
801049e5:	53                   	push   %ebx
801049e6:	8d 75 da             	lea    -0x26(%ebp),%esi
801049e9:	83 ec 44             	sub    $0x44,%esp
801049ec:	89 4d c0             	mov    %ecx,-0x40(%ebp)
801049ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
801049f2:	56                   	push   %esi
801049f3:	50                   	push   %eax
801049f4:	89 55 c4             	mov    %edx,-0x3c(%ebp)
801049f7:	89 4d bc             	mov    %ecx,-0x44(%ebp)
801049fa:	e8 11 d5 ff ff       	call   80101f10 <nameiparent>
801049ff:	83 c4 10             	add    $0x10,%esp
80104a02:	85 c0                	test   %eax,%eax
80104a04:	0f 84 46 01 00 00    	je     80104b50 <create+0x170>
80104a0a:	83 ec 0c             	sub    $0xc,%esp
80104a0d:	89 c3                	mov    %eax,%ebx
80104a0f:	50                   	push   %eax
80104a10:	e8 7b cc ff ff       	call   80101690 <ilock>
80104a15:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104a18:	83 c4 0c             	add    $0xc,%esp
80104a1b:	50                   	push   %eax
80104a1c:	56                   	push   %esi
80104a1d:	53                   	push   %ebx
80104a1e:	e8 9d d1 ff ff       	call   80101bc0 <dirlookup>
80104a23:	83 c4 10             	add    $0x10,%esp
80104a26:	85 c0                	test   %eax,%eax
80104a28:	89 c7                	mov    %eax,%edi
80104a2a:	74 34                	je     80104a60 <create+0x80>
80104a2c:	83 ec 0c             	sub    $0xc,%esp
80104a2f:	53                   	push   %ebx
80104a30:	e8 eb ce ff ff       	call   80101920 <iunlockput>
80104a35:	89 3c 24             	mov    %edi,(%esp)
80104a38:	e8 53 cc ff ff       	call   80101690 <ilock>
80104a3d:	83 c4 10             	add    $0x10,%esp
80104a40:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104a45:	0f 85 95 00 00 00    	jne    80104ae0 <create+0x100>
80104a4b:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104a50:	0f 85 8a 00 00 00    	jne    80104ae0 <create+0x100>
80104a56:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104a59:	89 f8                	mov    %edi,%eax
80104a5b:	5b                   	pop    %ebx
80104a5c:	5e                   	pop    %esi
80104a5d:	5f                   	pop    %edi
80104a5e:	5d                   	pop    %ebp
80104a5f:	c3                   	ret    
80104a60:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104a64:	83 ec 08             	sub    $0x8,%esp
80104a67:	50                   	push   %eax
80104a68:	ff 33                	pushl  (%ebx)
80104a6a:	e8 b1 ca ff ff       	call   80101520 <ialloc>
80104a6f:	83 c4 10             	add    $0x10,%esp
80104a72:	85 c0                	test   %eax,%eax
80104a74:	89 c7                	mov    %eax,%edi
80104a76:	0f 84 e8 00 00 00    	je     80104b64 <create+0x184>
80104a7c:	83 ec 0c             	sub    $0xc,%esp
80104a7f:	50                   	push   %eax
80104a80:	e8 0b cc ff ff       	call   80101690 <ilock>
80104a85:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104a89:	66 89 47 52          	mov    %ax,0x52(%edi)
80104a8d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104a91:	66 89 47 54          	mov    %ax,0x54(%edi)
80104a95:	b8 01 00 00 00       	mov    $0x1,%eax
80104a9a:	66 89 47 56          	mov    %ax,0x56(%edi)
80104a9e:	89 3c 24             	mov    %edi,(%esp)
80104aa1:	e8 3a cb ff ff       	call   801015e0 <iupdate>
80104aa6:	83 c4 10             	add    $0x10,%esp
80104aa9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104aae:	74 50                	je     80104b00 <create+0x120>
80104ab0:	83 ec 04             	sub    $0x4,%esp
80104ab3:	ff 77 04             	pushl  0x4(%edi)
80104ab6:	56                   	push   %esi
80104ab7:	53                   	push   %ebx
80104ab8:	e8 73 d3 ff ff       	call   80101e30 <dirlink>
80104abd:	83 c4 10             	add    $0x10,%esp
80104ac0:	85 c0                	test   %eax,%eax
80104ac2:	0f 88 8f 00 00 00    	js     80104b57 <create+0x177>
80104ac8:	83 ec 0c             	sub    $0xc,%esp
80104acb:	53                   	push   %ebx
80104acc:	e8 4f ce ff ff       	call   80101920 <iunlockput>
80104ad1:	83 c4 10             	add    $0x10,%esp
80104ad4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ad7:	89 f8                	mov    %edi,%eax
80104ad9:	5b                   	pop    %ebx
80104ada:	5e                   	pop    %esi
80104adb:	5f                   	pop    %edi
80104adc:	5d                   	pop    %ebp
80104add:	c3                   	ret    
80104ade:	66 90                	xchg   %ax,%ax
80104ae0:	83 ec 0c             	sub    $0xc,%esp
80104ae3:	57                   	push   %edi
80104ae4:	31 ff                	xor    %edi,%edi
80104ae6:	e8 35 ce ff ff       	call   80101920 <iunlockput>
80104aeb:	83 c4 10             	add    $0x10,%esp
80104aee:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104af1:	89 f8                	mov    %edi,%eax
80104af3:	5b                   	pop    %ebx
80104af4:	5e                   	pop    %esi
80104af5:	5f                   	pop    %edi
80104af6:	5d                   	pop    %ebp
80104af7:	c3                   	ret    
80104af8:	90                   	nop
80104af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b00:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104b05:	83 ec 0c             	sub    $0xc,%esp
80104b08:	53                   	push   %ebx
80104b09:	e8 d2 ca ff ff       	call   801015e0 <iupdate>
80104b0e:	83 c4 0c             	add    $0xc,%esp
80104b11:	ff 77 04             	pushl  0x4(%edi)
80104b14:	68 b8 78 10 80       	push   $0x801078b8
80104b19:	57                   	push   %edi
80104b1a:	e8 11 d3 ff ff       	call   80101e30 <dirlink>
80104b1f:	83 c4 10             	add    $0x10,%esp
80104b22:	85 c0                	test   %eax,%eax
80104b24:	78 1c                	js     80104b42 <create+0x162>
80104b26:	83 ec 04             	sub    $0x4,%esp
80104b29:	ff 73 04             	pushl  0x4(%ebx)
80104b2c:	68 b7 78 10 80       	push   $0x801078b7
80104b31:	57                   	push   %edi
80104b32:	e8 f9 d2 ff ff       	call   80101e30 <dirlink>
80104b37:	83 c4 10             	add    $0x10,%esp
80104b3a:	85 c0                	test   %eax,%eax
80104b3c:	0f 89 6e ff ff ff    	jns    80104ab0 <create+0xd0>
80104b42:	83 ec 0c             	sub    $0xc,%esp
80104b45:	68 ab 78 10 80       	push   $0x801078ab
80104b4a:	e8 41 b8 ff ff       	call   80100390 <panic>
80104b4f:	90                   	nop
80104b50:	31 ff                	xor    %edi,%edi
80104b52:	e9 ff fe ff ff       	jmp    80104a56 <create+0x76>
80104b57:	83 ec 0c             	sub    $0xc,%esp
80104b5a:	68 ba 78 10 80       	push   $0x801078ba
80104b5f:	e8 2c b8 ff ff       	call   80100390 <panic>
80104b64:	83 ec 0c             	sub    $0xc,%esp
80104b67:	68 9c 78 10 80       	push   $0x8010789c
80104b6c:	e8 1f b8 ff ff       	call   80100390 <panic>
80104b71:	eb 0d                	jmp    80104b80 <argfd.constprop.0>
80104b73:	90                   	nop
80104b74:	90                   	nop
80104b75:	90                   	nop
80104b76:	90                   	nop
80104b77:	90                   	nop
80104b78:	90                   	nop
80104b79:	90                   	nop
80104b7a:	90                   	nop
80104b7b:	90                   	nop
80104b7c:	90                   	nop
80104b7d:	90                   	nop
80104b7e:	90                   	nop
80104b7f:	90                   	nop

80104b80 <argfd.constprop.0>:
80104b80:	55                   	push   %ebp
80104b81:	89 e5                	mov    %esp,%ebp
80104b83:	56                   	push   %esi
80104b84:	53                   	push   %ebx
80104b85:	89 c3                	mov    %eax,%ebx
80104b87:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b8a:	89 d6                	mov    %edx,%esi
80104b8c:	83 ec 18             	sub    $0x18,%esp
80104b8f:	50                   	push   %eax
80104b90:	6a 00                	push   $0x0
80104b92:	e8 f9 fc ff ff       	call   80104890 <argint>
80104b97:	83 c4 10             	add    $0x10,%esp
80104b9a:	85 c0                	test   %eax,%eax
80104b9c:	78 2a                	js     80104bc8 <argfd.constprop.0+0x48>
80104b9e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104ba2:	77 24                	ja     80104bc8 <argfd.constprop.0+0x48>
80104ba4:	e8 37 ec ff ff       	call   801037e0 <myproc>
80104ba9:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104bac:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104bb0:	85 c0                	test   %eax,%eax
80104bb2:	74 14                	je     80104bc8 <argfd.constprop.0+0x48>
80104bb4:	85 db                	test   %ebx,%ebx
80104bb6:	74 02                	je     80104bba <argfd.constprop.0+0x3a>
80104bb8:	89 13                	mov    %edx,(%ebx)
80104bba:	89 06                	mov    %eax,(%esi)
80104bbc:	31 c0                	xor    %eax,%eax
80104bbe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104bc1:	5b                   	pop    %ebx
80104bc2:	5e                   	pop    %esi
80104bc3:	5d                   	pop    %ebp
80104bc4:	c3                   	ret    
80104bc5:	8d 76 00             	lea    0x0(%esi),%esi
80104bc8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104bcd:	eb ef                	jmp    80104bbe <argfd.constprop.0+0x3e>
80104bcf:	90                   	nop

80104bd0 <sys_dup>:
80104bd0:	55                   	push   %ebp
80104bd1:	31 c0                	xor    %eax,%eax
80104bd3:	89 e5                	mov    %esp,%ebp
80104bd5:	56                   	push   %esi
80104bd6:	53                   	push   %ebx
80104bd7:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104bda:	83 ec 10             	sub    $0x10,%esp
80104bdd:	e8 9e ff ff ff       	call   80104b80 <argfd.constprop.0>
80104be2:	85 c0                	test   %eax,%eax
80104be4:	78 42                	js     80104c28 <sys_dup+0x58>
80104be6:	8b 75 f4             	mov    -0xc(%ebp),%esi
80104be9:	31 db                	xor    %ebx,%ebx
80104beb:	e8 f0 eb ff ff       	call   801037e0 <myproc>
80104bf0:	eb 0e                	jmp    80104c00 <sys_dup+0x30>
80104bf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104bf8:	83 c3 01             	add    $0x1,%ebx
80104bfb:	83 fb 10             	cmp    $0x10,%ebx
80104bfe:	74 28                	je     80104c28 <sys_dup+0x58>
80104c00:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104c04:	85 d2                	test   %edx,%edx
80104c06:	75 f0                	jne    80104bf8 <sys_dup+0x28>
80104c08:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
80104c0c:	83 ec 0c             	sub    $0xc,%esp
80104c0f:	ff 75 f4             	pushl  -0xc(%ebp)
80104c12:	e8 d9 c1 ff ff       	call   80100df0 <filedup>
80104c17:	83 c4 10             	add    $0x10,%esp
80104c1a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104c1d:	89 d8                	mov    %ebx,%eax
80104c1f:	5b                   	pop    %ebx
80104c20:	5e                   	pop    %esi
80104c21:	5d                   	pop    %ebp
80104c22:	c3                   	ret    
80104c23:	90                   	nop
80104c24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104c28:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104c2b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104c30:	89 d8                	mov    %ebx,%eax
80104c32:	5b                   	pop    %ebx
80104c33:	5e                   	pop    %esi
80104c34:	5d                   	pop    %ebp
80104c35:	c3                   	ret    
80104c36:	8d 76 00             	lea    0x0(%esi),%esi
80104c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c40 <sys_read>:
80104c40:	55                   	push   %ebp
80104c41:	31 c0                	xor    %eax,%eax
80104c43:	89 e5                	mov    %esp,%ebp
80104c45:	83 ec 18             	sub    $0x18,%esp
80104c48:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104c4b:	e8 30 ff ff ff       	call   80104b80 <argfd.constprop.0>
80104c50:	85 c0                	test   %eax,%eax
80104c52:	78 4c                	js     80104ca0 <sys_read+0x60>
80104c54:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c57:	83 ec 08             	sub    $0x8,%esp
80104c5a:	50                   	push   %eax
80104c5b:	6a 02                	push   $0x2
80104c5d:	e8 2e fc ff ff       	call   80104890 <argint>
80104c62:	83 c4 10             	add    $0x10,%esp
80104c65:	85 c0                	test   %eax,%eax
80104c67:	78 37                	js     80104ca0 <sys_read+0x60>
80104c69:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c6c:	83 ec 04             	sub    $0x4,%esp
80104c6f:	ff 75 f0             	pushl  -0x10(%ebp)
80104c72:	50                   	push   %eax
80104c73:	6a 01                	push   $0x1
80104c75:	e8 66 fc ff ff       	call   801048e0 <argptr>
80104c7a:	83 c4 10             	add    $0x10,%esp
80104c7d:	85 c0                	test   %eax,%eax
80104c7f:	78 1f                	js     80104ca0 <sys_read+0x60>
80104c81:	83 ec 04             	sub    $0x4,%esp
80104c84:	ff 75 f0             	pushl  -0x10(%ebp)
80104c87:	ff 75 f4             	pushl  -0xc(%ebp)
80104c8a:	ff 75 ec             	pushl  -0x14(%ebp)
80104c8d:	e8 ce c2 ff ff       	call   80100f60 <fileread>
80104c92:	83 c4 10             	add    $0x10,%esp
80104c95:	c9                   	leave  
80104c96:	c3                   	ret    
80104c97:	89 f6                	mov    %esi,%esi
80104c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104ca0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ca5:	c9                   	leave  
80104ca6:	c3                   	ret    
80104ca7:	89 f6                	mov    %esi,%esi
80104ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cb0 <sys_write>:
80104cb0:	55                   	push   %ebp
80104cb1:	31 c0                	xor    %eax,%eax
80104cb3:	89 e5                	mov    %esp,%ebp
80104cb5:	83 ec 18             	sub    $0x18,%esp
80104cb8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104cbb:	e8 c0 fe ff ff       	call   80104b80 <argfd.constprop.0>
80104cc0:	85 c0                	test   %eax,%eax
80104cc2:	78 4c                	js     80104d10 <sys_write+0x60>
80104cc4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104cc7:	83 ec 08             	sub    $0x8,%esp
80104cca:	50                   	push   %eax
80104ccb:	6a 02                	push   $0x2
80104ccd:	e8 be fb ff ff       	call   80104890 <argint>
80104cd2:	83 c4 10             	add    $0x10,%esp
80104cd5:	85 c0                	test   %eax,%eax
80104cd7:	78 37                	js     80104d10 <sys_write+0x60>
80104cd9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cdc:	83 ec 04             	sub    $0x4,%esp
80104cdf:	ff 75 f0             	pushl  -0x10(%ebp)
80104ce2:	50                   	push   %eax
80104ce3:	6a 01                	push   $0x1
80104ce5:	e8 f6 fb ff ff       	call   801048e0 <argptr>
80104cea:	83 c4 10             	add    $0x10,%esp
80104ced:	85 c0                	test   %eax,%eax
80104cef:	78 1f                	js     80104d10 <sys_write+0x60>
80104cf1:	83 ec 04             	sub    $0x4,%esp
80104cf4:	ff 75 f0             	pushl  -0x10(%ebp)
80104cf7:	ff 75 f4             	pushl  -0xc(%ebp)
80104cfa:	ff 75 ec             	pushl  -0x14(%ebp)
80104cfd:	e8 ee c2 ff ff       	call   80100ff0 <filewrite>
80104d02:	83 c4 10             	add    $0x10,%esp
80104d05:	c9                   	leave  
80104d06:	c3                   	ret    
80104d07:	89 f6                	mov    %esi,%esi
80104d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104d10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d15:	c9                   	leave  
80104d16:	c3                   	ret    
80104d17:	89 f6                	mov    %esi,%esi
80104d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d20 <sys_close>:
80104d20:	55                   	push   %ebp
80104d21:	89 e5                	mov    %esp,%ebp
80104d23:	83 ec 18             	sub    $0x18,%esp
80104d26:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104d29:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d2c:	e8 4f fe ff ff       	call   80104b80 <argfd.constprop.0>
80104d31:	85 c0                	test   %eax,%eax
80104d33:	78 2b                	js     80104d60 <sys_close+0x40>
80104d35:	e8 a6 ea ff ff       	call   801037e0 <myproc>
80104d3a:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104d3d:	83 ec 0c             	sub    $0xc,%esp
80104d40:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104d47:	00 
80104d48:	ff 75 f4             	pushl  -0xc(%ebp)
80104d4b:	e8 f0 c0 ff ff       	call   80100e40 <fileclose>
80104d50:	83 c4 10             	add    $0x10,%esp
80104d53:	31 c0                	xor    %eax,%eax
80104d55:	c9                   	leave  
80104d56:	c3                   	ret    
80104d57:	89 f6                	mov    %esi,%esi
80104d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104d60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d65:	c9                   	leave  
80104d66:	c3                   	ret    
80104d67:	89 f6                	mov    %esi,%esi
80104d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d70 <sys_fstat>:
80104d70:	55                   	push   %ebp
80104d71:	31 c0                	xor    %eax,%eax
80104d73:	89 e5                	mov    %esp,%ebp
80104d75:	83 ec 18             	sub    $0x18,%esp
80104d78:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104d7b:	e8 00 fe ff ff       	call   80104b80 <argfd.constprop.0>
80104d80:	85 c0                	test   %eax,%eax
80104d82:	78 2c                	js     80104db0 <sys_fstat+0x40>
80104d84:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d87:	83 ec 04             	sub    $0x4,%esp
80104d8a:	6a 14                	push   $0x14
80104d8c:	50                   	push   %eax
80104d8d:	6a 01                	push   $0x1
80104d8f:	e8 4c fb ff ff       	call   801048e0 <argptr>
80104d94:	83 c4 10             	add    $0x10,%esp
80104d97:	85 c0                	test   %eax,%eax
80104d99:	78 15                	js     80104db0 <sys_fstat+0x40>
80104d9b:	83 ec 08             	sub    $0x8,%esp
80104d9e:	ff 75 f4             	pushl  -0xc(%ebp)
80104da1:	ff 75 f0             	pushl  -0x10(%ebp)
80104da4:	e8 67 c1 ff ff       	call   80100f10 <filestat>
80104da9:	83 c4 10             	add    $0x10,%esp
80104dac:	c9                   	leave  
80104dad:	c3                   	ret    
80104dae:	66 90                	xchg   %ax,%ax
80104db0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104db5:	c9                   	leave  
80104db6:	c3                   	ret    
80104db7:	89 f6                	mov    %esi,%esi
80104db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104dc0 <sys_link>:
80104dc0:	55                   	push   %ebp
80104dc1:	89 e5                	mov    %esp,%ebp
80104dc3:	57                   	push   %edi
80104dc4:	56                   	push   %esi
80104dc5:	53                   	push   %ebx
80104dc6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104dc9:	83 ec 34             	sub    $0x34,%esp
80104dcc:	50                   	push   %eax
80104dcd:	6a 00                	push   $0x0
80104dcf:	e8 6c fb ff ff       	call   80104940 <argstr>
80104dd4:	83 c4 10             	add    $0x10,%esp
80104dd7:	85 c0                	test   %eax,%eax
80104dd9:	0f 88 fb 00 00 00    	js     80104eda <sys_link+0x11a>
80104ddf:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104de2:	83 ec 08             	sub    $0x8,%esp
80104de5:	50                   	push   %eax
80104de6:	6a 01                	push   $0x1
80104de8:	e8 53 fb ff ff       	call   80104940 <argstr>
80104ded:	83 c4 10             	add    $0x10,%esp
80104df0:	85 c0                	test   %eax,%eax
80104df2:	0f 88 e2 00 00 00    	js     80104eda <sys_link+0x11a>
80104df8:	e8 b3 dd ff ff       	call   80102bb0 <begin_op>
80104dfd:	83 ec 0c             	sub    $0xc,%esp
80104e00:	ff 75 d4             	pushl  -0x2c(%ebp)
80104e03:	e8 e8 d0 ff ff       	call   80101ef0 <namei>
80104e08:	83 c4 10             	add    $0x10,%esp
80104e0b:	85 c0                	test   %eax,%eax
80104e0d:	89 c3                	mov    %eax,%ebx
80104e0f:	0f 84 ea 00 00 00    	je     80104eff <sys_link+0x13f>
80104e15:	83 ec 0c             	sub    $0xc,%esp
80104e18:	50                   	push   %eax
80104e19:	e8 72 c8 ff ff       	call   80101690 <ilock>
80104e1e:	83 c4 10             	add    $0x10,%esp
80104e21:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104e26:	0f 84 bb 00 00 00    	je     80104ee7 <sys_link+0x127>
80104e2c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104e31:	83 ec 0c             	sub    $0xc,%esp
80104e34:	8d 7d da             	lea    -0x26(%ebp),%edi
80104e37:	53                   	push   %ebx
80104e38:	e8 a3 c7 ff ff       	call   801015e0 <iupdate>
80104e3d:	89 1c 24             	mov    %ebx,(%esp)
80104e40:	e8 2b c9 ff ff       	call   80101770 <iunlock>
80104e45:	58                   	pop    %eax
80104e46:	5a                   	pop    %edx
80104e47:	57                   	push   %edi
80104e48:	ff 75 d0             	pushl  -0x30(%ebp)
80104e4b:	e8 c0 d0 ff ff       	call   80101f10 <nameiparent>
80104e50:	83 c4 10             	add    $0x10,%esp
80104e53:	85 c0                	test   %eax,%eax
80104e55:	89 c6                	mov    %eax,%esi
80104e57:	74 5b                	je     80104eb4 <sys_link+0xf4>
80104e59:	83 ec 0c             	sub    $0xc,%esp
80104e5c:	50                   	push   %eax
80104e5d:	e8 2e c8 ff ff       	call   80101690 <ilock>
80104e62:	83 c4 10             	add    $0x10,%esp
80104e65:	8b 03                	mov    (%ebx),%eax
80104e67:	39 06                	cmp    %eax,(%esi)
80104e69:	75 3d                	jne    80104ea8 <sys_link+0xe8>
80104e6b:	83 ec 04             	sub    $0x4,%esp
80104e6e:	ff 73 04             	pushl  0x4(%ebx)
80104e71:	57                   	push   %edi
80104e72:	56                   	push   %esi
80104e73:	e8 b8 cf ff ff       	call   80101e30 <dirlink>
80104e78:	83 c4 10             	add    $0x10,%esp
80104e7b:	85 c0                	test   %eax,%eax
80104e7d:	78 29                	js     80104ea8 <sys_link+0xe8>
80104e7f:	83 ec 0c             	sub    $0xc,%esp
80104e82:	56                   	push   %esi
80104e83:	e8 98 ca ff ff       	call   80101920 <iunlockput>
80104e88:	89 1c 24             	mov    %ebx,(%esp)
80104e8b:	e8 30 c9 ff ff       	call   801017c0 <iput>
80104e90:	e8 8b dd ff ff       	call   80102c20 <end_op>
80104e95:	83 c4 10             	add    $0x10,%esp
80104e98:	31 c0                	xor    %eax,%eax
80104e9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e9d:	5b                   	pop    %ebx
80104e9e:	5e                   	pop    %esi
80104e9f:	5f                   	pop    %edi
80104ea0:	5d                   	pop    %ebp
80104ea1:	c3                   	ret    
80104ea2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104ea8:	83 ec 0c             	sub    $0xc,%esp
80104eab:	56                   	push   %esi
80104eac:	e8 6f ca ff ff       	call   80101920 <iunlockput>
80104eb1:	83 c4 10             	add    $0x10,%esp
80104eb4:	83 ec 0c             	sub    $0xc,%esp
80104eb7:	53                   	push   %ebx
80104eb8:	e8 d3 c7 ff ff       	call   80101690 <ilock>
80104ebd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104ec2:	89 1c 24             	mov    %ebx,(%esp)
80104ec5:	e8 16 c7 ff ff       	call   801015e0 <iupdate>
80104eca:	89 1c 24             	mov    %ebx,(%esp)
80104ecd:	e8 4e ca ff ff       	call   80101920 <iunlockput>
80104ed2:	e8 49 dd ff ff       	call   80102c20 <end_op>
80104ed7:	83 c4 10             	add    $0x10,%esp
80104eda:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104edd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ee2:	5b                   	pop    %ebx
80104ee3:	5e                   	pop    %esi
80104ee4:	5f                   	pop    %edi
80104ee5:	5d                   	pop    %ebp
80104ee6:	c3                   	ret    
80104ee7:	83 ec 0c             	sub    $0xc,%esp
80104eea:	53                   	push   %ebx
80104eeb:	e8 30 ca ff ff       	call   80101920 <iunlockput>
80104ef0:	e8 2b dd ff ff       	call   80102c20 <end_op>
80104ef5:	83 c4 10             	add    $0x10,%esp
80104ef8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104efd:	eb 9b                	jmp    80104e9a <sys_link+0xda>
80104eff:	e8 1c dd ff ff       	call   80102c20 <end_op>
80104f04:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f09:	eb 8f                	jmp    80104e9a <sys_link+0xda>
80104f0b:	90                   	nop
80104f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104f10 <sys_unlink>:
80104f10:	55                   	push   %ebp
80104f11:	89 e5                	mov    %esp,%ebp
80104f13:	57                   	push   %edi
80104f14:	56                   	push   %esi
80104f15:	53                   	push   %ebx
80104f16:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104f19:	83 ec 44             	sub    $0x44,%esp
80104f1c:	50                   	push   %eax
80104f1d:	6a 00                	push   $0x0
80104f1f:	e8 1c fa ff ff       	call   80104940 <argstr>
80104f24:	83 c4 10             	add    $0x10,%esp
80104f27:	85 c0                	test   %eax,%eax
80104f29:	0f 88 77 01 00 00    	js     801050a6 <sys_unlink+0x196>
80104f2f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104f32:	e8 79 dc ff ff       	call   80102bb0 <begin_op>
80104f37:	83 ec 08             	sub    $0x8,%esp
80104f3a:	53                   	push   %ebx
80104f3b:	ff 75 c0             	pushl  -0x40(%ebp)
80104f3e:	e8 cd cf ff ff       	call   80101f10 <nameiparent>
80104f43:	83 c4 10             	add    $0x10,%esp
80104f46:	85 c0                	test   %eax,%eax
80104f48:	89 c6                	mov    %eax,%esi
80104f4a:	0f 84 60 01 00 00    	je     801050b0 <sys_unlink+0x1a0>
80104f50:	83 ec 0c             	sub    $0xc,%esp
80104f53:	50                   	push   %eax
80104f54:	e8 37 c7 ff ff       	call   80101690 <ilock>
80104f59:	58                   	pop    %eax
80104f5a:	5a                   	pop    %edx
80104f5b:	68 b8 78 10 80       	push   $0x801078b8
80104f60:	53                   	push   %ebx
80104f61:	e8 3a cc ff ff       	call   80101ba0 <namecmp>
80104f66:	83 c4 10             	add    $0x10,%esp
80104f69:	85 c0                	test   %eax,%eax
80104f6b:	0f 84 03 01 00 00    	je     80105074 <sys_unlink+0x164>
80104f71:	83 ec 08             	sub    $0x8,%esp
80104f74:	68 b7 78 10 80       	push   $0x801078b7
80104f79:	53                   	push   %ebx
80104f7a:	e8 21 cc ff ff       	call   80101ba0 <namecmp>
80104f7f:	83 c4 10             	add    $0x10,%esp
80104f82:	85 c0                	test   %eax,%eax
80104f84:	0f 84 ea 00 00 00    	je     80105074 <sys_unlink+0x164>
80104f8a:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104f8d:	83 ec 04             	sub    $0x4,%esp
80104f90:	50                   	push   %eax
80104f91:	53                   	push   %ebx
80104f92:	56                   	push   %esi
80104f93:	e8 28 cc ff ff       	call   80101bc0 <dirlookup>
80104f98:	83 c4 10             	add    $0x10,%esp
80104f9b:	85 c0                	test   %eax,%eax
80104f9d:	89 c3                	mov    %eax,%ebx
80104f9f:	0f 84 cf 00 00 00    	je     80105074 <sys_unlink+0x164>
80104fa5:	83 ec 0c             	sub    $0xc,%esp
80104fa8:	50                   	push   %eax
80104fa9:	e8 e2 c6 ff ff       	call   80101690 <ilock>
80104fae:	83 c4 10             	add    $0x10,%esp
80104fb1:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104fb6:	0f 8e 10 01 00 00    	jle    801050cc <sys_unlink+0x1bc>
80104fbc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104fc1:	74 6d                	je     80105030 <sys_unlink+0x120>
80104fc3:	8d 45 d8             	lea    -0x28(%ebp),%eax
80104fc6:	83 ec 04             	sub    $0x4,%esp
80104fc9:	6a 10                	push   $0x10
80104fcb:	6a 00                	push   $0x0
80104fcd:	50                   	push   %eax
80104fce:	e8 bd f5 ff ff       	call   80104590 <memset>
80104fd3:	8d 45 d8             	lea    -0x28(%ebp),%eax
80104fd6:	6a 10                	push   $0x10
80104fd8:	ff 75 c4             	pushl  -0x3c(%ebp)
80104fdb:	50                   	push   %eax
80104fdc:	56                   	push   %esi
80104fdd:	e8 8e ca ff ff       	call   80101a70 <writei>
80104fe2:	83 c4 20             	add    $0x20,%esp
80104fe5:	83 f8 10             	cmp    $0x10,%eax
80104fe8:	0f 85 eb 00 00 00    	jne    801050d9 <sys_unlink+0x1c9>
80104fee:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104ff3:	0f 84 97 00 00 00    	je     80105090 <sys_unlink+0x180>
80104ff9:	83 ec 0c             	sub    $0xc,%esp
80104ffc:	56                   	push   %esi
80104ffd:	e8 1e c9 ff ff       	call   80101920 <iunlockput>
80105002:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80105007:	89 1c 24             	mov    %ebx,(%esp)
8010500a:	e8 d1 c5 ff ff       	call   801015e0 <iupdate>
8010500f:	89 1c 24             	mov    %ebx,(%esp)
80105012:	e8 09 c9 ff ff       	call   80101920 <iunlockput>
80105017:	e8 04 dc ff ff       	call   80102c20 <end_op>
8010501c:	83 c4 10             	add    $0x10,%esp
8010501f:	31 c0                	xor    %eax,%eax
80105021:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105024:	5b                   	pop    %ebx
80105025:	5e                   	pop    %esi
80105026:	5f                   	pop    %edi
80105027:	5d                   	pop    %ebp
80105028:	c3                   	ret    
80105029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105030:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105034:	76 8d                	jbe    80104fc3 <sys_unlink+0xb3>
80105036:	bf 20 00 00 00       	mov    $0x20,%edi
8010503b:	eb 0f                	jmp    8010504c <sys_unlink+0x13c>
8010503d:	8d 76 00             	lea    0x0(%esi),%esi
80105040:	83 c7 10             	add    $0x10,%edi
80105043:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105046:	0f 83 77 ff ff ff    	jae    80104fc3 <sys_unlink+0xb3>
8010504c:	8d 45 d8             	lea    -0x28(%ebp),%eax
8010504f:	6a 10                	push   $0x10
80105051:	57                   	push   %edi
80105052:	50                   	push   %eax
80105053:	53                   	push   %ebx
80105054:	e8 17 c9 ff ff       	call   80101970 <readi>
80105059:	83 c4 10             	add    $0x10,%esp
8010505c:	83 f8 10             	cmp    $0x10,%eax
8010505f:	75 5e                	jne    801050bf <sys_unlink+0x1af>
80105061:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105066:	74 d8                	je     80105040 <sys_unlink+0x130>
80105068:	83 ec 0c             	sub    $0xc,%esp
8010506b:	53                   	push   %ebx
8010506c:	e8 af c8 ff ff       	call   80101920 <iunlockput>
80105071:	83 c4 10             	add    $0x10,%esp
80105074:	83 ec 0c             	sub    $0xc,%esp
80105077:	56                   	push   %esi
80105078:	e8 a3 c8 ff ff       	call   80101920 <iunlockput>
8010507d:	e8 9e db ff ff       	call   80102c20 <end_op>
80105082:	83 c4 10             	add    $0x10,%esp
80105085:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010508a:	eb 95                	jmp    80105021 <sys_unlink+0x111>
8010508c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105090:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
80105095:	83 ec 0c             	sub    $0xc,%esp
80105098:	56                   	push   %esi
80105099:	e8 42 c5 ff ff       	call   801015e0 <iupdate>
8010509e:	83 c4 10             	add    $0x10,%esp
801050a1:	e9 53 ff ff ff       	jmp    80104ff9 <sys_unlink+0xe9>
801050a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050ab:	e9 71 ff ff ff       	jmp    80105021 <sys_unlink+0x111>
801050b0:	e8 6b db ff ff       	call   80102c20 <end_op>
801050b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050ba:	e9 62 ff ff ff       	jmp    80105021 <sys_unlink+0x111>
801050bf:	83 ec 0c             	sub    $0xc,%esp
801050c2:	68 dc 78 10 80       	push   $0x801078dc
801050c7:	e8 c4 b2 ff ff       	call   80100390 <panic>
801050cc:	83 ec 0c             	sub    $0xc,%esp
801050cf:	68 ca 78 10 80       	push   $0x801078ca
801050d4:	e8 b7 b2 ff ff       	call   80100390 <panic>
801050d9:	83 ec 0c             	sub    $0xc,%esp
801050dc:	68 ee 78 10 80       	push   $0x801078ee
801050e1:	e8 aa b2 ff ff       	call   80100390 <panic>
801050e6:	8d 76 00             	lea    0x0(%esi),%esi
801050e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801050f0 <sys_open>:
801050f0:	55                   	push   %ebp
801050f1:	89 e5                	mov    %esp,%ebp
801050f3:	57                   	push   %edi
801050f4:	56                   	push   %esi
801050f5:	53                   	push   %ebx
801050f6:	8d 45 e0             	lea    -0x20(%ebp),%eax
801050f9:	83 ec 24             	sub    $0x24,%esp
801050fc:	50                   	push   %eax
801050fd:	6a 00                	push   $0x0
801050ff:	e8 3c f8 ff ff       	call   80104940 <argstr>
80105104:	83 c4 10             	add    $0x10,%esp
80105107:	85 c0                	test   %eax,%eax
80105109:	0f 88 1d 01 00 00    	js     8010522c <sys_open+0x13c>
8010510f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105112:	83 ec 08             	sub    $0x8,%esp
80105115:	50                   	push   %eax
80105116:	6a 01                	push   $0x1
80105118:	e8 73 f7 ff ff       	call   80104890 <argint>
8010511d:	83 c4 10             	add    $0x10,%esp
80105120:	85 c0                	test   %eax,%eax
80105122:	0f 88 04 01 00 00    	js     8010522c <sys_open+0x13c>
80105128:	e8 83 da ff ff       	call   80102bb0 <begin_op>
8010512d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105131:	0f 85 a9 00 00 00    	jne    801051e0 <sys_open+0xf0>
80105137:	83 ec 0c             	sub    $0xc,%esp
8010513a:	ff 75 e0             	pushl  -0x20(%ebp)
8010513d:	e8 ae cd ff ff       	call   80101ef0 <namei>
80105142:	83 c4 10             	add    $0x10,%esp
80105145:	85 c0                	test   %eax,%eax
80105147:	89 c6                	mov    %eax,%esi
80105149:	0f 84 b2 00 00 00    	je     80105201 <sys_open+0x111>
8010514f:	83 ec 0c             	sub    $0xc,%esp
80105152:	50                   	push   %eax
80105153:	e8 38 c5 ff ff       	call   80101690 <ilock>
80105158:	83 c4 10             	add    $0x10,%esp
8010515b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105160:	0f 84 aa 00 00 00    	je     80105210 <sys_open+0x120>
80105166:	e8 15 bc ff ff       	call   80100d80 <filealloc>
8010516b:	85 c0                	test   %eax,%eax
8010516d:	89 c7                	mov    %eax,%edi
8010516f:	0f 84 a6 00 00 00    	je     8010521b <sys_open+0x12b>
80105175:	e8 66 e6 ff ff       	call   801037e0 <myproc>
8010517a:	31 db                	xor    %ebx,%ebx
8010517c:	eb 0e                	jmp    8010518c <sys_open+0x9c>
8010517e:	66 90                	xchg   %ax,%ax
80105180:	83 c3 01             	add    $0x1,%ebx
80105183:	83 fb 10             	cmp    $0x10,%ebx
80105186:	0f 84 ac 00 00 00    	je     80105238 <sys_open+0x148>
8010518c:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105190:	85 d2                	test   %edx,%edx
80105192:	75 ec                	jne    80105180 <sys_open+0x90>
80105194:	83 ec 0c             	sub    $0xc,%esp
80105197:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
8010519b:	56                   	push   %esi
8010519c:	e8 cf c5 ff ff       	call   80101770 <iunlock>
801051a1:	e8 7a da ff ff       	call   80102c20 <end_op>
801051a6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
801051ac:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801051af:	83 c4 10             	add    $0x10,%esp
801051b2:	89 77 10             	mov    %esi,0x10(%edi)
801051b5:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
801051bc:	89 d0                	mov    %edx,%eax
801051be:	f7 d0                	not    %eax
801051c0:	83 e0 01             	and    $0x1,%eax
801051c3:	83 e2 03             	and    $0x3,%edx
801051c6:	88 47 08             	mov    %al,0x8(%edi)
801051c9:	0f 95 47 09          	setne  0x9(%edi)
801051cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801051d0:	89 d8                	mov    %ebx,%eax
801051d2:	5b                   	pop    %ebx
801051d3:	5e                   	pop    %esi
801051d4:	5f                   	pop    %edi
801051d5:	5d                   	pop    %ebp
801051d6:	c3                   	ret    
801051d7:	89 f6                	mov    %esi,%esi
801051d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801051e0:	83 ec 0c             	sub    $0xc,%esp
801051e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801051e6:	31 c9                	xor    %ecx,%ecx
801051e8:	6a 00                	push   $0x0
801051ea:	ba 02 00 00 00       	mov    $0x2,%edx
801051ef:	e8 ec f7 ff ff       	call   801049e0 <create>
801051f4:	83 c4 10             	add    $0x10,%esp
801051f7:	85 c0                	test   %eax,%eax
801051f9:	89 c6                	mov    %eax,%esi
801051fb:	0f 85 65 ff ff ff    	jne    80105166 <sys_open+0x76>
80105201:	e8 1a da ff ff       	call   80102c20 <end_op>
80105206:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010520b:	eb c0                	jmp    801051cd <sys_open+0xdd>
8010520d:	8d 76 00             	lea    0x0(%esi),%esi
80105210:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105213:	85 c9                	test   %ecx,%ecx
80105215:	0f 84 4b ff ff ff    	je     80105166 <sys_open+0x76>
8010521b:	83 ec 0c             	sub    $0xc,%esp
8010521e:	56                   	push   %esi
8010521f:	e8 fc c6 ff ff       	call   80101920 <iunlockput>
80105224:	e8 f7 d9 ff ff       	call   80102c20 <end_op>
80105229:	83 c4 10             	add    $0x10,%esp
8010522c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105231:	eb 9a                	jmp    801051cd <sys_open+0xdd>
80105233:	90                   	nop
80105234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105238:	83 ec 0c             	sub    $0xc,%esp
8010523b:	57                   	push   %edi
8010523c:	e8 ff bb ff ff       	call   80100e40 <fileclose>
80105241:	83 c4 10             	add    $0x10,%esp
80105244:	eb d5                	jmp    8010521b <sys_open+0x12b>
80105246:	8d 76 00             	lea    0x0(%esi),%esi
80105249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105250 <sys_mkdir>:
80105250:	55                   	push   %ebp
80105251:	89 e5                	mov    %esp,%ebp
80105253:	83 ec 18             	sub    $0x18,%esp
80105256:	e8 55 d9 ff ff       	call   80102bb0 <begin_op>
8010525b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010525e:	83 ec 08             	sub    $0x8,%esp
80105261:	50                   	push   %eax
80105262:	6a 00                	push   $0x0
80105264:	e8 d7 f6 ff ff       	call   80104940 <argstr>
80105269:	83 c4 10             	add    $0x10,%esp
8010526c:	85 c0                	test   %eax,%eax
8010526e:	78 30                	js     801052a0 <sys_mkdir+0x50>
80105270:	83 ec 0c             	sub    $0xc,%esp
80105273:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105276:	31 c9                	xor    %ecx,%ecx
80105278:	6a 00                	push   $0x0
8010527a:	ba 01 00 00 00       	mov    $0x1,%edx
8010527f:	e8 5c f7 ff ff       	call   801049e0 <create>
80105284:	83 c4 10             	add    $0x10,%esp
80105287:	85 c0                	test   %eax,%eax
80105289:	74 15                	je     801052a0 <sys_mkdir+0x50>
8010528b:	83 ec 0c             	sub    $0xc,%esp
8010528e:	50                   	push   %eax
8010528f:	e8 8c c6 ff ff       	call   80101920 <iunlockput>
80105294:	e8 87 d9 ff ff       	call   80102c20 <end_op>
80105299:	83 c4 10             	add    $0x10,%esp
8010529c:	31 c0                	xor    %eax,%eax
8010529e:	c9                   	leave  
8010529f:	c3                   	ret    
801052a0:	e8 7b d9 ff ff       	call   80102c20 <end_op>
801052a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052aa:	c9                   	leave  
801052ab:	c3                   	ret    
801052ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801052b0 <sys_mknod>:
801052b0:	55                   	push   %ebp
801052b1:	89 e5                	mov    %esp,%ebp
801052b3:	83 ec 18             	sub    $0x18,%esp
801052b6:	e8 f5 d8 ff ff       	call   80102bb0 <begin_op>
801052bb:	8d 45 ec             	lea    -0x14(%ebp),%eax
801052be:	83 ec 08             	sub    $0x8,%esp
801052c1:	50                   	push   %eax
801052c2:	6a 00                	push   $0x0
801052c4:	e8 77 f6 ff ff       	call   80104940 <argstr>
801052c9:	83 c4 10             	add    $0x10,%esp
801052cc:	85 c0                	test   %eax,%eax
801052ce:	78 60                	js     80105330 <sys_mknod+0x80>
801052d0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801052d3:	83 ec 08             	sub    $0x8,%esp
801052d6:	50                   	push   %eax
801052d7:	6a 01                	push   $0x1
801052d9:	e8 b2 f5 ff ff       	call   80104890 <argint>
801052de:	83 c4 10             	add    $0x10,%esp
801052e1:	85 c0                	test   %eax,%eax
801052e3:	78 4b                	js     80105330 <sys_mknod+0x80>
801052e5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052e8:	83 ec 08             	sub    $0x8,%esp
801052eb:	50                   	push   %eax
801052ec:	6a 02                	push   $0x2
801052ee:	e8 9d f5 ff ff       	call   80104890 <argint>
801052f3:	83 c4 10             	add    $0x10,%esp
801052f6:	85 c0                	test   %eax,%eax
801052f8:	78 36                	js     80105330 <sys_mknod+0x80>
801052fa:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801052fe:	83 ec 0c             	sub    $0xc,%esp
80105301:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105305:	ba 03 00 00 00       	mov    $0x3,%edx
8010530a:	50                   	push   %eax
8010530b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010530e:	e8 cd f6 ff ff       	call   801049e0 <create>
80105313:	83 c4 10             	add    $0x10,%esp
80105316:	85 c0                	test   %eax,%eax
80105318:	74 16                	je     80105330 <sys_mknod+0x80>
8010531a:	83 ec 0c             	sub    $0xc,%esp
8010531d:	50                   	push   %eax
8010531e:	e8 fd c5 ff ff       	call   80101920 <iunlockput>
80105323:	e8 f8 d8 ff ff       	call   80102c20 <end_op>
80105328:	83 c4 10             	add    $0x10,%esp
8010532b:	31 c0                	xor    %eax,%eax
8010532d:	c9                   	leave  
8010532e:	c3                   	ret    
8010532f:	90                   	nop
80105330:	e8 eb d8 ff ff       	call   80102c20 <end_op>
80105335:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010533a:	c9                   	leave  
8010533b:	c3                   	ret    
8010533c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105340 <sys_chdir>:
80105340:	55                   	push   %ebp
80105341:	89 e5                	mov    %esp,%ebp
80105343:	56                   	push   %esi
80105344:	53                   	push   %ebx
80105345:	83 ec 10             	sub    $0x10,%esp
80105348:	e8 93 e4 ff ff       	call   801037e0 <myproc>
8010534d:	89 c6                	mov    %eax,%esi
8010534f:	e8 5c d8 ff ff       	call   80102bb0 <begin_op>
80105354:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105357:	83 ec 08             	sub    $0x8,%esp
8010535a:	50                   	push   %eax
8010535b:	6a 00                	push   $0x0
8010535d:	e8 de f5 ff ff       	call   80104940 <argstr>
80105362:	83 c4 10             	add    $0x10,%esp
80105365:	85 c0                	test   %eax,%eax
80105367:	78 77                	js     801053e0 <sys_chdir+0xa0>
80105369:	83 ec 0c             	sub    $0xc,%esp
8010536c:	ff 75 f4             	pushl  -0xc(%ebp)
8010536f:	e8 7c cb ff ff       	call   80101ef0 <namei>
80105374:	83 c4 10             	add    $0x10,%esp
80105377:	85 c0                	test   %eax,%eax
80105379:	89 c3                	mov    %eax,%ebx
8010537b:	74 63                	je     801053e0 <sys_chdir+0xa0>
8010537d:	83 ec 0c             	sub    $0xc,%esp
80105380:	50                   	push   %eax
80105381:	e8 0a c3 ff ff       	call   80101690 <ilock>
80105386:	83 c4 10             	add    $0x10,%esp
80105389:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010538e:	75 30                	jne    801053c0 <sys_chdir+0x80>
80105390:	83 ec 0c             	sub    $0xc,%esp
80105393:	53                   	push   %ebx
80105394:	e8 d7 c3 ff ff       	call   80101770 <iunlock>
80105399:	58                   	pop    %eax
8010539a:	ff 76 68             	pushl  0x68(%esi)
8010539d:	e8 1e c4 ff ff       	call   801017c0 <iput>
801053a2:	e8 79 d8 ff ff       	call   80102c20 <end_op>
801053a7:	89 5e 68             	mov    %ebx,0x68(%esi)
801053aa:	83 c4 10             	add    $0x10,%esp
801053ad:	31 c0                	xor    %eax,%eax
801053af:	8d 65 f8             	lea    -0x8(%ebp),%esp
801053b2:	5b                   	pop    %ebx
801053b3:	5e                   	pop    %esi
801053b4:	5d                   	pop    %ebp
801053b5:	c3                   	ret    
801053b6:	8d 76 00             	lea    0x0(%esi),%esi
801053b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801053c0:	83 ec 0c             	sub    $0xc,%esp
801053c3:	53                   	push   %ebx
801053c4:	e8 57 c5 ff ff       	call   80101920 <iunlockput>
801053c9:	e8 52 d8 ff ff       	call   80102c20 <end_op>
801053ce:	83 c4 10             	add    $0x10,%esp
801053d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053d6:	eb d7                	jmp    801053af <sys_chdir+0x6f>
801053d8:	90                   	nop
801053d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801053e0:	e8 3b d8 ff ff       	call   80102c20 <end_op>
801053e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053ea:	eb c3                	jmp    801053af <sys_chdir+0x6f>
801053ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053f0 <sys_exec>:
801053f0:	55                   	push   %ebp
801053f1:	89 e5                	mov    %esp,%ebp
801053f3:	57                   	push   %edi
801053f4:	56                   	push   %esi
801053f5:	53                   	push   %ebx
801053f6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
801053fc:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80105402:	50                   	push   %eax
80105403:	6a 00                	push   $0x0
80105405:	e8 36 f5 ff ff       	call   80104940 <argstr>
8010540a:	83 c4 10             	add    $0x10,%esp
8010540d:	85 c0                	test   %eax,%eax
8010540f:	0f 88 87 00 00 00    	js     8010549c <sys_exec+0xac>
80105415:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010541b:	83 ec 08             	sub    $0x8,%esp
8010541e:	50                   	push   %eax
8010541f:	6a 01                	push   $0x1
80105421:	e8 6a f4 ff ff       	call   80104890 <argint>
80105426:	83 c4 10             	add    $0x10,%esp
80105429:	85 c0                	test   %eax,%eax
8010542b:	78 6f                	js     8010549c <sys_exec+0xac>
8010542d:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105433:	83 ec 04             	sub    $0x4,%esp
80105436:	31 db                	xor    %ebx,%ebx
80105438:	68 80 00 00 00       	push   $0x80
8010543d:	6a 00                	push   $0x0
8010543f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105445:	50                   	push   %eax
80105446:	e8 45 f1 ff ff       	call   80104590 <memset>
8010544b:	83 c4 10             	add    $0x10,%esp
8010544e:	eb 2c                	jmp    8010547c <sys_exec+0x8c>
80105450:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105456:	85 c0                	test   %eax,%eax
80105458:	74 56                	je     801054b0 <sys_exec+0xc0>
8010545a:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
80105460:	83 ec 08             	sub    $0x8,%esp
80105463:	8d 14 31             	lea    (%ecx,%esi,1),%edx
80105466:	52                   	push   %edx
80105467:	50                   	push   %eax
80105468:	e8 b3 f3 ff ff       	call   80104820 <fetchstr>
8010546d:	83 c4 10             	add    $0x10,%esp
80105470:	85 c0                	test   %eax,%eax
80105472:	78 28                	js     8010549c <sys_exec+0xac>
80105474:	83 c3 01             	add    $0x1,%ebx
80105477:	83 fb 20             	cmp    $0x20,%ebx
8010547a:	74 20                	je     8010549c <sys_exec+0xac>
8010547c:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105482:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
80105489:	83 ec 08             	sub    $0x8,%esp
8010548c:	57                   	push   %edi
8010548d:	01 f0                	add    %esi,%eax
8010548f:	50                   	push   %eax
80105490:	e8 4b f3 ff ff       	call   801047e0 <fetchint>
80105495:	83 c4 10             	add    $0x10,%esp
80105498:	85 c0                	test   %eax,%eax
8010549a:	79 b4                	jns    80105450 <sys_exec+0x60>
8010549c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010549f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054a4:	5b                   	pop    %ebx
801054a5:	5e                   	pop    %esi
801054a6:	5f                   	pop    %edi
801054a7:	5d                   	pop    %ebp
801054a8:	c3                   	ret    
801054a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801054b0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801054b6:	83 ec 08             	sub    $0x8,%esp
801054b9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801054c0:	00 00 00 00 
801054c4:	50                   	push   %eax
801054c5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801054cb:	e8 40 b5 ff ff       	call   80100a10 <exec>
801054d0:	83 c4 10             	add    $0x10,%esp
801054d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801054d6:	5b                   	pop    %ebx
801054d7:	5e                   	pop    %esi
801054d8:	5f                   	pop    %edi
801054d9:	5d                   	pop    %ebp
801054da:	c3                   	ret    
801054db:	90                   	nop
801054dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054e0 <sys_pipe>:
801054e0:	55                   	push   %ebp
801054e1:	89 e5                	mov    %esp,%ebp
801054e3:	57                   	push   %edi
801054e4:	56                   	push   %esi
801054e5:	53                   	push   %ebx
801054e6:	8d 45 dc             	lea    -0x24(%ebp),%eax
801054e9:	83 ec 20             	sub    $0x20,%esp
801054ec:	6a 08                	push   $0x8
801054ee:	50                   	push   %eax
801054ef:	6a 00                	push   $0x0
801054f1:	e8 ea f3 ff ff       	call   801048e0 <argptr>
801054f6:	83 c4 10             	add    $0x10,%esp
801054f9:	85 c0                	test   %eax,%eax
801054fb:	0f 88 ae 00 00 00    	js     801055af <sys_pipe+0xcf>
80105501:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105504:	83 ec 08             	sub    $0x8,%esp
80105507:	50                   	push   %eax
80105508:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010550b:	50                   	push   %eax
8010550c:	e8 3f dd ff ff       	call   80103250 <pipealloc>
80105511:	83 c4 10             	add    $0x10,%esp
80105514:	85 c0                	test   %eax,%eax
80105516:	0f 88 93 00 00 00    	js     801055af <sys_pipe+0xcf>
8010551c:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010551f:	31 db                	xor    %ebx,%ebx
80105521:	e8 ba e2 ff ff       	call   801037e0 <myproc>
80105526:	eb 10                	jmp    80105538 <sys_pipe+0x58>
80105528:	90                   	nop
80105529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105530:	83 c3 01             	add    $0x1,%ebx
80105533:	83 fb 10             	cmp    $0x10,%ebx
80105536:	74 60                	je     80105598 <sys_pipe+0xb8>
80105538:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
8010553c:	85 f6                	test   %esi,%esi
8010553e:	75 f0                	jne    80105530 <sys_pipe+0x50>
80105540:	8d 73 08             	lea    0x8(%ebx),%esi
80105543:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
80105547:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010554a:	e8 91 e2 ff ff       	call   801037e0 <myproc>
8010554f:	31 d2                	xor    %edx,%edx
80105551:	eb 0d                	jmp    80105560 <sys_pipe+0x80>
80105553:	90                   	nop
80105554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105558:	83 c2 01             	add    $0x1,%edx
8010555b:	83 fa 10             	cmp    $0x10,%edx
8010555e:	74 28                	je     80105588 <sys_pipe+0xa8>
80105560:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105564:	85 c9                	test   %ecx,%ecx
80105566:	75 f0                	jne    80105558 <sys_pipe+0x78>
80105568:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
8010556c:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010556f:	89 18                	mov    %ebx,(%eax)
80105571:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105574:	89 50 04             	mov    %edx,0x4(%eax)
80105577:	31 c0                	xor    %eax,%eax
80105579:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010557c:	5b                   	pop    %ebx
8010557d:	5e                   	pop    %esi
8010557e:	5f                   	pop    %edi
8010557f:	5d                   	pop    %ebp
80105580:	c3                   	ret    
80105581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105588:	e8 53 e2 ff ff       	call   801037e0 <myproc>
8010558d:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80105594:	00 
80105595:	8d 76 00             	lea    0x0(%esi),%esi
80105598:	83 ec 0c             	sub    $0xc,%esp
8010559b:	ff 75 e0             	pushl  -0x20(%ebp)
8010559e:	e8 9d b8 ff ff       	call   80100e40 <fileclose>
801055a3:	58                   	pop    %eax
801055a4:	ff 75 e4             	pushl  -0x1c(%ebp)
801055a7:	e8 94 b8 ff ff       	call   80100e40 <fileclose>
801055ac:	83 c4 10             	add    $0x10,%esp
801055af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055b4:	eb c3                	jmp    80105579 <sys_pipe+0x99>
801055b6:	66 90                	xchg   %ax,%ax
801055b8:	66 90                	xchg   %ax,%ax
801055ba:	66 90                	xchg   %ax,%ax
801055bc:	66 90                	xchg   %ax,%ax
801055be:	66 90                	xchg   %ax,%ax

801055c0 <sys_fork>:
801055c0:	55                   	push   %ebp
801055c1:	89 e5                	mov    %esp,%ebp
801055c3:	5d                   	pop    %ebp
801055c4:	e9 b7 e3 ff ff       	jmp    80103980 <fork>
801055c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801055d0 <sys_exit>:
801055d0:	55                   	push   %ebp
801055d1:	89 e5                	mov    %esp,%ebp
801055d3:	83 ec 08             	sub    $0x8,%esp
801055d6:	e8 35 e6 ff ff       	call   80103c10 <exit>
801055db:	31 c0                	xor    %eax,%eax
801055dd:	c9                   	leave  
801055de:	c3                   	ret    
801055df:	90                   	nop

801055e0 <sys_wait>:
801055e0:	55                   	push   %ebp
801055e1:	89 e5                	mov    %esp,%ebp
801055e3:	5d                   	pop    %ebp
801055e4:	e9 67 e8 ff ff       	jmp    80103e50 <wait>
801055e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801055f0 <sys_kill>:
801055f0:	55                   	push   %ebp
801055f1:	89 e5                	mov    %esp,%ebp
801055f3:	83 ec 20             	sub    $0x20,%esp
801055f6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801055f9:	50                   	push   %eax
801055fa:	6a 00                	push   $0x0
801055fc:	e8 8f f2 ff ff       	call   80104890 <argint>
80105601:	83 c4 10             	add    $0x10,%esp
80105604:	85 c0                	test   %eax,%eax
80105606:	78 18                	js     80105620 <sys_kill+0x30>
80105608:	83 ec 0c             	sub    $0xc,%esp
8010560b:	ff 75 f4             	pushl  -0xc(%ebp)
8010560e:	e8 8d e9 ff ff       	call   80103fa0 <kill>
80105613:	83 c4 10             	add    $0x10,%esp
80105616:	c9                   	leave  
80105617:	c3                   	ret    
80105618:	90                   	nop
80105619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105620:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105625:	c9                   	leave  
80105626:	c3                   	ret    
80105627:	89 f6                	mov    %esi,%esi
80105629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105630 <sys_getpid>:
80105630:	55                   	push   %ebp
80105631:	89 e5                	mov    %esp,%ebp
80105633:	83 ec 08             	sub    $0x8,%esp
80105636:	e8 a5 e1 ff ff       	call   801037e0 <myproc>
8010563b:	8b 40 10             	mov    0x10(%eax),%eax
8010563e:	c9                   	leave  
8010563f:	c3                   	ret    

80105640 <sys_sbrk>:
80105640:	55                   	push   %ebp
80105641:	89 e5                	mov    %esp,%ebp
80105643:	53                   	push   %ebx
80105644:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105647:	83 ec 1c             	sub    $0x1c,%esp
8010564a:	50                   	push   %eax
8010564b:	6a 00                	push   $0x0
8010564d:	e8 3e f2 ff ff       	call   80104890 <argint>
80105652:	83 c4 10             	add    $0x10,%esp
80105655:	85 c0                	test   %eax,%eax
80105657:	78 27                	js     80105680 <sys_sbrk+0x40>
80105659:	e8 82 e1 ff ff       	call   801037e0 <myproc>
8010565e:	83 ec 0c             	sub    $0xc,%esp
80105661:	8b 18                	mov    (%eax),%ebx
80105663:	ff 75 f4             	pushl  -0xc(%ebp)
80105666:	e8 95 e2 ff ff       	call   80103900 <growproc>
8010566b:	83 c4 10             	add    $0x10,%esp
8010566e:	85 c0                	test   %eax,%eax
80105670:	78 0e                	js     80105680 <sys_sbrk+0x40>
80105672:	89 d8                	mov    %ebx,%eax
80105674:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105677:	c9                   	leave  
80105678:	c3                   	ret    
80105679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105680:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105685:	eb eb                	jmp    80105672 <sys_sbrk+0x32>
80105687:	89 f6                	mov    %esi,%esi
80105689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105690 <sys_sleep>:
80105690:	55                   	push   %ebp
80105691:	89 e5                	mov    %esp,%ebp
80105693:	53                   	push   %ebx
80105694:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105697:	83 ec 1c             	sub    $0x1c,%esp
8010569a:	50                   	push   %eax
8010569b:	6a 00                	push   $0x0
8010569d:	e8 ee f1 ff ff       	call   80104890 <argint>
801056a2:	83 c4 10             	add    $0x10,%esp
801056a5:	85 c0                	test   %eax,%eax
801056a7:	0f 88 8a 00 00 00    	js     80105737 <sys_sleep+0xa7>
801056ad:	83 ec 0c             	sub    $0xc,%esp
801056b0:	68 60 4c 11 80       	push   $0x80114c60
801056b5:	e8 c6 ed ff ff       	call   80104480 <acquire>
801056ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
801056bd:	83 c4 10             	add    $0x10,%esp
801056c0:	8b 1d a0 54 11 80    	mov    0x801154a0,%ebx
801056c6:	85 d2                	test   %edx,%edx
801056c8:	75 27                	jne    801056f1 <sys_sleep+0x61>
801056ca:	eb 54                	jmp    80105720 <sys_sleep+0x90>
801056cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801056d0:	83 ec 08             	sub    $0x8,%esp
801056d3:	68 60 4c 11 80       	push   $0x80114c60
801056d8:	68 a0 54 11 80       	push   $0x801154a0
801056dd:	e8 ae e6 ff ff       	call   80103d90 <sleep>
801056e2:	a1 a0 54 11 80       	mov    0x801154a0,%eax
801056e7:	83 c4 10             	add    $0x10,%esp
801056ea:	29 d8                	sub    %ebx,%eax
801056ec:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801056ef:	73 2f                	jae    80105720 <sys_sleep+0x90>
801056f1:	e8 ea e0 ff ff       	call   801037e0 <myproc>
801056f6:	8b 40 24             	mov    0x24(%eax),%eax
801056f9:	85 c0                	test   %eax,%eax
801056fb:	74 d3                	je     801056d0 <sys_sleep+0x40>
801056fd:	83 ec 0c             	sub    $0xc,%esp
80105700:	68 60 4c 11 80       	push   $0x80114c60
80105705:	e8 36 ee ff ff       	call   80104540 <release>
8010570a:	83 c4 10             	add    $0x10,%esp
8010570d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105712:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105715:	c9                   	leave  
80105716:	c3                   	ret    
80105717:	89 f6                	mov    %esi,%esi
80105719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105720:	83 ec 0c             	sub    $0xc,%esp
80105723:	68 60 4c 11 80       	push   $0x80114c60
80105728:	e8 13 ee ff ff       	call   80104540 <release>
8010572d:	83 c4 10             	add    $0x10,%esp
80105730:	31 c0                	xor    %eax,%eax
80105732:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105735:	c9                   	leave  
80105736:	c3                   	ret    
80105737:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010573c:	eb f4                	jmp    80105732 <sys_sleep+0xa2>
8010573e:	66 90                	xchg   %ax,%ax

80105740 <sys_uptime>:
80105740:	55                   	push   %ebp
80105741:	89 e5                	mov    %esp,%ebp
80105743:	53                   	push   %ebx
80105744:	83 ec 10             	sub    $0x10,%esp
80105747:	68 60 4c 11 80       	push   $0x80114c60
8010574c:	e8 2f ed ff ff       	call   80104480 <acquire>
80105751:	8b 1d a0 54 11 80    	mov    0x801154a0,%ebx
80105757:	c7 04 24 60 4c 11 80 	movl   $0x80114c60,(%esp)
8010575e:	e8 dd ed ff ff       	call   80104540 <release>
80105763:	89 d8                	mov    %ebx,%eax
80105765:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105768:	c9                   	leave  
80105769:	c3                   	ret    
8010576a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105770 <sys_procdump>:
80105770:	55                   	push   %ebp
80105771:	89 e5                	mov    %esp,%ebp
80105773:	5d                   	pop    %ebp
80105774:	e9 b7 e8 ff ff       	jmp    80104030 <procdump>

80105779 <alltraps>:
80105779:	1e                   	push   %ds
8010577a:	06                   	push   %es
8010577b:	0f a0                	push   %fs
8010577d:	0f a8                	push   %gs
8010577f:	60                   	pusha  
80105780:	66 b8 10 00          	mov    $0x10,%ax
80105784:	8e d8                	mov    %eax,%ds
80105786:	8e c0                	mov    %eax,%es
80105788:	54                   	push   %esp
80105789:	e8 c2 00 00 00       	call   80105850 <trap>
8010578e:	83 c4 04             	add    $0x4,%esp

80105791 <trapret>:
80105791:	61                   	popa   
80105792:	0f a9                	pop    %gs
80105794:	0f a1                	pop    %fs
80105796:	07                   	pop    %es
80105797:	1f                   	pop    %ds
80105798:	83 c4 08             	add    $0x8,%esp
8010579b:	cf                   	iret   
8010579c:	66 90                	xchg   %ax,%ax
8010579e:	66 90                	xchg   %ax,%ax

801057a0 <tvinit>:
801057a0:	55                   	push   %ebp
801057a1:	31 c0                	xor    %eax,%eax
801057a3:	89 e5                	mov    %esp,%ebp
801057a5:	83 ec 08             	sub    $0x8,%esp
801057a8:	90                   	nop
801057a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801057b0:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
801057b7:	c7 04 c5 a2 4c 11 80 	movl   $0x8e000008,-0x7feeb35e(,%eax,8)
801057be:	08 00 00 8e 
801057c2:	66 89 14 c5 a0 4c 11 	mov    %dx,-0x7feeb360(,%eax,8)
801057c9:	80 
801057ca:	c1 ea 10             	shr    $0x10,%edx
801057cd:	66 89 14 c5 a6 4c 11 	mov    %dx,-0x7feeb35a(,%eax,8)
801057d4:	80 
801057d5:	83 c0 01             	add    $0x1,%eax
801057d8:	3d 00 01 00 00       	cmp    $0x100,%eax
801057dd:	75 d1                	jne    801057b0 <tvinit+0x10>
801057df:	a1 08 a1 10 80       	mov    0x8010a108,%eax
801057e4:	83 ec 08             	sub    $0x8,%esp
801057e7:	c7 05 a2 4e 11 80 08 	movl   $0xef000008,0x80114ea2
801057ee:	00 00 ef 
801057f1:	68 fd 78 10 80       	push   $0x801078fd
801057f6:	68 60 4c 11 80       	push   $0x80114c60
801057fb:	66 a3 a0 4e 11 80    	mov    %ax,0x80114ea0
80105801:	c1 e8 10             	shr    $0x10,%eax
80105804:	66 a3 a6 4e 11 80    	mov    %ax,0x80114ea6
8010580a:	e8 31 eb ff ff       	call   80104340 <initlock>
8010580f:	83 c4 10             	add    $0x10,%esp
80105812:	c9                   	leave  
80105813:	c3                   	ret    
80105814:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010581a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105820 <idtinit>:
80105820:	55                   	push   %ebp
80105821:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105826:	89 e5                	mov    %esp,%ebp
80105828:	83 ec 10             	sub    $0x10,%esp
8010582b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
8010582f:	b8 a0 4c 11 80       	mov    $0x80114ca0,%eax
80105834:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
80105838:	c1 e8 10             	shr    $0x10,%eax
8010583b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
8010583f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105842:	0f 01 18             	lidtl  (%eax)
80105845:	c9                   	leave  
80105846:	c3                   	ret    
80105847:	89 f6                	mov    %esi,%esi
80105849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105850 <trap>:
80105850:	55                   	push   %ebp
80105851:	89 e5                	mov    %esp,%ebp
80105853:	57                   	push   %edi
80105854:	56                   	push   %esi
80105855:	53                   	push   %ebx
80105856:	83 ec 1c             	sub    $0x1c,%esp
80105859:	8b 7d 08             	mov    0x8(%ebp),%edi
8010585c:	8b 47 30             	mov    0x30(%edi),%eax
8010585f:	83 f8 40             	cmp    $0x40,%eax
80105862:	0f 84 f0 00 00 00    	je     80105958 <trap+0x108>
80105868:	83 e8 20             	sub    $0x20,%eax
8010586b:	83 f8 1f             	cmp    $0x1f,%eax
8010586e:	77 10                	ja     80105880 <trap+0x30>
80105870:	ff 24 85 a4 79 10 80 	jmp    *-0x7fef865c(,%eax,4)
80105877:	89 f6                	mov    %esi,%esi
80105879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105880:	e8 5b df ff ff       	call   801037e0 <myproc>
80105885:	85 c0                	test   %eax,%eax
80105887:	8b 5f 38             	mov    0x38(%edi),%ebx
8010588a:	0f 84 14 02 00 00    	je     80105aa4 <trap+0x254>
80105890:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105894:	0f 84 0a 02 00 00    	je     80105aa4 <trap+0x254>
8010589a:	0f 20 d1             	mov    %cr2,%ecx
8010589d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
801058a0:	e8 1b df ff ff       	call   801037c0 <cpuid>
801058a5:	89 45 dc             	mov    %eax,-0x24(%ebp)
801058a8:	8b 47 34             	mov    0x34(%edi),%eax
801058ab:	8b 77 30             	mov    0x30(%edi),%esi
801058ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801058b1:	e8 2a df ff ff       	call   801037e0 <myproc>
801058b6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801058b9:	e8 22 df ff ff       	call   801037e0 <myproc>
801058be:	8b 4d d8             	mov    -0x28(%ebp),%ecx
801058c1:	8b 55 dc             	mov    -0x24(%ebp),%edx
801058c4:	51                   	push   %ecx
801058c5:	53                   	push   %ebx
801058c6:	52                   	push   %edx
801058c7:	8b 55 e0             	mov    -0x20(%ebp),%edx
801058ca:	ff 75 e4             	pushl  -0x1c(%ebp)
801058cd:	56                   	push   %esi
801058ce:	83 c2 6c             	add    $0x6c,%edx
801058d1:	52                   	push   %edx
801058d2:	ff 70 10             	pushl  0x10(%eax)
801058d5:	68 60 79 10 80       	push   $0x80107960
801058da:	e8 81 ad ff ff       	call   80100660 <cprintf>
801058df:	83 c4 20             	add    $0x20,%esp
801058e2:	e8 f9 de ff ff       	call   801037e0 <myproc>
801058e7:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
801058ee:	e8 ed de ff ff       	call   801037e0 <myproc>
801058f3:	85 c0                	test   %eax,%eax
801058f5:	74 1d                	je     80105914 <trap+0xc4>
801058f7:	e8 e4 de ff ff       	call   801037e0 <myproc>
801058fc:	8b 50 24             	mov    0x24(%eax),%edx
801058ff:	85 d2                	test   %edx,%edx
80105901:	74 11                	je     80105914 <trap+0xc4>
80105903:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105907:	83 e0 03             	and    $0x3,%eax
8010590a:	66 83 f8 03          	cmp    $0x3,%ax
8010590e:	0f 84 4c 01 00 00    	je     80105a60 <trap+0x210>
80105914:	e8 c7 de ff ff       	call   801037e0 <myproc>
80105919:	85 c0                	test   %eax,%eax
8010591b:	74 0b                	je     80105928 <trap+0xd8>
8010591d:	e8 be de ff ff       	call   801037e0 <myproc>
80105922:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105926:	74 68                	je     80105990 <trap+0x140>
80105928:	e8 b3 de ff ff       	call   801037e0 <myproc>
8010592d:	85 c0                	test   %eax,%eax
8010592f:	74 19                	je     8010594a <trap+0xfa>
80105931:	e8 aa de ff ff       	call   801037e0 <myproc>
80105936:	8b 40 24             	mov    0x24(%eax),%eax
80105939:	85 c0                	test   %eax,%eax
8010593b:	74 0d                	je     8010594a <trap+0xfa>
8010593d:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105941:	83 e0 03             	and    $0x3,%eax
80105944:	66 83 f8 03          	cmp    $0x3,%ax
80105948:	74 37                	je     80105981 <trap+0x131>
8010594a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010594d:	5b                   	pop    %ebx
8010594e:	5e                   	pop    %esi
8010594f:	5f                   	pop    %edi
80105950:	5d                   	pop    %ebp
80105951:	c3                   	ret    
80105952:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105958:	e8 83 de ff ff       	call   801037e0 <myproc>
8010595d:	8b 58 24             	mov    0x24(%eax),%ebx
80105960:	85 db                	test   %ebx,%ebx
80105962:	0f 85 e8 00 00 00    	jne    80105a50 <trap+0x200>
80105968:	e8 73 de ff ff       	call   801037e0 <myproc>
8010596d:	89 78 18             	mov    %edi,0x18(%eax)
80105970:	e8 0b f0 ff ff       	call   80104980 <syscall>
80105975:	e8 66 de ff ff       	call   801037e0 <myproc>
8010597a:	8b 48 24             	mov    0x24(%eax),%ecx
8010597d:	85 c9                	test   %ecx,%ecx
8010597f:	74 c9                	je     8010594a <trap+0xfa>
80105981:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105984:	5b                   	pop    %ebx
80105985:	5e                   	pop    %esi
80105986:	5f                   	pop    %edi
80105987:	5d                   	pop    %ebp
80105988:	e9 83 e2 ff ff       	jmp    80103c10 <exit>
8010598d:	8d 76 00             	lea    0x0(%esi),%esi
80105990:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105994:	75 92                	jne    80105928 <trap+0xd8>
80105996:	e8 a5 e3 ff ff       	call   80103d40 <yield>
8010599b:	eb 8b                	jmp    80105928 <trap+0xd8>
8010599d:	8d 76 00             	lea    0x0(%esi),%esi
801059a0:	e8 1b de ff ff       	call   801037c0 <cpuid>
801059a5:	85 c0                	test   %eax,%eax
801059a7:	0f 84 c3 00 00 00    	je     80105a70 <trap+0x220>
801059ad:	e8 ae cd ff ff       	call   80102760 <lapiceoi>
801059b2:	e8 29 de ff ff       	call   801037e0 <myproc>
801059b7:	85 c0                	test   %eax,%eax
801059b9:	0f 85 38 ff ff ff    	jne    801058f7 <trap+0xa7>
801059bf:	e9 50 ff ff ff       	jmp    80105914 <trap+0xc4>
801059c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801059c8:	e8 53 cc ff ff       	call   80102620 <kbdintr>
801059cd:	e8 8e cd ff ff       	call   80102760 <lapiceoi>
801059d2:	e8 09 de ff ff       	call   801037e0 <myproc>
801059d7:	85 c0                	test   %eax,%eax
801059d9:	0f 85 18 ff ff ff    	jne    801058f7 <trap+0xa7>
801059df:	e9 30 ff ff ff       	jmp    80105914 <trap+0xc4>
801059e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801059e8:	e8 53 02 00 00       	call   80105c40 <uartintr>
801059ed:	e8 6e cd ff ff       	call   80102760 <lapiceoi>
801059f2:	e8 e9 dd ff ff       	call   801037e0 <myproc>
801059f7:	85 c0                	test   %eax,%eax
801059f9:	0f 85 f8 fe ff ff    	jne    801058f7 <trap+0xa7>
801059ff:	e9 10 ff ff ff       	jmp    80105914 <trap+0xc4>
80105a04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105a08:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105a0c:	8b 77 38             	mov    0x38(%edi),%esi
80105a0f:	e8 ac dd ff ff       	call   801037c0 <cpuid>
80105a14:	56                   	push   %esi
80105a15:	53                   	push   %ebx
80105a16:	50                   	push   %eax
80105a17:	68 08 79 10 80       	push   $0x80107908
80105a1c:	e8 3f ac ff ff       	call   80100660 <cprintf>
80105a21:	e8 3a cd ff ff       	call   80102760 <lapiceoi>
80105a26:	83 c4 10             	add    $0x10,%esp
80105a29:	e8 b2 dd ff ff       	call   801037e0 <myproc>
80105a2e:	85 c0                	test   %eax,%eax
80105a30:	0f 85 c1 fe ff ff    	jne    801058f7 <trap+0xa7>
80105a36:	e9 d9 fe ff ff       	jmp    80105914 <trap+0xc4>
80105a3b:	90                   	nop
80105a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105a40:	e8 4b c6 ff ff       	call   80102090 <ideintr>
80105a45:	e9 63 ff ff ff       	jmp    801059ad <trap+0x15d>
80105a4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105a50:	e8 bb e1 ff ff       	call   80103c10 <exit>
80105a55:	e9 0e ff ff ff       	jmp    80105968 <trap+0x118>
80105a5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105a60:	e8 ab e1 ff ff       	call   80103c10 <exit>
80105a65:	e9 aa fe ff ff       	jmp    80105914 <trap+0xc4>
80105a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105a70:	83 ec 0c             	sub    $0xc,%esp
80105a73:	68 60 4c 11 80       	push   $0x80114c60
80105a78:	e8 03 ea ff ff       	call   80104480 <acquire>
80105a7d:	c7 04 24 a0 54 11 80 	movl   $0x801154a0,(%esp)
80105a84:	83 05 a0 54 11 80 01 	addl   $0x1,0x801154a0
80105a8b:	e8 b0 e4 ff ff       	call   80103f40 <wakeup>
80105a90:	c7 04 24 60 4c 11 80 	movl   $0x80114c60,(%esp)
80105a97:	e8 a4 ea ff ff       	call   80104540 <release>
80105a9c:	83 c4 10             	add    $0x10,%esp
80105a9f:	e9 09 ff ff ff       	jmp    801059ad <trap+0x15d>
80105aa4:	0f 20 d6             	mov    %cr2,%esi
80105aa7:	e8 14 dd ff ff       	call   801037c0 <cpuid>
80105aac:	83 ec 0c             	sub    $0xc,%esp
80105aaf:	56                   	push   %esi
80105ab0:	53                   	push   %ebx
80105ab1:	50                   	push   %eax
80105ab2:	ff 77 30             	pushl  0x30(%edi)
80105ab5:	68 2c 79 10 80       	push   $0x8010792c
80105aba:	e8 a1 ab ff ff       	call   80100660 <cprintf>
80105abf:	83 c4 14             	add    $0x14,%esp
80105ac2:	68 02 79 10 80       	push   $0x80107902
80105ac7:	e8 c4 a8 ff ff       	call   80100390 <panic>
80105acc:	66 90                	xchg   %ax,%ax
80105ace:	66 90                	xchg   %ax,%ax

80105ad0 <uartgetc>:
80105ad0:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
80105ad5:	55                   	push   %ebp
80105ad6:	89 e5                	mov    %esp,%ebp
80105ad8:	85 c0                	test   %eax,%eax
80105ada:	74 1c                	je     80105af8 <uartgetc+0x28>
80105adc:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105ae1:	ec                   	in     (%dx),%al
80105ae2:	a8 01                	test   $0x1,%al
80105ae4:	74 12                	je     80105af8 <uartgetc+0x28>
80105ae6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105aeb:	ec                   	in     (%dx),%al
80105aec:	0f b6 c0             	movzbl %al,%eax
80105aef:	5d                   	pop    %ebp
80105af0:	c3                   	ret    
80105af1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105af8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105afd:	5d                   	pop    %ebp
80105afe:	c3                   	ret    
80105aff:	90                   	nop

80105b00 <uartputc.part.0>:
80105b00:	55                   	push   %ebp
80105b01:	89 e5                	mov    %esp,%ebp
80105b03:	57                   	push   %edi
80105b04:	56                   	push   %esi
80105b05:	53                   	push   %ebx
80105b06:	89 c7                	mov    %eax,%edi
80105b08:	bb 80 00 00 00       	mov    $0x80,%ebx
80105b0d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105b12:	83 ec 0c             	sub    $0xc,%esp
80105b15:	eb 1b                	jmp    80105b32 <uartputc.part.0+0x32>
80105b17:	89 f6                	mov    %esi,%esi
80105b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105b20:	83 ec 0c             	sub    $0xc,%esp
80105b23:	6a 0a                	push   $0xa
80105b25:	e8 56 cc ff ff       	call   80102780 <microdelay>
80105b2a:	83 c4 10             	add    $0x10,%esp
80105b2d:	83 eb 01             	sub    $0x1,%ebx
80105b30:	74 07                	je     80105b39 <uartputc.part.0+0x39>
80105b32:	89 f2                	mov    %esi,%edx
80105b34:	ec                   	in     (%dx),%al
80105b35:	a8 20                	test   $0x20,%al
80105b37:	74 e7                	je     80105b20 <uartputc.part.0+0x20>
80105b39:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b3e:	89 f8                	mov    %edi,%eax
80105b40:	ee                   	out    %al,(%dx)
80105b41:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b44:	5b                   	pop    %ebx
80105b45:	5e                   	pop    %esi
80105b46:	5f                   	pop    %edi
80105b47:	5d                   	pop    %ebp
80105b48:	c3                   	ret    
80105b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105b50 <uartinit>:
80105b50:	55                   	push   %ebp
80105b51:	31 c9                	xor    %ecx,%ecx
80105b53:	89 c8                	mov    %ecx,%eax
80105b55:	89 e5                	mov    %esp,%ebp
80105b57:	57                   	push   %edi
80105b58:	56                   	push   %esi
80105b59:	53                   	push   %ebx
80105b5a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105b5f:	89 da                	mov    %ebx,%edx
80105b61:	83 ec 0c             	sub    $0xc,%esp
80105b64:	ee                   	out    %al,(%dx)
80105b65:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105b6a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105b6f:	89 fa                	mov    %edi,%edx
80105b71:	ee                   	out    %al,(%dx)
80105b72:	b8 0c 00 00 00       	mov    $0xc,%eax
80105b77:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b7c:	ee                   	out    %al,(%dx)
80105b7d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105b82:	89 c8                	mov    %ecx,%eax
80105b84:	89 f2                	mov    %esi,%edx
80105b86:	ee                   	out    %al,(%dx)
80105b87:	b8 03 00 00 00       	mov    $0x3,%eax
80105b8c:	89 fa                	mov    %edi,%edx
80105b8e:	ee                   	out    %al,(%dx)
80105b8f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105b94:	89 c8                	mov    %ecx,%eax
80105b96:	ee                   	out    %al,(%dx)
80105b97:	b8 01 00 00 00       	mov    $0x1,%eax
80105b9c:	89 f2                	mov    %esi,%edx
80105b9e:	ee                   	out    %al,(%dx)
80105b9f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105ba4:	ec                   	in     (%dx),%al
80105ba5:	3c ff                	cmp    $0xff,%al
80105ba7:	74 5a                	je     80105c03 <uartinit+0xb3>
80105ba9:	c7 05 bc a5 10 80 01 	movl   $0x1,0x8010a5bc
80105bb0:	00 00 00 
80105bb3:	89 da                	mov    %ebx,%edx
80105bb5:	ec                   	in     (%dx),%al
80105bb6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105bbb:	ec                   	in     (%dx),%al
80105bbc:	83 ec 08             	sub    $0x8,%esp
80105bbf:	bb 24 7a 10 80       	mov    $0x80107a24,%ebx
80105bc4:	6a 00                	push   $0x0
80105bc6:	6a 04                	push   $0x4
80105bc8:	e8 13 c7 ff ff       	call   801022e0 <ioapicenable>
80105bcd:	83 c4 10             	add    $0x10,%esp
80105bd0:	b8 78 00 00 00       	mov    $0x78,%eax
80105bd5:	eb 13                	jmp    80105bea <uartinit+0x9a>
80105bd7:	89 f6                	mov    %esi,%esi
80105bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105be0:	83 c3 01             	add    $0x1,%ebx
80105be3:	0f be 03             	movsbl (%ebx),%eax
80105be6:	84 c0                	test   %al,%al
80105be8:	74 19                	je     80105c03 <uartinit+0xb3>
80105bea:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105bf0:	85 d2                	test   %edx,%edx
80105bf2:	74 ec                	je     80105be0 <uartinit+0x90>
80105bf4:	83 c3 01             	add    $0x1,%ebx
80105bf7:	e8 04 ff ff ff       	call   80105b00 <uartputc.part.0>
80105bfc:	0f be 03             	movsbl (%ebx),%eax
80105bff:	84 c0                	test   %al,%al
80105c01:	75 e7                	jne    80105bea <uartinit+0x9a>
80105c03:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c06:	5b                   	pop    %ebx
80105c07:	5e                   	pop    %esi
80105c08:	5f                   	pop    %edi
80105c09:	5d                   	pop    %ebp
80105c0a:	c3                   	ret    
80105c0b:	90                   	nop
80105c0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105c10 <uartputc>:
80105c10:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105c16:	55                   	push   %ebp
80105c17:	89 e5                	mov    %esp,%ebp
80105c19:	85 d2                	test   %edx,%edx
80105c1b:	8b 45 08             	mov    0x8(%ebp),%eax
80105c1e:	74 10                	je     80105c30 <uartputc+0x20>
80105c20:	5d                   	pop    %ebp
80105c21:	e9 da fe ff ff       	jmp    80105b00 <uartputc.part.0>
80105c26:	8d 76 00             	lea    0x0(%esi),%esi
80105c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105c30:	5d                   	pop    %ebp
80105c31:	c3                   	ret    
80105c32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105c40 <uartintr>:
80105c40:	55                   	push   %ebp
80105c41:	89 e5                	mov    %esp,%ebp
80105c43:	83 ec 14             	sub    $0x14,%esp
80105c46:	68 d0 5a 10 80       	push   $0x80105ad0
80105c4b:	e8 c0 ab ff ff       	call   80100810 <consoleintr>
80105c50:	83 c4 10             	add    $0x10,%esp
80105c53:	c9                   	leave  
80105c54:	c3                   	ret    

80105c55 <vector0>:
80105c55:	6a 00                	push   $0x0
80105c57:	6a 00                	push   $0x0
80105c59:	e9 1b fb ff ff       	jmp    80105779 <alltraps>

80105c5e <vector1>:
80105c5e:	6a 00                	push   $0x0
80105c60:	6a 01                	push   $0x1
80105c62:	e9 12 fb ff ff       	jmp    80105779 <alltraps>

80105c67 <vector2>:
80105c67:	6a 00                	push   $0x0
80105c69:	6a 02                	push   $0x2
80105c6b:	e9 09 fb ff ff       	jmp    80105779 <alltraps>

80105c70 <vector3>:
80105c70:	6a 00                	push   $0x0
80105c72:	6a 03                	push   $0x3
80105c74:	e9 00 fb ff ff       	jmp    80105779 <alltraps>

80105c79 <vector4>:
80105c79:	6a 00                	push   $0x0
80105c7b:	6a 04                	push   $0x4
80105c7d:	e9 f7 fa ff ff       	jmp    80105779 <alltraps>

80105c82 <vector5>:
80105c82:	6a 00                	push   $0x0
80105c84:	6a 05                	push   $0x5
80105c86:	e9 ee fa ff ff       	jmp    80105779 <alltraps>

80105c8b <vector6>:
80105c8b:	6a 00                	push   $0x0
80105c8d:	6a 06                	push   $0x6
80105c8f:	e9 e5 fa ff ff       	jmp    80105779 <alltraps>

80105c94 <vector7>:
80105c94:	6a 00                	push   $0x0
80105c96:	6a 07                	push   $0x7
80105c98:	e9 dc fa ff ff       	jmp    80105779 <alltraps>

80105c9d <vector8>:
80105c9d:	6a 08                	push   $0x8
80105c9f:	e9 d5 fa ff ff       	jmp    80105779 <alltraps>

80105ca4 <vector9>:
80105ca4:	6a 00                	push   $0x0
80105ca6:	6a 09                	push   $0x9
80105ca8:	e9 cc fa ff ff       	jmp    80105779 <alltraps>

80105cad <vector10>:
80105cad:	6a 0a                	push   $0xa
80105caf:	e9 c5 fa ff ff       	jmp    80105779 <alltraps>

80105cb4 <vector11>:
80105cb4:	6a 0b                	push   $0xb
80105cb6:	e9 be fa ff ff       	jmp    80105779 <alltraps>

80105cbb <vector12>:
80105cbb:	6a 0c                	push   $0xc
80105cbd:	e9 b7 fa ff ff       	jmp    80105779 <alltraps>

80105cc2 <vector13>:
80105cc2:	6a 0d                	push   $0xd
80105cc4:	e9 b0 fa ff ff       	jmp    80105779 <alltraps>

80105cc9 <vector14>:
80105cc9:	6a 0e                	push   $0xe
80105ccb:	e9 a9 fa ff ff       	jmp    80105779 <alltraps>

80105cd0 <vector15>:
80105cd0:	6a 00                	push   $0x0
80105cd2:	6a 0f                	push   $0xf
80105cd4:	e9 a0 fa ff ff       	jmp    80105779 <alltraps>

80105cd9 <vector16>:
80105cd9:	6a 00                	push   $0x0
80105cdb:	6a 10                	push   $0x10
80105cdd:	e9 97 fa ff ff       	jmp    80105779 <alltraps>

80105ce2 <vector17>:
80105ce2:	6a 11                	push   $0x11
80105ce4:	e9 90 fa ff ff       	jmp    80105779 <alltraps>

80105ce9 <vector18>:
80105ce9:	6a 00                	push   $0x0
80105ceb:	6a 12                	push   $0x12
80105ced:	e9 87 fa ff ff       	jmp    80105779 <alltraps>

80105cf2 <vector19>:
80105cf2:	6a 00                	push   $0x0
80105cf4:	6a 13                	push   $0x13
80105cf6:	e9 7e fa ff ff       	jmp    80105779 <alltraps>

80105cfb <vector20>:
80105cfb:	6a 00                	push   $0x0
80105cfd:	6a 14                	push   $0x14
80105cff:	e9 75 fa ff ff       	jmp    80105779 <alltraps>

80105d04 <vector21>:
80105d04:	6a 00                	push   $0x0
80105d06:	6a 15                	push   $0x15
80105d08:	e9 6c fa ff ff       	jmp    80105779 <alltraps>

80105d0d <vector22>:
80105d0d:	6a 00                	push   $0x0
80105d0f:	6a 16                	push   $0x16
80105d11:	e9 63 fa ff ff       	jmp    80105779 <alltraps>

80105d16 <vector23>:
80105d16:	6a 00                	push   $0x0
80105d18:	6a 17                	push   $0x17
80105d1a:	e9 5a fa ff ff       	jmp    80105779 <alltraps>

80105d1f <vector24>:
80105d1f:	6a 00                	push   $0x0
80105d21:	6a 18                	push   $0x18
80105d23:	e9 51 fa ff ff       	jmp    80105779 <alltraps>

80105d28 <vector25>:
80105d28:	6a 00                	push   $0x0
80105d2a:	6a 19                	push   $0x19
80105d2c:	e9 48 fa ff ff       	jmp    80105779 <alltraps>

80105d31 <vector26>:
80105d31:	6a 00                	push   $0x0
80105d33:	6a 1a                	push   $0x1a
80105d35:	e9 3f fa ff ff       	jmp    80105779 <alltraps>

80105d3a <vector27>:
80105d3a:	6a 00                	push   $0x0
80105d3c:	6a 1b                	push   $0x1b
80105d3e:	e9 36 fa ff ff       	jmp    80105779 <alltraps>

80105d43 <vector28>:
80105d43:	6a 00                	push   $0x0
80105d45:	6a 1c                	push   $0x1c
80105d47:	e9 2d fa ff ff       	jmp    80105779 <alltraps>

80105d4c <vector29>:
80105d4c:	6a 00                	push   $0x0
80105d4e:	6a 1d                	push   $0x1d
80105d50:	e9 24 fa ff ff       	jmp    80105779 <alltraps>

80105d55 <vector30>:
80105d55:	6a 00                	push   $0x0
80105d57:	6a 1e                	push   $0x1e
80105d59:	e9 1b fa ff ff       	jmp    80105779 <alltraps>

80105d5e <vector31>:
80105d5e:	6a 00                	push   $0x0
80105d60:	6a 1f                	push   $0x1f
80105d62:	e9 12 fa ff ff       	jmp    80105779 <alltraps>

80105d67 <vector32>:
80105d67:	6a 00                	push   $0x0
80105d69:	6a 20                	push   $0x20
80105d6b:	e9 09 fa ff ff       	jmp    80105779 <alltraps>

80105d70 <vector33>:
80105d70:	6a 00                	push   $0x0
80105d72:	6a 21                	push   $0x21
80105d74:	e9 00 fa ff ff       	jmp    80105779 <alltraps>

80105d79 <vector34>:
80105d79:	6a 00                	push   $0x0
80105d7b:	6a 22                	push   $0x22
80105d7d:	e9 f7 f9 ff ff       	jmp    80105779 <alltraps>

80105d82 <vector35>:
80105d82:	6a 00                	push   $0x0
80105d84:	6a 23                	push   $0x23
80105d86:	e9 ee f9 ff ff       	jmp    80105779 <alltraps>

80105d8b <vector36>:
80105d8b:	6a 00                	push   $0x0
80105d8d:	6a 24                	push   $0x24
80105d8f:	e9 e5 f9 ff ff       	jmp    80105779 <alltraps>

80105d94 <vector37>:
80105d94:	6a 00                	push   $0x0
80105d96:	6a 25                	push   $0x25
80105d98:	e9 dc f9 ff ff       	jmp    80105779 <alltraps>

80105d9d <vector38>:
80105d9d:	6a 00                	push   $0x0
80105d9f:	6a 26                	push   $0x26
80105da1:	e9 d3 f9 ff ff       	jmp    80105779 <alltraps>

80105da6 <vector39>:
80105da6:	6a 00                	push   $0x0
80105da8:	6a 27                	push   $0x27
80105daa:	e9 ca f9 ff ff       	jmp    80105779 <alltraps>

80105daf <vector40>:
80105daf:	6a 00                	push   $0x0
80105db1:	6a 28                	push   $0x28
80105db3:	e9 c1 f9 ff ff       	jmp    80105779 <alltraps>

80105db8 <vector41>:
80105db8:	6a 00                	push   $0x0
80105dba:	6a 29                	push   $0x29
80105dbc:	e9 b8 f9 ff ff       	jmp    80105779 <alltraps>

80105dc1 <vector42>:
80105dc1:	6a 00                	push   $0x0
80105dc3:	6a 2a                	push   $0x2a
80105dc5:	e9 af f9 ff ff       	jmp    80105779 <alltraps>

80105dca <vector43>:
80105dca:	6a 00                	push   $0x0
80105dcc:	6a 2b                	push   $0x2b
80105dce:	e9 a6 f9 ff ff       	jmp    80105779 <alltraps>

80105dd3 <vector44>:
80105dd3:	6a 00                	push   $0x0
80105dd5:	6a 2c                	push   $0x2c
80105dd7:	e9 9d f9 ff ff       	jmp    80105779 <alltraps>

80105ddc <vector45>:
80105ddc:	6a 00                	push   $0x0
80105dde:	6a 2d                	push   $0x2d
80105de0:	e9 94 f9 ff ff       	jmp    80105779 <alltraps>

80105de5 <vector46>:
80105de5:	6a 00                	push   $0x0
80105de7:	6a 2e                	push   $0x2e
80105de9:	e9 8b f9 ff ff       	jmp    80105779 <alltraps>

80105dee <vector47>:
80105dee:	6a 00                	push   $0x0
80105df0:	6a 2f                	push   $0x2f
80105df2:	e9 82 f9 ff ff       	jmp    80105779 <alltraps>

80105df7 <vector48>:
80105df7:	6a 00                	push   $0x0
80105df9:	6a 30                	push   $0x30
80105dfb:	e9 79 f9 ff ff       	jmp    80105779 <alltraps>

80105e00 <vector49>:
80105e00:	6a 00                	push   $0x0
80105e02:	6a 31                	push   $0x31
80105e04:	e9 70 f9 ff ff       	jmp    80105779 <alltraps>

80105e09 <vector50>:
80105e09:	6a 00                	push   $0x0
80105e0b:	6a 32                	push   $0x32
80105e0d:	e9 67 f9 ff ff       	jmp    80105779 <alltraps>

80105e12 <vector51>:
80105e12:	6a 00                	push   $0x0
80105e14:	6a 33                	push   $0x33
80105e16:	e9 5e f9 ff ff       	jmp    80105779 <alltraps>

80105e1b <vector52>:
80105e1b:	6a 00                	push   $0x0
80105e1d:	6a 34                	push   $0x34
80105e1f:	e9 55 f9 ff ff       	jmp    80105779 <alltraps>

80105e24 <vector53>:
80105e24:	6a 00                	push   $0x0
80105e26:	6a 35                	push   $0x35
80105e28:	e9 4c f9 ff ff       	jmp    80105779 <alltraps>

80105e2d <vector54>:
80105e2d:	6a 00                	push   $0x0
80105e2f:	6a 36                	push   $0x36
80105e31:	e9 43 f9 ff ff       	jmp    80105779 <alltraps>

80105e36 <vector55>:
80105e36:	6a 00                	push   $0x0
80105e38:	6a 37                	push   $0x37
80105e3a:	e9 3a f9 ff ff       	jmp    80105779 <alltraps>

80105e3f <vector56>:
80105e3f:	6a 00                	push   $0x0
80105e41:	6a 38                	push   $0x38
80105e43:	e9 31 f9 ff ff       	jmp    80105779 <alltraps>

80105e48 <vector57>:
80105e48:	6a 00                	push   $0x0
80105e4a:	6a 39                	push   $0x39
80105e4c:	e9 28 f9 ff ff       	jmp    80105779 <alltraps>

80105e51 <vector58>:
80105e51:	6a 00                	push   $0x0
80105e53:	6a 3a                	push   $0x3a
80105e55:	e9 1f f9 ff ff       	jmp    80105779 <alltraps>

80105e5a <vector59>:
80105e5a:	6a 00                	push   $0x0
80105e5c:	6a 3b                	push   $0x3b
80105e5e:	e9 16 f9 ff ff       	jmp    80105779 <alltraps>

80105e63 <vector60>:
80105e63:	6a 00                	push   $0x0
80105e65:	6a 3c                	push   $0x3c
80105e67:	e9 0d f9 ff ff       	jmp    80105779 <alltraps>

80105e6c <vector61>:
80105e6c:	6a 00                	push   $0x0
80105e6e:	6a 3d                	push   $0x3d
80105e70:	e9 04 f9 ff ff       	jmp    80105779 <alltraps>

80105e75 <vector62>:
80105e75:	6a 00                	push   $0x0
80105e77:	6a 3e                	push   $0x3e
80105e79:	e9 fb f8 ff ff       	jmp    80105779 <alltraps>

80105e7e <vector63>:
80105e7e:	6a 00                	push   $0x0
80105e80:	6a 3f                	push   $0x3f
80105e82:	e9 f2 f8 ff ff       	jmp    80105779 <alltraps>

80105e87 <vector64>:
80105e87:	6a 00                	push   $0x0
80105e89:	6a 40                	push   $0x40
80105e8b:	e9 e9 f8 ff ff       	jmp    80105779 <alltraps>

80105e90 <vector65>:
80105e90:	6a 00                	push   $0x0
80105e92:	6a 41                	push   $0x41
80105e94:	e9 e0 f8 ff ff       	jmp    80105779 <alltraps>

80105e99 <vector66>:
80105e99:	6a 00                	push   $0x0
80105e9b:	6a 42                	push   $0x42
80105e9d:	e9 d7 f8 ff ff       	jmp    80105779 <alltraps>

80105ea2 <vector67>:
80105ea2:	6a 00                	push   $0x0
80105ea4:	6a 43                	push   $0x43
80105ea6:	e9 ce f8 ff ff       	jmp    80105779 <alltraps>

80105eab <vector68>:
80105eab:	6a 00                	push   $0x0
80105ead:	6a 44                	push   $0x44
80105eaf:	e9 c5 f8 ff ff       	jmp    80105779 <alltraps>

80105eb4 <vector69>:
80105eb4:	6a 00                	push   $0x0
80105eb6:	6a 45                	push   $0x45
80105eb8:	e9 bc f8 ff ff       	jmp    80105779 <alltraps>

80105ebd <vector70>:
80105ebd:	6a 00                	push   $0x0
80105ebf:	6a 46                	push   $0x46
80105ec1:	e9 b3 f8 ff ff       	jmp    80105779 <alltraps>

80105ec6 <vector71>:
80105ec6:	6a 00                	push   $0x0
80105ec8:	6a 47                	push   $0x47
80105eca:	e9 aa f8 ff ff       	jmp    80105779 <alltraps>

80105ecf <vector72>:
80105ecf:	6a 00                	push   $0x0
80105ed1:	6a 48                	push   $0x48
80105ed3:	e9 a1 f8 ff ff       	jmp    80105779 <alltraps>

80105ed8 <vector73>:
80105ed8:	6a 00                	push   $0x0
80105eda:	6a 49                	push   $0x49
80105edc:	e9 98 f8 ff ff       	jmp    80105779 <alltraps>

80105ee1 <vector74>:
80105ee1:	6a 00                	push   $0x0
80105ee3:	6a 4a                	push   $0x4a
80105ee5:	e9 8f f8 ff ff       	jmp    80105779 <alltraps>

80105eea <vector75>:
80105eea:	6a 00                	push   $0x0
80105eec:	6a 4b                	push   $0x4b
80105eee:	e9 86 f8 ff ff       	jmp    80105779 <alltraps>

80105ef3 <vector76>:
80105ef3:	6a 00                	push   $0x0
80105ef5:	6a 4c                	push   $0x4c
80105ef7:	e9 7d f8 ff ff       	jmp    80105779 <alltraps>

80105efc <vector77>:
80105efc:	6a 00                	push   $0x0
80105efe:	6a 4d                	push   $0x4d
80105f00:	e9 74 f8 ff ff       	jmp    80105779 <alltraps>

80105f05 <vector78>:
80105f05:	6a 00                	push   $0x0
80105f07:	6a 4e                	push   $0x4e
80105f09:	e9 6b f8 ff ff       	jmp    80105779 <alltraps>

80105f0e <vector79>:
80105f0e:	6a 00                	push   $0x0
80105f10:	6a 4f                	push   $0x4f
80105f12:	e9 62 f8 ff ff       	jmp    80105779 <alltraps>

80105f17 <vector80>:
80105f17:	6a 00                	push   $0x0
80105f19:	6a 50                	push   $0x50
80105f1b:	e9 59 f8 ff ff       	jmp    80105779 <alltraps>

80105f20 <vector81>:
80105f20:	6a 00                	push   $0x0
80105f22:	6a 51                	push   $0x51
80105f24:	e9 50 f8 ff ff       	jmp    80105779 <alltraps>

80105f29 <vector82>:
80105f29:	6a 00                	push   $0x0
80105f2b:	6a 52                	push   $0x52
80105f2d:	e9 47 f8 ff ff       	jmp    80105779 <alltraps>

80105f32 <vector83>:
80105f32:	6a 00                	push   $0x0
80105f34:	6a 53                	push   $0x53
80105f36:	e9 3e f8 ff ff       	jmp    80105779 <alltraps>

80105f3b <vector84>:
80105f3b:	6a 00                	push   $0x0
80105f3d:	6a 54                	push   $0x54
80105f3f:	e9 35 f8 ff ff       	jmp    80105779 <alltraps>

80105f44 <vector85>:
80105f44:	6a 00                	push   $0x0
80105f46:	6a 55                	push   $0x55
80105f48:	e9 2c f8 ff ff       	jmp    80105779 <alltraps>

80105f4d <vector86>:
80105f4d:	6a 00                	push   $0x0
80105f4f:	6a 56                	push   $0x56
80105f51:	e9 23 f8 ff ff       	jmp    80105779 <alltraps>

80105f56 <vector87>:
80105f56:	6a 00                	push   $0x0
80105f58:	6a 57                	push   $0x57
80105f5a:	e9 1a f8 ff ff       	jmp    80105779 <alltraps>

80105f5f <vector88>:
80105f5f:	6a 00                	push   $0x0
80105f61:	6a 58                	push   $0x58
80105f63:	e9 11 f8 ff ff       	jmp    80105779 <alltraps>

80105f68 <vector89>:
80105f68:	6a 00                	push   $0x0
80105f6a:	6a 59                	push   $0x59
80105f6c:	e9 08 f8 ff ff       	jmp    80105779 <alltraps>

80105f71 <vector90>:
80105f71:	6a 00                	push   $0x0
80105f73:	6a 5a                	push   $0x5a
80105f75:	e9 ff f7 ff ff       	jmp    80105779 <alltraps>

80105f7a <vector91>:
80105f7a:	6a 00                	push   $0x0
80105f7c:	6a 5b                	push   $0x5b
80105f7e:	e9 f6 f7 ff ff       	jmp    80105779 <alltraps>

80105f83 <vector92>:
80105f83:	6a 00                	push   $0x0
80105f85:	6a 5c                	push   $0x5c
80105f87:	e9 ed f7 ff ff       	jmp    80105779 <alltraps>

80105f8c <vector93>:
80105f8c:	6a 00                	push   $0x0
80105f8e:	6a 5d                	push   $0x5d
80105f90:	e9 e4 f7 ff ff       	jmp    80105779 <alltraps>

80105f95 <vector94>:
80105f95:	6a 00                	push   $0x0
80105f97:	6a 5e                	push   $0x5e
80105f99:	e9 db f7 ff ff       	jmp    80105779 <alltraps>

80105f9e <vector95>:
80105f9e:	6a 00                	push   $0x0
80105fa0:	6a 5f                	push   $0x5f
80105fa2:	e9 d2 f7 ff ff       	jmp    80105779 <alltraps>

80105fa7 <vector96>:
80105fa7:	6a 00                	push   $0x0
80105fa9:	6a 60                	push   $0x60
80105fab:	e9 c9 f7 ff ff       	jmp    80105779 <alltraps>

80105fb0 <vector97>:
80105fb0:	6a 00                	push   $0x0
80105fb2:	6a 61                	push   $0x61
80105fb4:	e9 c0 f7 ff ff       	jmp    80105779 <alltraps>

80105fb9 <vector98>:
80105fb9:	6a 00                	push   $0x0
80105fbb:	6a 62                	push   $0x62
80105fbd:	e9 b7 f7 ff ff       	jmp    80105779 <alltraps>

80105fc2 <vector99>:
80105fc2:	6a 00                	push   $0x0
80105fc4:	6a 63                	push   $0x63
80105fc6:	e9 ae f7 ff ff       	jmp    80105779 <alltraps>

80105fcb <vector100>:
80105fcb:	6a 00                	push   $0x0
80105fcd:	6a 64                	push   $0x64
80105fcf:	e9 a5 f7 ff ff       	jmp    80105779 <alltraps>

80105fd4 <vector101>:
80105fd4:	6a 00                	push   $0x0
80105fd6:	6a 65                	push   $0x65
80105fd8:	e9 9c f7 ff ff       	jmp    80105779 <alltraps>

80105fdd <vector102>:
80105fdd:	6a 00                	push   $0x0
80105fdf:	6a 66                	push   $0x66
80105fe1:	e9 93 f7 ff ff       	jmp    80105779 <alltraps>

80105fe6 <vector103>:
80105fe6:	6a 00                	push   $0x0
80105fe8:	6a 67                	push   $0x67
80105fea:	e9 8a f7 ff ff       	jmp    80105779 <alltraps>

80105fef <vector104>:
80105fef:	6a 00                	push   $0x0
80105ff1:	6a 68                	push   $0x68
80105ff3:	e9 81 f7 ff ff       	jmp    80105779 <alltraps>

80105ff8 <vector105>:
80105ff8:	6a 00                	push   $0x0
80105ffa:	6a 69                	push   $0x69
80105ffc:	e9 78 f7 ff ff       	jmp    80105779 <alltraps>

80106001 <vector106>:
80106001:	6a 00                	push   $0x0
80106003:	6a 6a                	push   $0x6a
80106005:	e9 6f f7 ff ff       	jmp    80105779 <alltraps>

8010600a <vector107>:
8010600a:	6a 00                	push   $0x0
8010600c:	6a 6b                	push   $0x6b
8010600e:	e9 66 f7 ff ff       	jmp    80105779 <alltraps>

80106013 <vector108>:
80106013:	6a 00                	push   $0x0
80106015:	6a 6c                	push   $0x6c
80106017:	e9 5d f7 ff ff       	jmp    80105779 <alltraps>

8010601c <vector109>:
8010601c:	6a 00                	push   $0x0
8010601e:	6a 6d                	push   $0x6d
80106020:	e9 54 f7 ff ff       	jmp    80105779 <alltraps>

80106025 <vector110>:
80106025:	6a 00                	push   $0x0
80106027:	6a 6e                	push   $0x6e
80106029:	e9 4b f7 ff ff       	jmp    80105779 <alltraps>

8010602e <vector111>:
8010602e:	6a 00                	push   $0x0
80106030:	6a 6f                	push   $0x6f
80106032:	e9 42 f7 ff ff       	jmp    80105779 <alltraps>

80106037 <vector112>:
80106037:	6a 00                	push   $0x0
80106039:	6a 70                	push   $0x70
8010603b:	e9 39 f7 ff ff       	jmp    80105779 <alltraps>

80106040 <vector113>:
80106040:	6a 00                	push   $0x0
80106042:	6a 71                	push   $0x71
80106044:	e9 30 f7 ff ff       	jmp    80105779 <alltraps>

80106049 <vector114>:
80106049:	6a 00                	push   $0x0
8010604b:	6a 72                	push   $0x72
8010604d:	e9 27 f7 ff ff       	jmp    80105779 <alltraps>

80106052 <vector115>:
80106052:	6a 00                	push   $0x0
80106054:	6a 73                	push   $0x73
80106056:	e9 1e f7 ff ff       	jmp    80105779 <alltraps>

8010605b <vector116>:
8010605b:	6a 00                	push   $0x0
8010605d:	6a 74                	push   $0x74
8010605f:	e9 15 f7 ff ff       	jmp    80105779 <alltraps>

80106064 <vector117>:
80106064:	6a 00                	push   $0x0
80106066:	6a 75                	push   $0x75
80106068:	e9 0c f7 ff ff       	jmp    80105779 <alltraps>

8010606d <vector118>:
8010606d:	6a 00                	push   $0x0
8010606f:	6a 76                	push   $0x76
80106071:	e9 03 f7 ff ff       	jmp    80105779 <alltraps>

80106076 <vector119>:
80106076:	6a 00                	push   $0x0
80106078:	6a 77                	push   $0x77
8010607a:	e9 fa f6 ff ff       	jmp    80105779 <alltraps>

8010607f <vector120>:
8010607f:	6a 00                	push   $0x0
80106081:	6a 78                	push   $0x78
80106083:	e9 f1 f6 ff ff       	jmp    80105779 <alltraps>

80106088 <vector121>:
80106088:	6a 00                	push   $0x0
8010608a:	6a 79                	push   $0x79
8010608c:	e9 e8 f6 ff ff       	jmp    80105779 <alltraps>

80106091 <vector122>:
80106091:	6a 00                	push   $0x0
80106093:	6a 7a                	push   $0x7a
80106095:	e9 df f6 ff ff       	jmp    80105779 <alltraps>

8010609a <vector123>:
8010609a:	6a 00                	push   $0x0
8010609c:	6a 7b                	push   $0x7b
8010609e:	e9 d6 f6 ff ff       	jmp    80105779 <alltraps>

801060a3 <vector124>:
801060a3:	6a 00                	push   $0x0
801060a5:	6a 7c                	push   $0x7c
801060a7:	e9 cd f6 ff ff       	jmp    80105779 <alltraps>

801060ac <vector125>:
801060ac:	6a 00                	push   $0x0
801060ae:	6a 7d                	push   $0x7d
801060b0:	e9 c4 f6 ff ff       	jmp    80105779 <alltraps>

801060b5 <vector126>:
801060b5:	6a 00                	push   $0x0
801060b7:	6a 7e                	push   $0x7e
801060b9:	e9 bb f6 ff ff       	jmp    80105779 <alltraps>

801060be <vector127>:
801060be:	6a 00                	push   $0x0
801060c0:	6a 7f                	push   $0x7f
801060c2:	e9 b2 f6 ff ff       	jmp    80105779 <alltraps>

801060c7 <vector128>:
801060c7:	6a 00                	push   $0x0
801060c9:	68 80 00 00 00       	push   $0x80
801060ce:	e9 a6 f6 ff ff       	jmp    80105779 <alltraps>

801060d3 <vector129>:
801060d3:	6a 00                	push   $0x0
801060d5:	68 81 00 00 00       	push   $0x81
801060da:	e9 9a f6 ff ff       	jmp    80105779 <alltraps>

801060df <vector130>:
801060df:	6a 00                	push   $0x0
801060e1:	68 82 00 00 00       	push   $0x82
801060e6:	e9 8e f6 ff ff       	jmp    80105779 <alltraps>

801060eb <vector131>:
801060eb:	6a 00                	push   $0x0
801060ed:	68 83 00 00 00       	push   $0x83
801060f2:	e9 82 f6 ff ff       	jmp    80105779 <alltraps>

801060f7 <vector132>:
801060f7:	6a 00                	push   $0x0
801060f9:	68 84 00 00 00       	push   $0x84
801060fe:	e9 76 f6 ff ff       	jmp    80105779 <alltraps>

80106103 <vector133>:
80106103:	6a 00                	push   $0x0
80106105:	68 85 00 00 00       	push   $0x85
8010610a:	e9 6a f6 ff ff       	jmp    80105779 <alltraps>

8010610f <vector134>:
8010610f:	6a 00                	push   $0x0
80106111:	68 86 00 00 00       	push   $0x86
80106116:	e9 5e f6 ff ff       	jmp    80105779 <alltraps>

8010611b <vector135>:
8010611b:	6a 00                	push   $0x0
8010611d:	68 87 00 00 00       	push   $0x87
80106122:	e9 52 f6 ff ff       	jmp    80105779 <alltraps>

80106127 <vector136>:
80106127:	6a 00                	push   $0x0
80106129:	68 88 00 00 00       	push   $0x88
8010612e:	e9 46 f6 ff ff       	jmp    80105779 <alltraps>

80106133 <vector137>:
80106133:	6a 00                	push   $0x0
80106135:	68 89 00 00 00       	push   $0x89
8010613a:	e9 3a f6 ff ff       	jmp    80105779 <alltraps>

8010613f <vector138>:
8010613f:	6a 00                	push   $0x0
80106141:	68 8a 00 00 00       	push   $0x8a
80106146:	e9 2e f6 ff ff       	jmp    80105779 <alltraps>

8010614b <vector139>:
8010614b:	6a 00                	push   $0x0
8010614d:	68 8b 00 00 00       	push   $0x8b
80106152:	e9 22 f6 ff ff       	jmp    80105779 <alltraps>

80106157 <vector140>:
80106157:	6a 00                	push   $0x0
80106159:	68 8c 00 00 00       	push   $0x8c
8010615e:	e9 16 f6 ff ff       	jmp    80105779 <alltraps>

80106163 <vector141>:
80106163:	6a 00                	push   $0x0
80106165:	68 8d 00 00 00       	push   $0x8d
8010616a:	e9 0a f6 ff ff       	jmp    80105779 <alltraps>

8010616f <vector142>:
8010616f:	6a 00                	push   $0x0
80106171:	68 8e 00 00 00       	push   $0x8e
80106176:	e9 fe f5 ff ff       	jmp    80105779 <alltraps>

8010617b <vector143>:
8010617b:	6a 00                	push   $0x0
8010617d:	68 8f 00 00 00       	push   $0x8f
80106182:	e9 f2 f5 ff ff       	jmp    80105779 <alltraps>

80106187 <vector144>:
80106187:	6a 00                	push   $0x0
80106189:	68 90 00 00 00       	push   $0x90
8010618e:	e9 e6 f5 ff ff       	jmp    80105779 <alltraps>

80106193 <vector145>:
80106193:	6a 00                	push   $0x0
80106195:	68 91 00 00 00       	push   $0x91
8010619a:	e9 da f5 ff ff       	jmp    80105779 <alltraps>

8010619f <vector146>:
8010619f:	6a 00                	push   $0x0
801061a1:	68 92 00 00 00       	push   $0x92
801061a6:	e9 ce f5 ff ff       	jmp    80105779 <alltraps>

801061ab <vector147>:
801061ab:	6a 00                	push   $0x0
801061ad:	68 93 00 00 00       	push   $0x93
801061b2:	e9 c2 f5 ff ff       	jmp    80105779 <alltraps>

801061b7 <vector148>:
801061b7:	6a 00                	push   $0x0
801061b9:	68 94 00 00 00       	push   $0x94
801061be:	e9 b6 f5 ff ff       	jmp    80105779 <alltraps>

801061c3 <vector149>:
801061c3:	6a 00                	push   $0x0
801061c5:	68 95 00 00 00       	push   $0x95
801061ca:	e9 aa f5 ff ff       	jmp    80105779 <alltraps>

801061cf <vector150>:
801061cf:	6a 00                	push   $0x0
801061d1:	68 96 00 00 00       	push   $0x96
801061d6:	e9 9e f5 ff ff       	jmp    80105779 <alltraps>

801061db <vector151>:
801061db:	6a 00                	push   $0x0
801061dd:	68 97 00 00 00       	push   $0x97
801061e2:	e9 92 f5 ff ff       	jmp    80105779 <alltraps>

801061e7 <vector152>:
801061e7:	6a 00                	push   $0x0
801061e9:	68 98 00 00 00       	push   $0x98
801061ee:	e9 86 f5 ff ff       	jmp    80105779 <alltraps>

801061f3 <vector153>:
801061f3:	6a 00                	push   $0x0
801061f5:	68 99 00 00 00       	push   $0x99
801061fa:	e9 7a f5 ff ff       	jmp    80105779 <alltraps>

801061ff <vector154>:
801061ff:	6a 00                	push   $0x0
80106201:	68 9a 00 00 00       	push   $0x9a
80106206:	e9 6e f5 ff ff       	jmp    80105779 <alltraps>

8010620b <vector155>:
8010620b:	6a 00                	push   $0x0
8010620d:	68 9b 00 00 00       	push   $0x9b
80106212:	e9 62 f5 ff ff       	jmp    80105779 <alltraps>

80106217 <vector156>:
80106217:	6a 00                	push   $0x0
80106219:	68 9c 00 00 00       	push   $0x9c
8010621e:	e9 56 f5 ff ff       	jmp    80105779 <alltraps>

80106223 <vector157>:
80106223:	6a 00                	push   $0x0
80106225:	68 9d 00 00 00       	push   $0x9d
8010622a:	e9 4a f5 ff ff       	jmp    80105779 <alltraps>

8010622f <vector158>:
8010622f:	6a 00                	push   $0x0
80106231:	68 9e 00 00 00       	push   $0x9e
80106236:	e9 3e f5 ff ff       	jmp    80105779 <alltraps>

8010623b <vector159>:
8010623b:	6a 00                	push   $0x0
8010623d:	68 9f 00 00 00       	push   $0x9f
80106242:	e9 32 f5 ff ff       	jmp    80105779 <alltraps>

80106247 <vector160>:
80106247:	6a 00                	push   $0x0
80106249:	68 a0 00 00 00       	push   $0xa0
8010624e:	e9 26 f5 ff ff       	jmp    80105779 <alltraps>

80106253 <vector161>:
80106253:	6a 00                	push   $0x0
80106255:	68 a1 00 00 00       	push   $0xa1
8010625a:	e9 1a f5 ff ff       	jmp    80105779 <alltraps>

8010625f <vector162>:
8010625f:	6a 00                	push   $0x0
80106261:	68 a2 00 00 00       	push   $0xa2
80106266:	e9 0e f5 ff ff       	jmp    80105779 <alltraps>

8010626b <vector163>:
8010626b:	6a 00                	push   $0x0
8010626d:	68 a3 00 00 00       	push   $0xa3
80106272:	e9 02 f5 ff ff       	jmp    80105779 <alltraps>

80106277 <vector164>:
80106277:	6a 00                	push   $0x0
80106279:	68 a4 00 00 00       	push   $0xa4
8010627e:	e9 f6 f4 ff ff       	jmp    80105779 <alltraps>

80106283 <vector165>:
80106283:	6a 00                	push   $0x0
80106285:	68 a5 00 00 00       	push   $0xa5
8010628a:	e9 ea f4 ff ff       	jmp    80105779 <alltraps>

8010628f <vector166>:
8010628f:	6a 00                	push   $0x0
80106291:	68 a6 00 00 00       	push   $0xa6
80106296:	e9 de f4 ff ff       	jmp    80105779 <alltraps>

8010629b <vector167>:
8010629b:	6a 00                	push   $0x0
8010629d:	68 a7 00 00 00       	push   $0xa7
801062a2:	e9 d2 f4 ff ff       	jmp    80105779 <alltraps>

801062a7 <vector168>:
801062a7:	6a 00                	push   $0x0
801062a9:	68 a8 00 00 00       	push   $0xa8
801062ae:	e9 c6 f4 ff ff       	jmp    80105779 <alltraps>

801062b3 <vector169>:
801062b3:	6a 00                	push   $0x0
801062b5:	68 a9 00 00 00       	push   $0xa9
801062ba:	e9 ba f4 ff ff       	jmp    80105779 <alltraps>

801062bf <vector170>:
801062bf:	6a 00                	push   $0x0
801062c1:	68 aa 00 00 00       	push   $0xaa
801062c6:	e9 ae f4 ff ff       	jmp    80105779 <alltraps>

801062cb <vector171>:
801062cb:	6a 00                	push   $0x0
801062cd:	68 ab 00 00 00       	push   $0xab
801062d2:	e9 a2 f4 ff ff       	jmp    80105779 <alltraps>

801062d7 <vector172>:
801062d7:	6a 00                	push   $0x0
801062d9:	68 ac 00 00 00       	push   $0xac
801062de:	e9 96 f4 ff ff       	jmp    80105779 <alltraps>

801062e3 <vector173>:
801062e3:	6a 00                	push   $0x0
801062e5:	68 ad 00 00 00       	push   $0xad
801062ea:	e9 8a f4 ff ff       	jmp    80105779 <alltraps>

801062ef <vector174>:
801062ef:	6a 00                	push   $0x0
801062f1:	68 ae 00 00 00       	push   $0xae
801062f6:	e9 7e f4 ff ff       	jmp    80105779 <alltraps>

801062fb <vector175>:
801062fb:	6a 00                	push   $0x0
801062fd:	68 af 00 00 00       	push   $0xaf
80106302:	e9 72 f4 ff ff       	jmp    80105779 <alltraps>

80106307 <vector176>:
80106307:	6a 00                	push   $0x0
80106309:	68 b0 00 00 00       	push   $0xb0
8010630e:	e9 66 f4 ff ff       	jmp    80105779 <alltraps>

80106313 <vector177>:
80106313:	6a 00                	push   $0x0
80106315:	68 b1 00 00 00       	push   $0xb1
8010631a:	e9 5a f4 ff ff       	jmp    80105779 <alltraps>

8010631f <vector178>:
8010631f:	6a 00                	push   $0x0
80106321:	68 b2 00 00 00       	push   $0xb2
80106326:	e9 4e f4 ff ff       	jmp    80105779 <alltraps>

8010632b <vector179>:
8010632b:	6a 00                	push   $0x0
8010632d:	68 b3 00 00 00       	push   $0xb3
80106332:	e9 42 f4 ff ff       	jmp    80105779 <alltraps>

80106337 <vector180>:
80106337:	6a 00                	push   $0x0
80106339:	68 b4 00 00 00       	push   $0xb4
8010633e:	e9 36 f4 ff ff       	jmp    80105779 <alltraps>

80106343 <vector181>:
80106343:	6a 00                	push   $0x0
80106345:	68 b5 00 00 00       	push   $0xb5
8010634a:	e9 2a f4 ff ff       	jmp    80105779 <alltraps>

8010634f <vector182>:
8010634f:	6a 00                	push   $0x0
80106351:	68 b6 00 00 00       	push   $0xb6
80106356:	e9 1e f4 ff ff       	jmp    80105779 <alltraps>

8010635b <vector183>:
8010635b:	6a 00                	push   $0x0
8010635d:	68 b7 00 00 00       	push   $0xb7
80106362:	e9 12 f4 ff ff       	jmp    80105779 <alltraps>

80106367 <vector184>:
80106367:	6a 00                	push   $0x0
80106369:	68 b8 00 00 00       	push   $0xb8
8010636e:	e9 06 f4 ff ff       	jmp    80105779 <alltraps>

80106373 <vector185>:
80106373:	6a 00                	push   $0x0
80106375:	68 b9 00 00 00       	push   $0xb9
8010637a:	e9 fa f3 ff ff       	jmp    80105779 <alltraps>

8010637f <vector186>:
8010637f:	6a 00                	push   $0x0
80106381:	68 ba 00 00 00       	push   $0xba
80106386:	e9 ee f3 ff ff       	jmp    80105779 <alltraps>

8010638b <vector187>:
8010638b:	6a 00                	push   $0x0
8010638d:	68 bb 00 00 00       	push   $0xbb
80106392:	e9 e2 f3 ff ff       	jmp    80105779 <alltraps>

80106397 <vector188>:
80106397:	6a 00                	push   $0x0
80106399:	68 bc 00 00 00       	push   $0xbc
8010639e:	e9 d6 f3 ff ff       	jmp    80105779 <alltraps>

801063a3 <vector189>:
801063a3:	6a 00                	push   $0x0
801063a5:	68 bd 00 00 00       	push   $0xbd
801063aa:	e9 ca f3 ff ff       	jmp    80105779 <alltraps>

801063af <vector190>:
801063af:	6a 00                	push   $0x0
801063b1:	68 be 00 00 00       	push   $0xbe
801063b6:	e9 be f3 ff ff       	jmp    80105779 <alltraps>

801063bb <vector191>:
801063bb:	6a 00                	push   $0x0
801063bd:	68 bf 00 00 00       	push   $0xbf
801063c2:	e9 b2 f3 ff ff       	jmp    80105779 <alltraps>

801063c7 <vector192>:
801063c7:	6a 00                	push   $0x0
801063c9:	68 c0 00 00 00       	push   $0xc0
801063ce:	e9 a6 f3 ff ff       	jmp    80105779 <alltraps>

801063d3 <vector193>:
801063d3:	6a 00                	push   $0x0
801063d5:	68 c1 00 00 00       	push   $0xc1
801063da:	e9 9a f3 ff ff       	jmp    80105779 <alltraps>

801063df <vector194>:
801063df:	6a 00                	push   $0x0
801063e1:	68 c2 00 00 00       	push   $0xc2
801063e6:	e9 8e f3 ff ff       	jmp    80105779 <alltraps>

801063eb <vector195>:
801063eb:	6a 00                	push   $0x0
801063ed:	68 c3 00 00 00       	push   $0xc3
801063f2:	e9 82 f3 ff ff       	jmp    80105779 <alltraps>

801063f7 <vector196>:
801063f7:	6a 00                	push   $0x0
801063f9:	68 c4 00 00 00       	push   $0xc4
801063fe:	e9 76 f3 ff ff       	jmp    80105779 <alltraps>

80106403 <vector197>:
80106403:	6a 00                	push   $0x0
80106405:	68 c5 00 00 00       	push   $0xc5
8010640a:	e9 6a f3 ff ff       	jmp    80105779 <alltraps>

8010640f <vector198>:
8010640f:	6a 00                	push   $0x0
80106411:	68 c6 00 00 00       	push   $0xc6
80106416:	e9 5e f3 ff ff       	jmp    80105779 <alltraps>

8010641b <vector199>:
8010641b:	6a 00                	push   $0x0
8010641d:	68 c7 00 00 00       	push   $0xc7
80106422:	e9 52 f3 ff ff       	jmp    80105779 <alltraps>

80106427 <vector200>:
80106427:	6a 00                	push   $0x0
80106429:	68 c8 00 00 00       	push   $0xc8
8010642e:	e9 46 f3 ff ff       	jmp    80105779 <alltraps>

80106433 <vector201>:
80106433:	6a 00                	push   $0x0
80106435:	68 c9 00 00 00       	push   $0xc9
8010643a:	e9 3a f3 ff ff       	jmp    80105779 <alltraps>

8010643f <vector202>:
8010643f:	6a 00                	push   $0x0
80106441:	68 ca 00 00 00       	push   $0xca
80106446:	e9 2e f3 ff ff       	jmp    80105779 <alltraps>

8010644b <vector203>:
8010644b:	6a 00                	push   $0x0
8010644d:	68 cb 00 00 00       	push   $0xcb
80106452:	e9 22 f3 ff ff       	jmp    80105779 <alltraps>

80106457 <vector204>:
80106457:	6a 00                	push   $0x0
80106459:	68 cc 00 00 00       	push   $0xcc
8010645e:	e9 16 f3 ff ff       	jmp    80105779 <alltraps>

80106463 <vector205>:
80106463:	6a 00                	push   $0x0
80106465:	68 cd 00 00 00       	push   $0xcd
8010646a:	e9 0a f3 ff ff       	jmp    80105779 <alltraps>

8010646f <vector206>:
8010646f:	6a 00                	push   $0x0
80106471:	68 ce 00 00 00       	push   $0xce
80106476:	e9 fe f2 ff ff       	jmp    80105779 <alltraps>

8010647b <vector207>:
8010647b:	6a 00                	push   $0x0
8010647d:	68 cf 00 00 00       	push   $0xcf
80106482:	e9 f2 f2 ff ff       	jmp    80105779 <alltraps>

80106487 <vector208>:
80106487:	6a 00                	push   $0x0
80106489:	68 d0 00 00 00       	push   $0xd0
8010648e:	e9 e6 f2 ff ff       	jmp    80105779 <alltraps>

80106493 <vector209>:
80106493:	6a 00                	push   $0x0
80106495:	68 d1 00 00 00       	push   $0xd1
8010649a:	e9 da f2 ff ff       	jmp    80105779 <alltraps>

8010649f <vector210>:
8010649f:	6a 00                	push   $0x0
801064a1:	68 d2 00 00 00       	push   $0xd2
801064a6:	e9 ce f2 ff ff       	jmp    80105779 <alltraps>

801064ab <vector211>:
801064ab:	6a 00                	push   $0x0
801064ad:	68 d3 00 00 00       	push   $0xd3
801064b2:	e9 c2 f2 ff ff       	jmp    80105779 <alltraps>

801064b7 <vector212>:
801064b7:	6a 00                	push   $0x0
801064b9:	68 d4 00 00 00       	push   $0xd4
801064be:	e9 b6 f2 ff ff       	jmp    80105779 <alltraps>

801064c3 <vector213>:
801064c3:	6a 00                	push   $0x0
801064c5:	68 d5 00 00 00       	push   $0xd5
801064ca:	e9 aa f2 ff ff       	jmp    80105779 <alltraps>

801064cf <vector214>:
801064cf:	6a 00                	push   $0x0
801064d1:	68 d6 00 00 00       	push   $0xd6
801064d6:	e9 9e f2 ff ff       	jmp    80105779 <alltraps>

801064db <vector215>:
801064db:	6a 00                	push   $0x0
801064dd:	68 d7 00 00 00       	push   $0xd7
801064e2:	e9 92 f2 ff ff       	jmp    80105779 <alltraps>

801064e7 <vector216>:
801064e7:	6a 00                	push   $0x0
801064e9:	68 d8 00 00 00       	push   $0xd8
801064ee:	e9 86 f2 ff ff       	jmp    80105779 <alltraps>

801064f3 <vector217>:
801064f3:	6a 00                	push   $0x0
801064f5:	68 d9 00 00 00       	push   $0xd9
801064fa:	e9 7a f2 ff ff       	jmp    80105779 <alltraps>

801064ff <vector218>:
801064ff:	6a 00                	push   $0x0
80106501:	68 da 00 00 00       	push   $0xda
80106506:	e9 6e f2 ff ff       	jmp    80105779 <alltraps>

8010650b <vector219>:
8010650b:	6a 00                	push   $0x0
8010650d:	68 db 00 00 00       	push   $0xdb
80106512:	e9 62 f2 ff ff       	jmp    80105779 <alltraps>

80106517 <vector220>:
80106517:	6a 00                	push   $0x0
80106519:	68 dc 00 00 00       	push   $0xdc
8010651e:	e9 56 f2 ff ff       	jmp    80105779 <alltraps>

80106523 <vector221>:
80106523:	6a 00                	push   $0x0
80106525:	68 dd 00 00 00       	push   $0xdd
8010652a:	e9 4a f2 ff ff       	jmp    80105779 <alltraps>

8010652f <vector222>:
8010652f:	6a 00                	push   $0x0
80106531:	68 de 00 00 00       	push   $0xde
80106536:	e9 3e f2 ff ff       	jmp    80105779 <alltraps>

8010653b <vector223>:
8010653b:	6a 00                	push   $0x0
8010653d:	68 df 00 00 00       	push   $0xdf
80106542:	e9 32 f2 ff ff       	jmp    80105779 <alltraps>

80106547 <vector224>:
80106547:	6a 00                	push   $0x0
80106549:	68 e0 00 00 00       	push   $0xe0
8010654e:	e9 26 f2 ff ff       	jmp    80105779 <alltraps>

80106553 <vector225>:
80106553:	6a 00                	push   $0x0
80106555:	68 e1 00 00 00       	push   $0xe1
8010655a:	e9 1a f2 ff ff       	jmp    80105779 <alltraps>

8010655f <vector226>:
8010655f:	6a 00                	push   $0x0
80106561:	68 e2 00 00 00       	push   $0xe2
80106566:	e9 0e f2 ff ff       	jmp    80105779 <alltraps>

8010656b <vector227>:
8010656b:	6a 00                	push   $0x0
8010656d:	68 e3 00 00 00       	push   $0xe3
80106572:	e9 02 f2 ff ff       	jmp    80105779 <alltraps>

80106577 <vector228>:
80106577:	6a 00                	push   $0x0
80106579:	68 e4 00 00 00       	push   $0xe4
8010657e:	e9 f6 f1 ff ff       	jmp    80105779 <alltraps>

80106583 <vector229>:
80106583:	6a 00                	push   $0x0
80106585:	68 e5 00 00 00       	push   $0xe5
8010658a:	e9 ea f1 ff ff       	jmp    80105779 <alltraps>

8010658f <vector230>:
8010658f:	6a 00                	push   $0x0
80106591:	68 e6 00 00 00       	push   $0xe6
80106596:	e9 de f1 ff ff       	jmp    80105779 <alltraps>

8010659b <vector231>:
8010659b:	6a 00                	push   $0x0
8010659d:	68 e7 00 00 00       	push   $0xe7
801065a2:	e9 d2 f1 ff ff       	jmp    80105779 <alltraps>

801065a7 <vector232>:
801065a7:	6a 00                	push   $0x0
801065a9:	68 e8 00 00 00       	push   $0xe8
801065ae:	e9 c6 f1 ff ff       	jmp    80105779 <alltraps>

801065b3 <vector233>:
801065b3:	6a 00                	push   $0x0
801065b5:	68 e9 00 00 00       	push   $0xe9
801065ba:	e9 ba f1 ff ff       	jmp    80105779 <alltraps>

801065bf <vector234>:
801065bf:	6a 00                	push   $0x0
801065c1:	68 ea 00 00 00       	push   $0xea
801065c6:	e9 ae f1 ff ff       	jmp    80105779 <alltraps>

801065cb <vector235>:
801065cb:	6a 00                	push   $0x0
801065cd:	68 eb 00 00 00       	push   $0xeb
801065d2:	e9 a2 f1 ff ff       	jmp    80105779 <alltraps>

801065d7 <vector236>:
801065d7:	6a 00                	push   $0x0
801065d9:	68 ec 00 00 00       	push   $0xec
801065de:	e9 96 f1 ff ff       	jmp    80105779 <alltraps>

801065e3 <vector237>:
801065e3:	6a 00                	push   $0x0
801065e5:	68 ed 00 00 00       	push   $0xed
801065ea:	e9 8a f1 ff ff       	jmp    80105779 <alltraps>

801065ef <vector238>:
801065ef:	6a 00                	push   $0x0
801065f1:	68 ee 00 00 00       	push   $0xee
801065f6:	e9 7e f1 ff ff       	jmp    80105779 <alltraps>

801065fb <vector239>:
801065fb:	6a 00                	push   $0x0
801065fd:	68 ef 00 00 00       	push   $0xef
80106602:	e9 72 f1 ff ff       	jmp    80105779 <alltraps>

80106607 <vector240>:
80106607:	6a 00                	push   $0x0
80106609:	68 f0 00 00 00       	push   $0xf0
8010660e:	e9 66 f1 ff ff       	jmp    80105779 <alltraps>

80106613 <vector241>:
80106613:	6a 00                	push   $0x0
80106615:	68 f1 00 00 00       	push   $0xf1
8010661a:	e9 5a f1 ff ff       	jmp    80105779 <alltraps>

8010661f <vector242>:
8010661f:	6a 00                	push   $0x0
80106621:	68 f2 00 00 00       	push   $0xf2
80106626:	e9 4e f1 ff ff       	jmp    80105779 <alltraps>

8010662b <vector243>:
8010662b:	6a 00                	push   $0x0
8010662d:	68 f3 00 00 00       	push   $0xf3
80106632:	e9 42 f1 ff ff       	jmp    80105779 <alltraps>

80106637 <vector244>:
80106637:	6a 00                	push   $0x0
80106639:	68 f4 00 00 00       	push   $0xf4
8010663e:	e9 36 f1 ff ff       	jmp    80105779 <alltraps>

80106643 <vector245>:
80106643:	6a 00                	push   $0x0
80106645:	68 f5 00 00 00       	push   $0xf5
8010664a:	e9 2a f1 ff ff       	jmp    80105779 <alltraps>

8010664f <vector246>:
8010664f:	6a 00                	push   $0x0
80106651:	68 f6 00 00 00       	push   $0xf6
80106656:	e9 1e f1 ff ff       	jmp    80105779 <alltraps>

8010665b <vector247>:
8010665b:	6a 00                	push   $0x0
8010665d:	68 f7 00 00 00       	push   $0xf7
80106662:	e9 12 f1 ff ff       	jmp    80105779 <alltraps>

80106667 <vector248>:
80106667:	6a 00                	push   $0x0
80106669:	68 f8 00 00 00       	push   $0xf8
8010666e:	e9 06 f1 ff ff       	jmp    80105779 <alltraps>

80106673 <vector249>:
80106673:	6a 00                	push   $0x0
80106675:	68 f9 00 00 00       	push   $0xf9
8010667a:	e9 fa f0 ff ff       	jmp    80105779 <alltraps>

8010667f <vector250>:
8010667f:	6a 00                	push   $0x0
80106681:	68 fa 00 00 00       	push   $0xfa
80106686:	e9 ee f0 ff ff       	jmp    80105779 <alltraps>

8010668b <vector251>:
8010668b:	6a 00                	push   $0x0
8010668d:	68 fb 00 00 00       	push   $0xfb
80106692:	e9 e2 f0 ff ff       	jmp    80105779 <alltraps>

80106697 <vector252>:
80106697:	6a 00                	push   $0x0
80106699:	68 fc 00 00 00       	push   $0xfc
8010669e:	e9 d6 f0 ff ff       	jmp    80105779 <alltraps>

801066a3 <vector253>:
801066a3:	6a 00                	push   $0x0
801066a5:	68 fd 00 00 00       	push   $0xfd
801066aa:	e9 ca f0 ff ff       	jmp    80105779 <alltraps>

801066af <vector254>:
801066af:	6a 00                	push   $0x0
801066b1:	68 fe 00 00 00       	push   $0xfe
801066b6:	e9 be f0 ff ff       	jmp    80105779 <alltraps>

801066bb <vector255>:
801066bb:	6a 00                	push   $0x0
801066bd:	68 ff 00 00 00       	push   $0xff
801066c2:	e9 b2 f0 ff ff       	jmp    80105779 <alltraps>
801066c7:	66 90                	xchg   %ax,%ax
801066c9:	66 90                	xchg   %ax,%ax
801066cb:	66 90                	xchg   %ax,%ax
801066cd:	66 90                	xchg   %ax,%ax
801066cf:	90                   	nop

801066d0 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801066d0:	55                   	push   %ebp
801066d1:	89 e5                	mov    %esp,%ebp
801066d3:	57                   	push   %edi
801066d4:	56                   	push   %esi
801066d5:	53                   	push   %ebx
801066d6:	89 d3                	mov    %edx,%ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
801066d8:	c1 ea 16             	shr    $0x16,%edx
801066db:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801066de:	83 ec 0c             	sub    $0xc,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
801066e1:	8b 07                	mov    (%edi),%eax
801066e3:	a8 01                	test   $0x1,%al
801066e5:	74 29                	je     80106710 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801066e7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801066ec:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
801066f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
801066f5:	c1 eb 0a             	shr    $0xa,%ebx
801066f8:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
801066fe:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
}
80106701:	5b                   	pop    %ebx
80106702:	5e                   	pop    %esi
80106703:	5f                   	pop    %edi
80106704:	5d                   	pop    %ebp
80106705:	c3                   	ret    
80106706:	8d 76 00             	lea    0x0(%esi),%esi
80106709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106710:	85 c9                	test   %ecx,%ecx
80106712:	74 2c                	je     80106740 <walkpgdir+0x70>
80106714:	e8 b7 bd ff ff       	call   801024d0 <kalloc>
80106719:	85 c0                	test   %eax,%eax
8010671b:	89 c6                	mov    %eax,%esi
8010671d:	74 21                	je     80106740 <walkpgdir+0x70>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
8010671f:	83 ec 04             	sub    $0x4,%esp
80106722:	68 00 10 00 00       	push   $0x1000
80106727:	6a 00                	push   $0x0
80106729:	50                   	push   %eax
8010672a:	e8 61 de ff ff       	call   80104590 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
8010672f:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106735:	83 c4 10             	add    $0x10,%esp
80106738:	83 c8 07             	or     $0x7,%eax
8010673b:	89 07                	mov    %eax,(%edi)
8010673d:	eb b3                	jmp    801066f2 <walkpgdir+0x22>
8010673f:	90                   	nop
  }
  return &pgtab[PTX(va)];
}
80106740:	8d 65 f4             	lea    -0xc(%ebp),%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
80106743:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106745:	5b                   	pop    %ebx
80106746:	5e                   	pop    %esi
80106747:	5f                   	pop    %edi
80106748:	5d                   	pop    %ebp
80106749:	c3                   	ret    
8010674a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106750 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106750:	55                   	push   %ebp
80106751:	89 e5                	mov    %esp,%ebp
80106753:	57                   	push   %edi
80106754:	56                   	push   %esi
80106755:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106756:	89 d3                	mov    %edx,%ebx
80106758:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
8010675e:	83 ec 1c             	sub    $0x1c,%esp
80106761:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106764:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106768:	8b 7d 08             	mov    0x8(%ebp),%edi
8010676b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106770:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106773:	8b 45 0c             	mov    0xc(%ebp),%eax
80106776:	29 df                	sub    %ebx,%edi
80106778:	83 c8 01             	or     $0x1,%eax
8010677b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010677e:	eb 15                	jmp    80106795 <mappages+0x45>
  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
80106780:	f6 00 01             	testb  $0x1,(%eax)
80106783:	75 45                	jne    801067ca <mappages+0x7a>
      panic("remap");
    *pte = pa | perm | PTE_P;
80106785:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106788:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
8010678b:	89 30                	mov    %esi,(%eax)
    if(a == last)
8010678d:	74 31                	je     801067c0 <mappages+0x70>
      break;
    a += PGSIZE;
8010678f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106795:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106798:	b9 01 00 00 00       	mov    $0x1,%ecx
8010679d:	89 da                	mov    %ebx,%edx
8010679f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
801067a2:	e8 29 ff ff ff       	call   801066d0 <walkpgdir>
801067a7:	85 c0                	test   %eax,%eax
801067a9:	75 d5                	jne    80106780 <mappages+0x30>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801067ab:	8d 65 f4             	lea    -0xc(%ebp),%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
801067ae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801067b3:	5b                   	pop    %ebx
801067b4:	5e                   	pop    %esi
801067b5:	5f                   	pop    %edi
801067b6:	5d                   	pop    %ebp
801067b7:	c3                   	ret    
801067b8:	90                   	nop
801067b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801067c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
801067c3:	31 c0                	xor    %eax,%eax
}
801067c5:	5b                   	pop    %ebx
801067c6:	5e                   	pop    %esi
801067c7:	5f                   	pop    %edi
801067c8:	5d                   	pop    %ebp
801067c9:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
801067ca:	83 ec 0c             	sub    $0xc,%esp
801067cd:	68 2c 7a 10 80       	push   $0x80107a2c
801067d2:	e8 b9 9b ff ff       	call   80100390 <panic>
801067d7:	89 f6                	mov    %esi,%esi
801067d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801067e0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801067e0:	55                   	push   %ebp
801067e1:	89 e5                	mov    %esp,%ebp
801067e3:	57                   	push   %edi
801067e4:	56                   	push   %esi
801067e5:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801067e6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801067ec:	89 c7                	mov    %eax,%edi
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801067ee:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801067f4:	83 ec 1c             	sub    $0x1c,%esp
801067f7:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801067fa:	39 d3                	cmp    %edx,%ebx
801067fc:	73 66                	jae    80106864 <deallocuvm.part.0+0x84>
801067fe:	89 d6                	mov    %edx,%esi
80106800:	eb 3d                	jmp    8010683f <deallocuvm.part.0+0x5f>
80106802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106808:	8b 10                	mov    (%eax),%edx
8010680a:	f6 c2 01             	test   $0x1,%dl
8010680d:	74 26                	je     80106835 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
8010680f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106815:	74 58                	je     8010686f <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106817:	83 ec 0c             	sub    $0xc,%esp
8010681a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106820:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106823:	52                   	push   %edx
80106824:	e8 f7 ba ff ff       	call   80102320 <kfree>
      *pte = 0;
80106829:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010682c:	83 c4 10             	add    $0x10,%esp
8010682f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106835:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010683b:	39 f3                	cmp    %esi,%ebx
8010683d:	73 25                	jae    80106864 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010683f:	31 c9                	xor    %ecx,%ecx
80106841:	89 da                	mov    %ebx,%edx
80106843:	89 f8                	mov    %edi,%eax
80106845:	e8 86 fe ff ff       	call   801066d0 <walkpgdir>
    if(!pte)
8010684a:	85 c0                	test   %eax,%eax
8010684c:	75 ba                	jne    80106808 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
8010684e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106854:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
8010685a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106860:	39 f3                	cmp    %esi,%ebx
80106862:	72 db                	jb     8010683f <deallocuvm.part.0+0x5f>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106864:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106867:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010686a:	5b                   	pop    %ebx
8010686b:	5e                   	pop    %esi
8010686c:	5f                   	pop    %edi
8010686d:	5d                   	pop    %ebp
8010686e:	c3                   	ret    
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
8010686f:	83 ec 0c             	sub    $0xc,%esp
80106872:	68 66 73 10 80       	push   $0x80107366
80106877:	e8 14 9b ff ff       	call   80100390 <panic>
8010687c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106880 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106880:	55                   	push   %ebp
80106881:	89 e5                	mov    %esp,%ebp
80106883:	83 ec 18             	sub    $0x18,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
80106886:	e8 35 cf ff ff       	call   801037c0 <cpuid>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010688b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106891:	31 c9                	xor    %ecx,%ecx
80106893:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106898:	66 89 90 f8 27 11 80 	mov    %dx,-0x7feed808(%eax)
8010689f:	66 89 88 fa 27 11 80 	mov    %cx,-0x7feed806(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801068a6:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801068ab:	31 c9                	xor    %ecx,%ecx
801068ad:	66 89 90 00 28 11 80 	mov    %dx,-0x7feed800(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801068b4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801068b9:	66 89 88 02 28 11 80 	mov    %cx,-0x7feed7fe(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801068c0:	31 c9                	xor    %ecx,%ecx
801068c2:	66 89 90 08 28 11 80 	mov    %dx,-0x7feed7f8(%eax)
801068c9:	66 89 88 0a 28 11 80 	mov    %cx,-0x7feed7f6(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801068d0:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801068d5:	31 c9                	xor    %ecx,%ecx
801068d7:	66 89 90 10 28 11 80 	mov    %dx,-0x7feed7f0(%eax)
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801068de:	c6 80 fc 27 11 80 00 	movb   $0x0,-0x7feed804(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
801068e5:	ba 2f 00 00 00       	mov    $0x2f,%edx
801068ea:	c6 80 fd 27 11 80 9a 	movb   $0x9a,-0x7feed803(%eax)
801068f1:	c6 80 fe 27 11 80 cf 	movb   $0xcf,-0x7feed802(%eax)
801068f8:	c6 80 ff 27 11 80 00 	movb   $0x0,-0x7feed801(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801068ff:	c6 80 04 28 11 80 00 	movb   $0x0,-0x7feed7fc(%eax)
80106906:	c6 80 05 28 11 80 92 	movb   $0x92,-0x7feed7fb(%eax)
8010690d:	c6 80 06 28 11 80 cf 	movb   $0xcf,-0x7feed7fa(%eax)
80106914:	c6 80 07 28 11 80 00 	movb   $0x0,-0x7feed7f9(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010691b:	c6 80 0c 28 11 80 00 	movb   $0x0,-0x7feed7f4(%eax)
80106922:	c6 80 0d 28 11 80 fa 	movb   $0xfa,-0x7feed7f3(%eax)
80106929:	c6 80 0e 28 11 80 cf 	movb   $0xcf,-0x7feed7f2(%eax)
80106930:	c6 80 0f 28 11 80 00 	movb   $0x0,-0x7feed7f1(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106937:	66 89 88 12 28 11 80 	mov    %cx,-0x7feed7ee(%eax)
8010693e:	c6 80 14 28 11 80 00 	movb   $0x0,-0x7feed7ec(%eax)
80106945:	c6 80 15 28 11 80 f2 	movb   $0xf2,-0x7feed7eb(%eax)
8010694c:	c6 80 16 28 11 80 cf 	movb   $0xcf,-0x7feed7ea(%eax)
80106953:	c6 80 17 28 11 80 00 	movb   $0x0,-0x7feed7e9(%eax)
  lgdt(c->gdt, sizeof(c->gdt));
8010695a:	05 f0 27 11 80       	add    $0x801127f0,%eax
8010695f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  pd[1] = (uint)p;
80106963:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106967:	c1 e8 10             	shr    $0x10,%eax
8010696a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
8010696e:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106971:	0f 01 10             	lgdtl  (%eax)
}
80106974:	c9                   	leave  
80106975:	c3                   	ret    
80106976:	8d 76 00             	lea    0x0(%esi),%esi
80106979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106980 <switchkvm>:
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106980:	a1 a4 54 11 80       	mov    0x801154a4,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106985:	55                   	push   %ebp
80106986:	89 e5                	mov    %esp,%ebp
80106988:	05 00 00 00 80       	add    $0x80000000,%eax
8010698d:	0f 22 d8             	mov    %eax,%cr3
  lcr3(V2P(kpgdir));   // switch to the kernel page table
}
80106990:	5d                   	pop    %ebp
80106991:	c3                   	ret    
80106992:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801069a0 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
801069a0:	55                   	push   %ebp
801069a1:	89 e5                	mov    %esp,%ebp
801069a3:	57                   	push   %edi
801069a4:	56                   	push   %esi
801069a5:	53                   	push   %ebx
801069a6:	83 ec 1c             	sub    $0x1c,%esp
801069a9:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
801069ac:	85 f6                	test   %esi,%esi
801069ae:	0f 84 cd 00 00 00    	je     80106a81 <switchuvm+0xe1>
    panic("switchuvm: no process");
  if(p->kstack == 0)
801069b4:	8b 46 08             	mov    0x8(%esi),%eax
801069b7:	85 c0                	test   %eax,%eax
801069b9:	0f 84 dc 00 00 00    	je     80106a9b <switchuvm+0xfb>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
801069bf:	8b 7e 04             	mov    0x4(%esi),%edi
801069c2:	85 ff                	test   %edi,%edi
801069c4:	0f 84 c4 00 00 00    	je     80106a8e <switchuvm+0xee>
    panic("switchuvm: no pgdir");

  pushcli();
801069ca:	e8 e1 d9 ff ff       	call   801043b0 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
801069cf:	e8 6c cd ff ff       	call   80103740 <mycpu>
801069d4:	89 c3                	mov    %eax,%ebx
801069d6:	e8 65 cd ff ff       	call   80103740 <mycpu>
801069db:	89 c7                	mov    %eax,%edi
801069dd:	e8 5e cd ff ff       	call   80103740 <mycpu>
801069e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801069e5:	83 c7 08             	add    $0x8,%edi
801069e8:	e8 53 cd ff ff       	call   80103740 <mycpu>
801069ed:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801069f0:	83 c0 08             	add    $0x8,%eax
801069f3:	ba 67 00 00 00       	mov    $0x67,%edx
801069f8:	c1 e8 18             	shr    $0x18,%eax
801069fb:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
80106a02:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106a09:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
80106a10:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80106a17:	83 c1 08             	add    $0x8,%ecx
80106a1a:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106a20:	c1 e9 10             	shr    $0x10,%ecx
80106a23:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
  mycpu()->gdt[SEG_TSS].s = 0;
  mycpu()->ts.ss0 = SEG_KDATA << 3;
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106a29:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    panic("switchuvm: no pgdir");

  pushcli();
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
                                sizeof(mycpu()->ts)-1, 0);
  mycpu()->gdt[SEG_TSS].s = 0;
80106a2e:	e8 0d cd ff ff       	call   80103740 <mycpu>
80106a33:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106a3a:	e8 01 cd ff ff       	call   80103740 <mycpu>
80106a3f:	b9 10 00 00 00       	mov    $0x10,%ecx
80106a44:	66 89 48 10          	mov    %cx,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106a48:	e8 f3 cc ff ff       	call   80103740 <mycpu>
80106a4d:	8b 56 08             	mov    0x8(%esi),%edx
80106a50:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
80106a56:	89 48 0c             	mov    %ecx,0xc(%eax)
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106a59:	e8 e2 cc ff ff       	call   80103740 <mycpu>
80106a5e:	66 89 58 6e          	mov    %bx,0x6e(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
80106a62:	b8 28 00 00 00       	mov    $0x28,%eax
80106a67:	0f 00 d8             	ltr    %ax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106a6a:	8b 46 04             	mov    0x4(%esi),%eax
80106a6d:	05 00 00 00 80       	add    $0x80000000,%eax
80106a72:	0f 22 d8             	mov    %eax,%cr3
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
}
80106a75:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a78:	5b                   	pop    %ebx
80106a79:	5e                   	pop    %esi
80106a7a:	5f                   	pop    %edi
80106a7b:	5d                   	pop    %ebp
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
80106a7c:	e9 6f d9 ff ff       	jmp    801043f0 <popcli>
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
80106a81:	83 ec 0c             	sub    $0xc,%esp
80106a84:	68 32 7a 10 80       	push   $0x80107a32
80106a89:	e8 02 99 ff ff       	call   80100390 <panic>
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
80106a8e:	83 ec 0c             	sub    $0xc,%esp
80106a91:	68 5d 7a 10 80       	push   $0x80107a5d
80106a96:	e8 f5 98 ff ff       	call   80100390 <panic>
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
80106a9b:	83 ec 0c             	sub    $0xc,%esp
80106a9e:	68 48 7a 10 80       	push   $0x80107a48
80106aa3:	e8 e8 98 ff ff       	call   80100390 <panic>
80106aa8:	90                   	nop
80106aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106ab0 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106ab0:	55                   	push   %ebp
80106ab1:	89 e5                	mov    %esp,%ebp
80106ab3:	57                   	push   %edi
80106ab4:	56                   	push   %esi
80106ab5:	53                   	push   %ebx
80106ab6:	83 ec 1c             	sub    $0x1c,%esp
80106ab9:	8b 75 10             	mov    0x10(%ebp),%esi
80106abc:	8b 45 08             	mov    0x8(%ebp),%eax
80106abf:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
80106ac2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106ac8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
80106acb:	77 49                	ja     80106b16 <inituvm+0x66>
    panic("inituvm: more than a page");
  mem = kalloc();
80106acd:	e8 fe b9 ff ff       	call   801024d0 <kalloc>
  memset(mem, 0, PGSIZE);
80106ad2:	83 ec 04             	sub    $0x4,%esp
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
80106ad5:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106ad7:	68 00 10 00 00       	push   $0x1000
80106adc:	6a 00                	push   $0x0
80106ade:	50                   	push   %eax
80106adf:	e8 ac da ff ff       	call   80104590 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106ae4:	58                   	pop    %eax
80106ae5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106aeb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106af0:	5a                   	pop    %edx
80106af1:	6a 06                	push   $0x6
80106af3:	50                   	push   %eax
80106af4:	31 d2                	xor    %edx,%edx
80106af6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106af9:	e8 52 fc ff ff       	call   80106750 <mappages>
  memmove(mem, init, sz);
80106afe:	89 75 10             	mov    %esi,0x10(%ebp)
80106b01:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106b04:	83 c4 10             	add    $0x10,%esp
80106b07:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106b0a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b0d:	5b                   	pop    %ebx
80106b0e:	5e                   	pop    %esi
80106b0f:	5f                   	pop    %edi
80106b10:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80106b11:	e9 2a db ff ff       	jmp    80104640 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80106b16:	83 ec 0c             	sub    $0xc,%esp
80106b19:	68 71 7a 10 80       	push   $0x80107a71
80106b1e:	e8 6d 98 ff ff       	call   80100390 <panic>
80106b23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b30 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80106b30:	55                   	push   %ebp
80106b31:	89 e5                	mov    %esp,%ebp
80106b33:	57                   	push   %edi
80106b34:	56                   	push   %esi
80106b35:	53                   	push   %ebx
80106b36:	83 ec 0c             	sub    $0xc,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80106b39:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106b40:	0f 85 91 00 00 00    	jne    80106bd7 <loaduvm+0xa7>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80106b46:	8b 75 18             	mov    0x18(%ebp),%esi
80106b49:	31 db                	xor    %ebx,%ebx
80106b4b:	85 f6                	test   %esi,%esi
80106b4d:	75 1a                	jne    80106b69 <loaduvm+0x39>
80106b4f:	eb 6f                	jmp    80106bc0 <loaduvm+0x90>
80106b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b58:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b5e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106b64:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106b67:	76 57                	jbe    80106bc0 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106b69:	8b 55 0c             	mov    0xc(%ebp),%edx
80106b6c:	8b 45 08             	mov    0x8(%ebp),%eax
80106b6f:	31 c9                	xor    %ecx,%ecx
80106b71:	01 da                	add    %ebx,%edx
80106b73:	e8 58 fb ff ff       	call   801066d0 <walkpgdir>
80106b78:	85 c0                	test   %eax,%eax
80106b7a:	74 4e                	je     80106bca <loaduvm+0x9a>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106b7c:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106b7e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
80106b81:	bf 00 10 00 00       	mov    $0x1000,%edi
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106b86:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106b8b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106b91:	0f 46 fe             	cmovbe %esi,%edi
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106b94:	01 d9                	add    %ebx,%ecx
80106b96:	05 00 00 00 80       	add    $0x80000000,%eax
80106b9b:	57                   	push   %edi
80106b9c:	51                   	push   %ecx
80106b9d:	50                   	push   %eax
80106b9e:	ff 75 10             	pushl  0x10(%ebp)
80106ba1:	e8 ca ad ff ff       	call   80101970 <readi>
80106ba6:	83 c4 10             	add    $0x10,%esp
80106ba9:	39 c7                	cmp    %eax,%edi
80106bab:	74 ab                	je     80106b58 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
80106bad:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
80106bb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80106bb5:	5b                   	pop    %ebx
80106bb6:	5e                   	pop    %esi
80106bb7:	5f                   	pop    %edi
80106bb8:	5d                   	pop    %ebp
80106bb9:	c3                   	ret    
80106bba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106bc0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80106bc3:	31 c0                	xor    %eax,%eax
}
80106bc5:	5b                   	pop    %ebx
80106bc6:	5e                   	pop    %esi
80106bc7:	5f                   	pop    %edi
80106bc8:	5d                   	pop    %ebp
80106bc9:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
80106bca:	83 ec 0c             	sub    $0xc,%esp
80106bcd:	68 8b 7a 10 80       	push   $0x80107a8b
80106bd2:	e8 b9 97 ff ff       	call   80100390 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
80106bd7:	83 ec 0c             	sub    $0xc,%esp
80106bda:	68 f8 7a 10 80       	push   $0x80107af8
80106bdf:	e8 ac 97 ff ff       	call   80100390 <panic>
80106be4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106bea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106bf0 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106bf0:	55                   	push   %ebp
80106bf1:	89 e5                	mov    %esp,%ebp
80106bf3:	57                   	push   %edi
80106bf4:	56                   	push   %esi
80106bf5:	53                   	push   %ebx
80106bf6:	83 ec 0c             	sub    $0xc,%esp
80106bf9:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
80106bfc:	85 ff                	test   %edi,%edi
80106bfe:	0f 88 ca 00 00 00    	js     80106cce <allocuvm+0xde>
    return 0;
  if(newsz < oldsz)
80106c04:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106c07:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
80106c0a:	0f 82 82 00 00 00    	jb     80106c92 <allocuvm+0xa2>
    return oldsz;

  a = PGROUNDUP(oldsz);
80106c10:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106c16:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106c1c:	39 df                	cmp    %ebx,%edi
80106c1e:	77 43                	ja     80106c63 <allocuvm+0x73>
80106c20:	e9 bb 00 00 00       	jmp    80106ce0 <allocuvm+0xf0>
80106c25:	8d 76 00             	lea    0x0(%esi),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80106c28:	83 ec 04             	sub    $0x4,%esp
80106c2b:	68 00 10 00 00       	push   $0x1000
80106c30:	6a 00                	push   $0x0
80106c32:	50                   	push   %eax
80106c33:	e8 58 d9 ff ff       	call   80104590 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106c38:	58                   	pop    %eax
80106c39:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106c3f:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106c44:	5a                   	pop    %edx
80106c45:	6a 06                	push   $0x6
80106c47:	50                   	push   %eax
80106c48:	89 da                	mov    %ebx,%edx
80106c4a:	8b 45 08             	mov    0x8(%ebp),%eax
80106c4d:	e8 fe fa ff ff       	call   80106750 <mappages>
80106c52:	83 c4 10             	add    $0x10,%esp
80106c55:	85 c0                	test   %eax,%eax
80106c57:	78 47                	js     80106ca0 <allocuvm+0xb0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106c59:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c5f:	39 df                	cmp    %ebx,%edi
80106c61:	76 7d                	jbe    80106ce0 <allocuvm+0xf0>
    mem = kalloc();
80106c63:	e8 68 b8 ff ff       	call   801024d0 <kalloc>
    if(mem == 0){
80106c68:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80106c6a:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106c6c:	75 ba                	jne    80106c28 <allocuvm+0x38>
      cprintf("allocuvm out of memory\n");
80106c6e:	83 ec 0c             	sub    $0xc,%esp
80106c71:	68 a9 7a 10 80       	push   $0x80107aa9
80106c76:	e8 e5 99 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106c7b:	83 c4 10             	add    $0x10,%esp
80106c7e:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106c81:	76 4b                	jbe    80106cce <allocuvm+0xde>
80106c83:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106c86:	8b 45 08             	mov    0x8(%ebp),%eax
80106c89:	89 fa                	mov    %edi,%edx
80106c8b:	e8 50 fb ff ff       	call   801067e0 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
80106c90:	31 c0                	xor    %eax,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106c92:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c95:	5b                   	pop    %ebx
80106c96:	5e                   	pop    %esi
80106c97:	5f                   	pop    %edi
80106c98:	5d                   	pop    %ebp
80106c99:	c3                   	ret    
80106c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80106ca0:	83 ec 0c             	sub    $0xc,%esp
80106ca3:	68 c1 7a 10 80       	push   $0x80107ac1
80106ca8:	e8 b3 99 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106cad:	83 c4 10             	add    $0x10,%esp
80106cb0:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106cb3:	76 0d                	jbe    80106cc2 <allocuvm+0xd2>
80106cb5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106cb8:	8b 45 08             	mov    0x8(%ebp),%eax
80106cbb:	89 fa                	mov    %edi,%edx
80106cbd:	e8 1e fb ff ff       	call   801067e0 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
80106cc2:	83 ec 0c             	sub    $0xc,%esp
80106cc5:	56                   	push   %esi
80106cc6:	e8 55 b6 ff ff       	call   80102320 <kfree>
      return 0;
80106ccb:	83 c4 10             	add    $0x10,%esp
    }
  }
  return newsz;
}
80106cce:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
80106cd1:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
80106cd3:	5b                   	pop    %ebx
80106cd4:	5e                   	pop    %esi
80106cd5:	5f                   	pop    %edi
80106cd6:	5d                   	pop    %ebp
80106cd7:	c3                   	ret    
80106cd8:	90                   	nop
80106cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ce0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106ce3:	89 f8                	mov    %edi,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106ce5:	5b                   	pop    %ebx
80106ce6:	5e                   	pop    %esi
80106ce7:	5f                   	pop    %edi
80106ce8:	5d                   	pop    %ebp
80106ce9:	c3                   	ret    
80106cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106cf0 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106cf0:	55                   	push   %ebp
80106cf1:	89 e5                	mov    %esp,%ebp
80106cf3:	8b 55 0c             	mov    0xc(%ebp),%edx
80106cf6:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106cf9:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106cfc:	39 d1                	cmp    %edx,%ecx
80106cfe:	73 10                	jae    80106d10 <deallocuvm+0x20>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106d00:	5d                   	pop    %ebp
80106d01:	e9 da fa ff ff       	jmp    801067e0 <deallocuvm.part.0>
80106d06:	8d 76 00             	lea    0x0(%esi),%esi
80106d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106d10:	89 d0                	mov    %edx,%eax
80106d12:	5d                   	pop    %ebp
80106d13:	c3                   	ret    
80106d14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106d20 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106d20:	55                   	push   %ebp
80106d21:	89 e5                	mov    %esp,%ebp
80106d23:	57                   	push   %edi
80106d24:	56                   	push   %esi
80106d25:	53                   	push   %ebx
80106d26:	83 ec 0c             	sub    $0xc,%esp
80106d29:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106d2c:	85 f6                	test   %esi,%esi
80106d2e:	74 59                	je     80106d89 <freevm+0x69>
80106d30:	31 c9                	xor    %ecx,%ecx
80106d32:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106d37:	89 f0                	mov    %esi,%eax
80106d39:	e8 a2 fa ff ff       	call   801067e0 <deallocuvm.part.0>
80106d3e:	89 f3                	mov    %esi,%ebx
80106d40:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106d46:	eb 0f                	jmp    80106d57 <freevm+0x37>
80106d48:	90                   	nop
80106d49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d50:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106d53:	39 fb                	cmp    %edi,%ebx
80106d55:	74 23                	je     80106d7a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106d57:	8b 03                	mov    (%ebx),%eax
80106d59:	a8 01                	test   $0x1,%al
80106d5b:	74 f3                	je     80106d50 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
80106d5d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106d62:	83 ec 0c             	sub    $0xc,%esp
80106d65:	83 c3 04             	add    $0x4,%ebx
80106d68:	05 00 00 00 80       	add    $0x80000000,%eax
80106d6d:	50                   	push   %eax
80106d6e:	e8 ad b5 ff ff       	call   80102320 <kfree>
80106d73:	83 c4 10             	add    $0x10,%esp
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106d76:	39 fb                	cmp    %edi,%ebx
80106d78:	75 dd                	jne    80106d57 <freevm+0x37>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106d7a:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106d7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d80:	5b                   	pop    %ebx
80106d81:	5e                   	pop    %esi
80106d82:	5f                   	pop    %edi
80106d83:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106d84:	e9 97 b5 ff ff       	jmp    80102320 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
80106d89:	83 ec 0c             	sub    $0xc,%esp
80106d8c:	68 dd 7a 10 80       	push   $0x80107add
80106d91:	e8 fa 95 ff ff       	call   80100390 <panic>
80106d96:	8d 76 00             	lea    0x0(%esi),%esi
80106d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106da0 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106da0:	55                   	push   %ebp
80106da1:	89 e5                	mov    %esp,%ebp
80106da3:	56                   	push   %esi
80106da4:	53                   	push   %ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106da5:	e8 26 b7 ff ff       	call   801024d0 <kalloc>
80106daa:	85 c0                	test   %eax,%eax
80106dac:	74 6a                	je     80106e18 <setupkvm+0x78>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106dae:	83 ec 04             	sub    $0x4,%esp
80106db1:	89 c6                	mov    %eax,%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106db3:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106db8:	68 00 10 00 00       	push   $0x1000
80106dbd:	6a 00                	push   $0x0
80106dbf:	50                   	push   %eax
80106dc0:	e8 cb d7 ff ff       	call   80104590 <memset>
80106dc5:	83 c4 10             	add    $0x10,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106dc8:	8b 43 04             	mov    0x4(%ebx),%eax
80106dcb:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106dce:	83 ec 08             	sub    $0x8,%esp
80106dd1:	8b 13                	mov    (%ebx),%edx
80106dd3:	ff 73 0c             	pushl  0xc(%ebx)
80106dd6:	50                   	push   %eax
80106dd7:	29 c1                	sub    %eax,%ecx
80106dd9:	89 f0                	mov    %esi,%eax
80106ddb:	e8 70 f9 ff ff       	call   80106750 <mappages>
80106de0:	83 c4 10             	add    $0x10,%esp
80106de3:	85 c0                	test   %eax,%eax
80106de5:	78 19                	js     80106e00 <setupkvm+0x60>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106de7:	83 c3 10             	add    $0x10,%ebx
80106dea:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106df0:	75 d6                	jne    80106dc8 <setupkvm+0x28>
80106df2:	89 f0                	mov    %esi,%eax
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
    }
  return pgdir;
}
80106df4:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106df7:	5b                   	pop    %ebx
80106df8:	5e                   	pop    %esi
80106df9:	5d                   	pop    %ebp
80106dfa:	c3                   	ret    
80106dfb:	90                   	nop
80106dfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
80106e00:	83 ec 0c             	sub    $0xc,%esp
80106e03:	56                   	push   %esi
80106e04:	e8 17 ff ff ff       	call   80106d20 <freevm>
      return 0;
80106e09:	83 c4 10             	add    $0x10,%esp
    }
  return pgdir;
}
80106e0c:	8d 65 f8             	lea    -0x8(%ebp),%esp
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
80106e0f:	31 c0                	xor    %eax,%eax
    }
  return pgdir;
}
80106e11:	5b                   	pop    %ebx
80106e12:	5e                   	pop    %esi
80106e13:	5d                   	pop    %ebp
80106e14:	c3                   	ret    
80106e15:	8d 76 00             	lea    0x0(%esi),%esi
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
80106e18:	31 c0                	xor    %eax,%eax
80106e1a:	eb d8                	jmp    80106df4 <setupkvm+0x54>
80106e1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106e20 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80106e20:	55                   	push   %ebp
80106e21:	89 e5                	mov    %esp,%ebp
80106e23:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106e26:	e8 75 ff ff ff       	call   80106da0 <setupkvm>
80106e2b:	a3 a4 54 11 80       	mov    %eax,0x801154a4
80106e30:	05 00 00 00 80       	add    $0x80000000,%eax
80106e35:	0f 22 d8             	mov    %eax,%cr3
  switchkvm();
}
80106e38:	c9                   	leave  
80106e39:	c3                   	ret    
80106e3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106e40 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106e40:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106e41:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106e43:	89 e5                	mov    %esp,%ebp
80106e45:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106e48:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e4b:	8b 45 08             	mov    0x8(%ebp),%eax
80106e4e:	e8 7d f8 ff ff       	call   801066d0 <walkpgdir>
  if(pte == 0)
80106e53:	85 c0                	test   %eax,%eax
80106e55:	74 05                	je     80106e5c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106e57:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106e5a:	c9                   	leave  
80106e5b:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
80106e5c:	83 ec 0c             	sub    $0xc,%esp
80106e5f:	68 ee 7a 10 80       	push   $0x80107aee
80106e64:	e8 27 95 ff ff       	call   80100390 <panic>
80106e69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106e70 <copyuvm_cow>:



pde_t*
copyuvm_cow(pde_t* pgdir, uint sz)
{
80106e70:	55                   	push   %ebp
80106e71:	89 e5                	mov    %esp,%ebp
80106e73:	57                   	push   %edi
80106e74:	56                   	push   %esi
80106e75:	53                   	push   %ebx
80106e76:	83 ec 0c             	sub    $0xc,%esp
80106e79:	8b 7d 0c             	mov    0xc(%ebp),%edi
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  // char *mem;

  if((d = setupkvm()) == 0)
80106e7c:	e8 1f ff ff ff       	call   80106da0 <setupkvm>
80106e81:	85 c0                	test   %eax,%eax
80106e83:	74 7d                	je     80106f02 <copyuvm_cow+0x92>
    return 0;

  
  //  d = pgdir;

  for(i = 0; i < sz; i += PGSIZE){
80106e85:	85 ff                	test   %edi,%edi
80106e87:	89 c6                	mov    %eax,%esi
80106e89:	74 6d                	je     80106ef8 <copyuvm_cow+0x88>
80106e8b:	31 db                	xor    %ebx,%ebx
80106e8d:	eb 0b                	jmp    80106e9a <copyuvm_cow+0x2a>
80106e8f:	90                   	nop
80106e90:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106e96:	39 df                	cmp    %ebx,%edi
80106e98:	76 5e                	jbe    80106ef8 <copyuvm_cow+0x88>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106e9a:	8b 45 08             	mov    0x8(%ebp),%eax
80106e9d:	31 c9                	xor    %ecx,%ecx
80106e9f:	89 da                	mov    %ebx,%edx
80106ea1:	e8 2a f8 ff ff       	call   801066d0 <walkpgdir>
80106ea6:	85 c0                	test   %eax,%eax
80106ea8:	74 69                	je     80106f13 <copyuvm_cow+0xa3>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106eaa:	8b 00                	mov    (%eax),%eax
80106eac:	a8 01                	test   $0x1,%al
80106eae:	74 56                	je     80106f06 <copyuvm_cow+0x96>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106eb0:	89 c2                	mov    %eax,%edx
    // if((mem = kalloc()) == 0)
    //   goto bad;
    // memmove(mem, (char*)P2V(pa), PGSIZE);
    
    //Point child page dir to parent page dir
    if(mappages(d, (void*)i, PGSIZE, pa, flags) < 0) {
80106eb2:	83 ec 08             	sub    $0x8,%esp
80106eb5:	25 fd 0f 00 00       	and    $0xffd,%eax
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106eba:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
    // if((mem = kalloc()) == 0)
    //   goto bad;
    // memmove(mem, (char*)P2V(pa), PGSIZE);
    
    //Point child page dir to parent page dir
    if(mappages(d, (void*)i, PGSIZE, pa, flags) < 0) {
80106ec0:	50                   	push   %eax
80106ec1:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106ec6:	89 d0                	mov    %edx,%eax
80106ec8:	89 da                	mov    %ebx,%edx
80106eca:	80 cc 08             	or     $0x8,%ah
80106ecd:	50                   	push   %eax
80106ece:	89 f0                	mov    %esi,%eax
80106ed0:	e8 7b f8 ff ff       	call   80106750 <mappages>
80106ed5:	83 c4 10             	add    $0x10,%esp
80106ed8:	85 c0                	test   %eax,%eax
80106eda:	79 b4                	jns    80106e90 <copyuvm_cow+0x20>

  }
  return d;

bad:
  freevm(d);
80106edc:	83 ec 0c             	sub    $0xc,%esp
80106edf:	56                   	push   %esi
80106ee0:	e8 3b fe ff ff       	call   80106d20 <freevm>
  return 0;
80106ee5:	83 c4 10             	add    $0x10,%esp
80106ee8:	31 c0                	xor    %eax,%eax
}
80106eea:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106eed:	5b                   	pop    %ebx
80106eee:	5e                   	pop    %esi
80106eef:	5f                   	pop    %edi
80106ef0:	5d                   	pop    %ebp
80106ef1:	c3                   	ret    
80106ef2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ef8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;

  
  //  d = pgdir;

  for(i = 0; i < sz; i += PGSIZE){
80106efb:	89 f0                	mov    %esi,%eax
  return d;

bad:
  freevm(d);
  return 0;
}
80106efd:	5b                   	pop    %ebx
80106efe:	5e                   	pop    %esi
80106eff:	5f                   	pop    %edi
80106f00:	5d                   	pop    %ebp
80106f01:	c3                   	ret    
  pte_t *pte;
  uint pa, i, flags;
  // char *mem;

  if((d = setupkvm()) == 0)
    return 0;
80106f02:	31 c0                	xor    %eax,%eax
80106f04:	eb e4                	jmp    80106eea <copyuvm_cow+0x7a>

  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
80106f06:	83 ec 0c             	sub    $0xc,%esp
80106f09:	68 2e 77 10 80       	push   $0x8010772e
80106f0e:	e8 7d 94 ff ff       	call   80100390 <panic>
  
  //  d = pgdir;

  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
80106f13:	83 ec 0c             	sub    $0xc,%esp
80106f16:	68 14 77 10 80       	push   $0x80107714
80106f1b:	e8 70 94 ff ff       	call   80100390 <panic>

80106f20 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80106f20:	55                   	push   %ebp
80106f21:	89 e5                	mov    %esp,%ebp
80106f23:	57                   	push   %edi
80106f24:	56                   	push   %esi
80106f25:	53                   	push   %ebx
80106f26:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106f29:	e8 72 fe ff ff       	call   80106da0 <setupkvm>
80106f2e:	85 c0                	test   %eax,%eax
80106f30:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106f33:	0f 84 c5 00 00 00    	je     80106ffe <copyuvm+0xde>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106f39:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106f3c:	85 c9                	test   %ecx,%ecx
80106f3e:	0f 84 9c 00 00 00    	je     80106fe0 <copyuvm+0xc0>
80106f44:	31 ff                	xor    %edi,%edi
80106f46:	eb 4a                	jmp    80106f92 <copyuvm+0x72>
80106f48:	90                   	nop
80106f49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);

    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106f50:	83 ec 04             	sub    $0x4,%esp
80106f53:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80106f59:	68 00 10 00 00       	push   $0x1000
80106f5e:	53                   	push   %ebx
80106f5f:	50                   	push   %eax
80106f60:	e8 db d6 ff ff       	call   80104640 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80106f65:	58                   	pop    %eax
80106f66:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106f6c:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106f71:	5a                   	pop    %edx
80106f72:	ff 75 e4             	pushl  -0x1c(%ebp)
80106f75:	50                   	push   %eax
80106f76:	89 fa                	mov    %edi,%edx
80106f78:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106f7b:	e8 d0 f7 ff ff       	call   80106750 <mappages>
80106f80:	83 c4 10             	add    $0x10,%esp
80106f83:	85 c0                	test   %eax,%eax
80106f85:	78 69                	js     80106ff0 <copyuvm+0xd0>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106f87:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106f8d:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80106f90:	76 4e                	jbe    80106fe0 <copyuvm+0xc0>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106f92:	8b 45 08             	mov    0x8(%ebp),%eax
80106f95:	31 c9                	xor    %ecx,%ecx
80106f97:	89 fa                	mov    %edi,%edx
80106f99:	e8 32 f7 ff ff       	call   801066d0 <walkpgdir>
80106f9e:	85 c0                	test   %eax,%eax
80106fa0:	74 6d                	je     8010700f <copyuvm+0xef>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106fa2:	8b 00                	mov    (%eax),%eax
80106fa4:	a8 01                	test   $0x1,%al
80106fa6:	74 5a                	je     80107002 <copyuvm+0xe2>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106fa8:	89 c3                	mov    %eax,%ebx
    flags = PTE_FLAGS(*pte);
80106faa:	25 ff 0f 00 00       	and    $0xfff,%eax
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106faf:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    flags = PTE_FLAGS(*pte);
80106fb5:	89 45 e4             	mov    %eax,-0x1c(%ebp)

    if((mem = kalloc()) == 0)
80106fb8:	e8 13 b5 ff ff       	call   801024d0 <kalloc>
80106fbd:	85 c0                	test   %eax,%eax
80106fbf:	89 c6                	mov    %eax,%esi
80106fc1:	75 8d                	jne    80106f50 <copyuvm+0x30>
    }
  }
  return d;

bad:
  freevm(d);
80106fc3:	83 ec 0c             	sub    $0xc,%esp
80106fc6:	ff 75 e0             	pushl  -0x20(%ebp)
80106fc9:	e8 52 fd ff ff       	call   80106d20 <freevm>
  return 0;
80106fce:	83 c4 10             	add    $0x10,%esp
80106fd1:	31 c0                	xor    %eax,%eax
}
80106fd3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106fd6:	5b                   	pop    %ebx
80106fd7:	5e                   	pop    %esi
80106fd8:	5f                   	pop    %edi
80106fd9:	5d                   	pop    %ebp
80106fda:	c3                   	ret    
80106fdb:	90                   	nop
80106fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106fe0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  return d;

bad:
  freevm(d);
  return 0;
}
80106fe3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106fe6:	5b                   	pop    %ebx
80106fe7:	5e                   	pop    %esi
80106fe8:	5f                   	pop    %edi
80106fe9:	5d                   	pop    %ebp
80106fea:	c3                   	ret    
80106feb:	90                   	nop
80106fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
      kfree(mem);
80106ff0:	83 ec 0c             	sub    $0xc,%esp
80106ff3:	56                   	push   %esi
80106ff4:	e8 27 b3 ff ff       	call   80102320 <kfree>
      goto bad;
80106ff9:	83 c4 10             	add    $0x10,%esp
80106ffc:	eb c5                	jmp    80106fc3 <copyuvm+0xa3>
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
80106ffe:	31 c0                	xor    %eax,%eax
80107000:	eb d1                	jmp    80106fd3 <copyuvm+0xb3>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
80107002:	83 ec 0c             	sub    $0xc,%esp
80107005:	68 2e 77 10 80       	push   $0x8010772e
8010700a:	e8 81 93 ff ff       	call   80100390 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
8010700f:	83 ec 0c             	sub    $0xc,%esp
80107012:	68 14 77 10 80       	push   $0x80107714
80107017:	e8 74 93 ff ff       	call   80100390 <panic>
8010701c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107020 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107020:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107021:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107023:	89 e5                	mov    %esp,%ebp
80107025:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107028:	8b 55 0c             	mov    0xc(%ebp),%edx
8010702b:	8b 45 08             	mov    0x8(%ebp),%eax
8010702e:	e8 9d f6 ff ff       	call   801066d0 <walkpgdir>
  if((*pte & PTE_P) == 0)
80107033:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
80107035:	89 c2                	mov    %eax,%edx
80107037:	83 e2 05             	and    $0x5,%edx
8010703a:	83 fa 05             	cmp    $0x5,%edx
8010703d:	75 11                	jne    80107050 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
8010703f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
}
80107044:	c9                   	leave  
  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80107045:	05 00 00 00 80       	add    $0x80000000,%eax
}
8010704a:	c3                   	ret    
8010704b:	90                   	nop
8010704c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
80107050:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
80107052:	c9                   	leave  
80107053:	c3                   	ret    
80107054:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010705a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107060 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107060:	55                   	push   %ebp
80107061:	89 e5                	mov    %esp,%ebp
80107063:	57                   	push   %edi
80107064:	56                   	push   %esi
80107065:	53                   	push   %ebx
80107066:	83 ec 1c             	sub    $0x1c,%esp
80107069:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010706c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010706f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107072:	85 db                	test   %ebx,%ebx
80107074:	75 40                	jne    801070b6 <copyout+0x56>
80107076:	eb 70                	jmp    801070e8 <copyout+0x88>
80107078:	90                   	nop
80107079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107080:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107083:	89 f1                	mov    %esi,%ecx
80107085:	29 d1                	sub    %edx,%ecx
80107087:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010708d:	39 d9                	cmp    %ebx,%ecx
8010708f:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80107092:	29 f2                	sub    %esi,%edx
80107094:	83 ec 04             	sub    $0x4,%esp
80107097:	01 d0                	add    %edx,%eax
80107099:	51                   	push   %ecx
8010709a:	57                   	push   %edi
8010709b:	50                   	push   %eax
8010709c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010709f:	e8 9c d5 ff ff       	call   80104640 <memmove>
    len -= n;
    buf += n;
801070a4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801070a7:	83 c4 10             	add    $0x10,%esp
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
801070aa:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
801070b0:	01 cf                	add    %ecx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801070b2:	29 cb                	sub    %ecx,%ebx
801070b4:	74 32                	je     801070e8 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
801070b6:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801070b8:	83 ec 08             	sub    $0x8,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
801070bb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801070be:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801070c4:	56                   	push   %esi
801070c5:	ff 75 08             	pushl  0x8(%ebp)
801070c8:	e8 53 ff ff ff       	call   80107020 <uva2ka>
    if(pa0 == 0)
801070cd:	83 c4 10             	add    $0x10,%esp
801070d0:	85 c0                	test   %eax,%eax
801070d2:	75 ac                	jne    80107080 <copyout+0x20>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
801070d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
801070d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
801070dc:	5b                   	pop    %ebx
801070dd:	5e                   	pop    %esi
801070de:	5f                   	pop    %edi
801070df:	5d                   	pop    %ebp
801070e0:	c3                   	ret    
801070e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801070e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
801070eb:	31 c0                	xor    %eax,%eax
}
801070ed:	5b                   	pop    %ebx
801070ee:	5e                   	pop    %esi
801070ef:	5f                   	pop    %edi
801070f0:	5d                   	pop    %ebp
801070f1:	c3                   	ret    
