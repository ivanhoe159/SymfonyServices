<?php

namespace App\Controller;

use App\Entity\Service;
use App\Entity\Transactions;
use App\Entity\Usermoney;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;

class BalanceController extends AbstractController
{
    public function payAllServices(ManagerRegistry $doctrine)
    {
        $entity = $doctrine->getManager();
        $repository = $doctrine->getRepository(service::class);
        $services = $repository->findBy(['active' => 1],);
        foreach($services as $service)
        {
            $balancer = $doctrine->getRepository(usermoney::class)->find(1);
            $balance = $balancer->getBalance();
            $entity = $doctrine->getManager();
            $transaction = new Transactions();
            $transaction->setService($service->getName());
            $transaction->setTransdate(date_create_from_format('Y-m-d', date("Y-m-d")));
            $transaction->setCost($service->getCost() * $service->getValue() * -1);
            $transaction->setBalance($balance - $service->getCost() * $service->getValue());
            $balancer->setBalance($balance - $service->getCost() * $service->getValue());
            $entity->flush();
            $entity->persist($transaction);
            $entity->flush();
        }
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        $repository = $doctrine->getRepository(transactions::class);
        $transactions = $repository->findAll();
        $repository = $doctrine->getRepository(service::class);
        $services = $repository->findAll();
        return $this->render('balance.html.twig', [
            'budget' => $budget,
            'transactions' => $transactions,
            'services' => $services,
        ]);
    }

    public function addMoney(ManagerRegistry $doctrine, Request $request)
    {
        $id = 1;
        $summa = $request->request->get('summ');
        $entity = $doctrine->getManager();
        $balance = $doctrine->getRepository(usermoney::class)->find($id);
        $balance->setBalance($balance->getBalance() + $summa);
        $entity->flush();
        $transaction = new Transactions();
        $transaction->setService('Пополнение счета');
        $transaction->setTransdate(date_create_from_format('Y-m-d', date("Y-m-d")));
        $transaction->setCost($summa);
        $transaction->setBalance($balance->getBalance());
        $entity->persist($transaction);
        $entity->flush();
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        $repository = $doctrine->getRepository(transactions::class);
        $transactions = $repository->findAll();
        $repository = $doctrine->getRepository(service::class);
        $services = $repository->findAll();
        return $this->render('balance.html.twig', [
            'budget' => $budget,
            'transactions' => $transactions,
            'services' => $services,
        ]);
    }

    public function sortTransactions(ManagerRegistry $doctrine, Request $request)
    {
        $sname = $request->request->get('selects');
        $date_start = $request->request->get('date_start');
        $date_finish = $request->request->get('date_finish');
        $repository = $doctrine->getRepository(transactions::class);
        $transactions = $repository->sortTransactions($date_start, $date_finish, $sname);
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        $repository = $doctrine->getRepository(service::class);
        $services = $repository->findAll();
        return $this->render('balance.html.twig', [
            'budget' => $budget,
            'transactions' => $transactions,
            'services' => $services,
        ]);
    }
}