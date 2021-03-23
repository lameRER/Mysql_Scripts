<?php
var current = d[k];
                                    var isOperation = current['serviceType'] === '4' ? true : false;
                                    var jobTicketData = current['jobTicket'];

                                    var bubble = 'ballgrey.png',
                                        bubble_title = 'Не отправленный',
                                        isWaiting = false;

                                    if (d[k]['begDate']) {
                                        bubble = 'ballyellow.png';
                                        bubble_title = 'В работе';
                                    }

                                    if ((current['signature'] == 1 && current['status'] == 2) || isBlockEvent() || app.lockEvent.isBlockInterface()) {
                                        bubble = 'ballblue.png';
                                        bubble_title = 'Выполнен';
                                    }

                                    if (isDestinations && !isHealing) {
                                        bubble = 'ballgrey.png';
                                        bubble_title = 'Ожидание';
                                        isWaiting = true;

                                        var status = (jobTicketData) ? current['jobTicket']['status'] : 0,
                                            denial = (jobTicketData) ? current['jobTicket']['denial'] : 0;

                                        if (status == 1 || status == 3) {
                                            isWaiting = false;
                                            bubble = 'ballyellow.png';
                                            bubble_title = 'Подтвержден';
                                        } else if (status == 4) {
                                            isWaiting = false;
                                            bubble = 'ballblue.png';
                                            bubble_title = 'Выполняется';
                                        }

                                        if ((current['signature'] == 1 && current['status'] == 2) || app.lockEvent.isBlockInterface()) {
                                            isWaiting = false;
                                            bubble = 'ballblue.png';
                                            bubble_title = 'Выполнен';
                                            if (denial > 0) {
                                                bubble = 'ballred.png';
                                                bubble_title = 'Отказ';
                                            }
                                        }
                                    }
?>